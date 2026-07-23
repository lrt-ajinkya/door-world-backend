# doorworld Backend Deployment Guide

## 🚀 Quick Deployment

### Prerequisites

- SSH access to Hetzner server (46.62.155.60)
- Your SSH key configured for root access

### Step 1: Setup Server (First Time Only)

```bash
npm run deploy:setup
```

This will:

- Install Docker and Docker Compose
- Install and configure Caddy
- Set up firewall and security
- Configure system optimizations

### Step 2: Deploy Application

```bash
npm run deploy
```

This will:

- Build and deploy Docker containers
- Set up PostgreSQL database
- Start the application
- Run health checks

## 📋 Manual Deployment Steps

### 1. Server Setup (Ubuntu 22.04)

```bash
# Copy and run setup script
scp setup-server.sh root@46.62.155.60:~
ssh root@46.62.155.60 'chmod +x setup-server.sh && ./setup-server.sh'
```

### 2. Configure Caddy (Optional - for SSL/Domain)

```bash
# Copy Caddyfile to server
scp Caddyfile.example root@46.62.155.60:/etc/caddy/Caddyfile

# Edit domain in Caddyfile
ssh root@46.62.155.60 'nano /etc/caddy/Caddyfile'

# Restart Caddy
ssh root@46.62.155.60 'systemctl restart caddy'
```

### 3. Deploy Application

```bash
# Run deployment script
./deploy.sh
```

## 🔧 Configuration

### Environment Variables

Update `.env` on the server with:

- Strong `JWT_SECRET`
- Secure `DB_PASSWORD`
- Your domain for `CORS_ORIGIN`

### Database Initialization

The database will be automatically initialized from your backup file in `backup/SQL/doorworld_db.sql`

## 🐳 Docker Services

### Services Running:

- **doorworld-backend**: Node.js application (port 3420)
- **doorworld-db**: PostgreSQL 15 database
- **caddy**: Reverse proxy with SSL

### Docker Commands:

```bash
# On server
cd /opt/doorworld

# View logs
docker compose logs -f

# Restart services
docker compose restart

# Stop services
docker compose down

# Start services
docker compose up -d

# Rebuild and restart
docker compose down
docker compose build --no-cache
docker compose up -d
```

## 📊 Monitoring

### Health Checks

- Application: `http://46.62.155.60:3420/health`
- Caddy: `http://46.62.155.60:3421/health`

### Server Status

```bash
ssh root@46.62.155.60 'server-status'
```

### Maintenance

```bash
ssh root@46.62.155.60 'system-maintenance'
```

## 🔒 Security Features

### Implemented:

- ✅ Non-root Docker containers
- ✅ UFW firewall configured
- ✅ fail2ban for SSH protection
- ✅ Security headers in Caddy
- ✅ Automatic SSL with Let's Encrypt
- ✅ Docker log rotation
- ✅ System resource limits

### Firewall Rules:

- SSH (22)
- HTTP (80)
- HTTPS (443)
- App (3420) - for testing only

## 🔄 CI/CD Integration

### GitHub Actions (Example)

```yaml
name: Deploy to Hetzner
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Deploy
        run: |
          echo "${{ secrets.SSH_KEY }}" > key
          chmod 600 key
          ssh -i key -o StrictHostKeyChecking=no root@46.62.155.60 "
            cd /opt/doorworld &&
            git pull origin main &&
            docker compose down &&
            docker compose build --no-cache &&
            docker compose up -d
          "
```

## 🚨 Troubleshooting

### Common Issues:

1. **Container won't start**

   ```bash
   docker compose logs app
   ```

2. **Database connection failed**

   ```bash
   docker compose logs db
   ```

3. **SSL issues**

   ```bash
   systemctl status caddy
   journalctl -u caddy -f
   ```

4. **Port not accessible**
   ```bash
   ufw status
   netstat -tulpn | grep :3420
   ```

### Recovery Commands:

```bash
# Complete reset
cd /opt/doorworld
docker compose down -v
docker system prune -af
docker compose up -d

# Database reset (will lose data!)
docker compose down -v
docker volume rm doorworld_pgdata
docker compose up -d
```

## 📱 Production URLs

### Direct Access:

- Health: `http://46.62.155.60:3420/health`
- API: `http://46.62.155.60:3420/api/...`

### With Domain (after Caddy setup):

- Health: `https://yourdomain.com/health`
- API: `https://yourdomain.com/api/...`

## 📝 Notes

- Database data is persisted in Docker volume `doorworld_pgdata`
- Application logs are automatically rotated
- Backup your `.env` file and database regularly
- Monitor disk space and memory usage
- Update Docker images periodically for security

## 🆘 Support

If you encounter issues:

1. Check the logs: `docker compose logs -f`
2. Verify services: `docker compose ps`
3. Check server status: `server-status`
4. Review firewall: `ufw status`
