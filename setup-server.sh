#!/bin/bash

# Server Setup Script for Fresh Ubuntu on Hetzner
# This script sets up Docker, Caddy, and necessary tools

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   print_error "This script must be run as root"
   exit 1
fi

print_status "🚀 Setting up server for doorworld deployment..."

# Update system
print_status "Updating system packages..."
apt update
apt upgrade -y

# Install essential packages
print_status "Installing essential packages..."
apt install -y curl wget git vim htop unzip software-properties-common \
    apt-transport-https ca-certificates gnupg lsb-release ufw fail2ban

# Configure firewall
print_status "Configuring firewall..."
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow 80
ufw allow 443
ufw allow 3420  # Node.js app (temporary for testing)
ufw --force enable

# Install Docker
print_status "Installing Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=\$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Install Docker Compose (standalone)
print_status "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=\$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
curl -L "https://github.com/docker/compose/releases/download/\$DOCKER_COMPOSE_VERSION/docker-compose-\$(uname -s)-\$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install Caddy
print_status "Installing Caddy web server..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
apt update
apt install -y caddy

# Configure Caddy
print_status "Configuring Caddy..."
systemctl enable caddy
systemctl start caddy

# Create deployment directory
print_status "Creating deployment directory..."
mkdir -p /opt/doorworld
chown root:root /opt/doorworld
chmod 755 /opt/doorworld

# Configure fail2ban
print_status "Configuring fail2ban..."
cat > /etc/fail2ban/jail.local << 'EOF'
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 3
backend = systemd

[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
maxretry = 3
EOF

systemctl enable fail2ban
systemctl start fail2ban

# Create a non-root user for deployment (optional)
print_status "Creating deployment user..."
if ! id "deploy" &>/dev/null; then
    useradd -m -s /bin/bash -G docker deploy
    mkdir -p /home/deploy/.ssh
    chmod 700 /home/deploy/.ssh
    chown deploy:deploy /home/deploy/.ssh
    print_success "Created 'deploy' user (member of docker group)"
else
    print_status "User 'deploy' already exists"
fi

# Configure system limits
print_status "Configuring system limits..."
cat >> /etc/security/limits.conf << 'EOF'
* soft nofile 65536
* hard nofile 65536
* soft nproc 32768
* hard nproc 32768
EOF

# Configure kernel parameters
cat >> /etc/sysctl.conf << 'EOF'
# Network optimizations
net.core.somaxconn = 1024
net.core.netdev_max_backlog = 5000
net.ipv4.tcp_max_syn_backlog = 1024
net.ipv4.tcp_fin_timeout = 15
net.ipv4.tcp_keepalive_time = 300
EOF

sysctl -p

# Set up log rotation for Docker
print_status "Setting up Docker log rotation..."
mkdir -p /etc/docker
cat > /etc/docker/daemon.json << 'EOF'
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  },
  "default-address-pools": [
    {"base": "172.30.0.0/16", "size": 24}
  ]
}
EOF

systemctl restart docker

# Install monitoring tools
print_status "Installing monitoring tools..."
apt install -y htop iotop nethogs ncdu tree

# Create maintenance script
print_status "Creating maintenance script..."
cat > /usr/local/bin/system-maintenance << 'EOF'
#!/bin/bash
echo "🧹 Running system maintenance..."

# Clean package cache
apt autoremove -y
apt autoclean

# Clean Docker
docker system prune -af --volumes

# Clean logs older than 7 days
find /var/log -type f -name "*.log" -mtime +7 -delete

# Update system
apt update && apt upgrade -y

echo "✅ Maintenance completed!"
EOF

chmod +x /usr/local/bin/system-maintenance

# Create a basic monitoring script
cat > /usr/local/bin/server-status << 'EOF'
#!/bin/bash
echo "🖥️  Server Status Report"
echo "======================="
echo "📅 Date: \$(date)"
echo "⏰ Uptime: \$(uptime -p)"
echo "💾 Memory: \$(free -h | grep '^Mem:' | awk '{print \$3 "/" \$2}')"
echo "💿 Disk: \$(df -h / | tail -1 | awk '{print \$3 "/" \$2 " (" \$5 " used)"}')"
echo "🐳 Docker: \$(docker ps --format 'table {{.Names}}\t{{.Status}}' | tail -n +2 | wc -l) containers running"
echo ""
echo "🐳 Docker containers:"
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
echo ""
echo "🔥 Recent logs (last 10 lines):"
docker compose -f /opt/doorworld/docker-compose.yml logs --tail=10 2>/dev/null || echo "No Docker Compose logs available"
EOF

chmod +x /usr/local/bin/server-status

print_success "✅ Server setup completed!"
print_status "📋 Summary:"
print_status "  • Docker and Docker Compose installed"
print_status "  • Caddy web server installed and running"
print_status "  • Firewall configured (SSH, HTTP, HTTPS)"
print_status "  • fail2ban configured for security"
print_status "  • System optimizations applied"
print_status "  • Monitoring tools installed"
print_status ""
print_success "🎉 Server is ready for deployment!"
print_status "Next steps:"
print_status "1. Copy your Caddyfile to /etc/caddy/Caddyfile"
print_status "2. Run your deployment script"
print_status "3. Configure your domain DNS"
print_status ""
print_status "Useful commands:"
print_status "  • server-status       - Show server status"
print_status "  • system-maintenance  - Run system maintenance"
print_status "  • systemctl status caddy - Check Caddy status"
print_status "  • docker ps           - Show running containers"
print_status ""
print_warning "⚠️  Remember to:"
print_warning "  • Change default passwords"
print_warning "  • Configure your domain in Caddyfile"
print_warning "  • Set up regular backups"