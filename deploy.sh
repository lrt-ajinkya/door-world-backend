#!/bin/bash

# Production Deployment Script for Hetzner Server
# Server IP: 46.62.155.60

set -e  # Exit on any error

# Configuration
SERVER_IP="46.62.155.60"
SERVER_USER="root"
APP_NAME="doorworld-backend"
DEPLOY_PATH="/opt/doorworld"

echo "🚀 Starting deployment to Hetzner server..."

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

# Check if we can connect to the server
print_status "Testing connection to server..."
if ! ssh -o ConnectTimeout=10 -o BatchMode=yes $SERVER_USER@$SERVER_IP exit 2>/dev/null; then
    print_error "Cannot connect to server $SERVER_IP"
    print_error "Please check your SSH key configuration"
    exit 1
fi
print_success "Successfully connected to server"

# Create deployment directory
print_status "Creating deployment directory..."
ssh $SERVER_USER@$SERVER_IP "mkdir -p $DEPLOY_PATH"

# Copy files to server
print_status "Copying application files..."
rsync -avz --delete \
    --exclude='.git' \
    --exclude='node_modules' \
    --exclude='logs' \
    --exclude='.env' \
    ./ $SERVER_USER@$SERVER_IP:$DEPLOY_PATH/

# Copy environment file if it doesn't exist
print_status "Setting up environment configuration..."
ssh $SERVER_USER@$SERVER_IP "
    if [ ! -f $DEPLOY_PATH/.env ]; then
        cp $DEPLOY_PATH/.env.production $DEPLOY_PATH/.env
        echo 'Created .env file from .env.production'
        echo 'IMPORTANT: Please update the JWT_SECRET and DB_PASSWORD in .env file!'
    else
        echo '.env file already exists, skipping...'
    fi
"

# Deploy with Docker Compose
print_status "Building and starting Docker containers..."
ssh $SERVER_USER@$SERVER_IP "
    cd $DEPLOY_PATH
    
    # Generate secure passwords if using defaults
    if ! grep -q 'doorworld_secure_password_2024' .env; then
        echo 'Using existing passwords from .env file'
    else
        echo 'Generating secure passwords...'
        DB_PASS=\$(openssl rand -base64 32 | tr -d '=+/' | cut -c1-25)
        JWT_SECRET=\$(openssl rand -base64 64 | tr -d '=+/' | cut -c1-50)
        
        sed -i \"s/doorworld_secure_password_2024/\$DB_PASS/g\" .env
        sed -i \"s/your_very_secure_jwt_secret_key_production_2024/\$JWT_SECRET/g\" .env
        
        echo 'Generated new secure passwords'
    fi
    
    # Start services
    docker compose down || true
    docker compose build --no-cache
    docker compose up -d
    
    # Wait for services to be healthy
    echo 'Waiting for services to start...'
    sleep 30
    
    # Check if services are running
    if docker compose ps | grep -q 'Up (healthy)'; then
        echo '✅ Services are running and healthy'
    else
        echo '⚠️  Services status:'
        docker compose ps
    fi
"

# Test the deployment
print_status "Testing deployment..."
sleep 10

if curl -s -f http://$SERVER_IP:3420/health > /dev/null; then
    print_success "✅ Application is responding!"
    print_success "Health check: http://$SERVER_IP:3420/health"
else
    print_warning "⚠️  Application may still be starting up"
    print_status "Check logs with: ssh $SERVER_USER@$SERVER_IP 'cd $DEPLOY_PATH && docker compose logs -f'"
fi

print_success "🎉 Deployment completed!"
print_status "Application URL: http://$SERVER_IP:3420"
print_status "Health check: http://$SERVER_IP:3420/health"
print_warning "Don't forget to:"
print_warning "1. Update your .env file with secure passwords"
print_warning "2. Configure Caddy reverse proxy"
print_warning "3. Set up SSL certificate"

echo ""
echo "Useful commands:"
echo "  View logs: ssh $SERVER_USER@$SERVER_IP 'cd $DEPLOY_PATH && docker compose logs -f'"
echo "  Restart:   ssh $SERVER_USER@$SERVER_IP 'cd $DEPLOY_PATH && docker compose restart'"
echo "  Stop:      ssh $SERVER_USER@$SERVER_IP 'cd $DEPLOY_PATH && docker compose down'"