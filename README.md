# doorworld Door Specification System

A complete door specification and quotation system with PostgreSQL backend and React frontend.

## 🏗️ Project Structure

```
doorworld/                    # React Frontend (Port 3000)
├── src/
├── package.json
└── ...

doorworld-backend/           # Node.js Backend (Port 3420)
├── src/
├── backup/               # Firebase export data
├── package.json
└── ...
```

## 📋 Prerequisites

Before starting, ensure you have these installed:

### Required Software

1. **Node.js** (v14 or higher)

   ```bash
   # Check version
   node --version
   yarn --version
   ```

2. **PostgreSQL** (v12 or higher)

   ```bash
   # Check version
   psql --version
   ```

3. **Git** (for cloning/pulling updates)
   ```bash
   git --version
   ```

### Optional Tools

- **pgAdmin** or **DBeaver** for database management
- **Postman** or **Insomnia** for API testing

## 🚀 Quick Start Guide

### Step 1: Setup PostgreSQL Database

1. **Install PostgreSQL** (if not installed)

   - **macOS**: `brew install postgresql`
   - **Ubuntu**: `sudo apt install postgresql postgresql-contrib`
   - **Windows**: Download from [postgresql.org](https://www.postgresql.org/download/)

2. **Start PostgreSQL service**

   ```bash
   # macOS (Homebrew)
   brew services start postgresql

   # Ubuntu
   sudo systemctl start postgresql

   # Windows
   # Start via Services or pgAdmin
   ```

3. **Create database and user**

   ```bash
   # Connect to PostgreSQL
   psql postgres

   # In psql console:
   CREATE DATABASE doorworld_db;
   CREATE USER doorworld_user WITH PASSWORD 'your_secure_password';
   GRANT ALL PRIVILEGES ON DATABASE doorworld_db TO doorworld_user;
   \q
   ```

### Step 2: Setup Backend

1. **Navigate to backend directory**

   ```bash
   cd /Users/kip/doorworld-backend
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Configure environment**

   ```bash
   # Copy environment template
   cp .env.example .env

   # Edit .env file with your settings
   nano .env
   ```

4. **Environment variables** (`.env` file):

   ```env
   # Database Configuration
   DB_NAME=doorworld_db
   DB_USER=doorworld_user
   DB_PASSWORD=your_secure_password
   DB_HOST=localhost
   DB_PORT=5432

   # JWT Configuration
   JWT_SECRET=your-super-secret-jwt-key-change-this-in-production

   # Node Environment
   NODE_ENV=development
   ```

5. **Initialize database**

   ```bash
   # Create tables and relationships
   npm run db:init

   # Seed with product data from Firebase backup
   npm run db:seed
   ```

6. **Start backend server**

   ```bash
   # Development mode (with auto-restart)
   npm run dev

   # Or production mode
   npm start
   ```

   ✅ Backend should now be running on **http://localhost:3420**

### Step 3: Setup Frontend

1. **Navigate to frontend directory**

   ```bash
   cd /Users/kip/doorworld
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Start frontend development server**

   ```bash
   npm start
   ```

   ✅ Frontend should now be running on **http://localhost:3000**

### Step 4: Verify Setup

1. **Check backend health**

   ```bash
   curl http://localhost:3420/products/categories
   ```

2. **Access frontend**

   - Open browser to **http://localhost:3000**
   - You should see the doorworld login page

3. **Create admin user** (via backend API)

   ```bash
   curl -X POST http://localhost:3420/users/create \
     -H "Content-Type: application/json" \
     -d '{
       "email": "admin@doorworld.lt",
       "password": "admin123",
       "displayName": "Administrator"
     }'
   ```

4. **Login to frontend**
   - Email: `admin@doorworld.lt`
   - Password: `admin123`

## 📊 Database Management

### Available Scripts

```bash
# Backend directory commands
npm run db:init         # Initialize database tables
npm run db:seed         # Seed with product data
npm run db:reset        # Drop and recreate everything
npm run dev            # Start development server
npm start              # Start production server
```

### Database Schema

The system creates these main tables:

- `users` - User accounts and permissions
- `categories` - Product categories
- `products` - Product catalog
- `specifications` - Door specifications
- `drafts` - Draft specifications
- `translations` - UI translations

### Manual Database Access

```bash
# Connect to database
psql -h localhost -U doorworld_user -d doorworld_db

# View tables
\dt

# View users
SELECT email, "displayName", "isAdmin" FROM users;

# Exit
\q
```

## 🔧 Configuration

### Backend Configuration

**File**: `/Users/kip/doorworld-backend/.env`

```env
# Database
DB_NAME=doorworld_db
DB_USER=doorworld_user
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432

# Security
JWT_SECRET=your-jwt-secret-key

# Environment
NODE_ENV=development
```

### Frontend Configuration

**File**: `/Users/kip/doorworld/src/common/constants.js`

```javascript
API: {
  HOST: "http://localhost:3420",  // Backend URL
}
```

## 🎯 Available Features

### ✅ Implemented Features

- **Authentication**: JWT-based login/logout
- **User Management**: Create, update, delete users
- **Product Catalog**: Categories, products, glazings
- **Specifications**: Create, edit, share door specifications
- **Drafts**: Auto-save and manual draft management
- **Translations**: Multi-language support (EN/LT)
- **Excel Export**: Export specifications to Excel
- **Admin Panel**: User and content management

### 🔄 Data Migration

The system includes migration from Firebase:

- Product catalog seeded from Firebase backup
- User data structure maintained
- Translation system compatible

## 🧪 Testing

### Backend API Testing

```bash
# Test authentication
curl -X POST http://localhost:3420/users/login \
  -H "Content-Type: application/json" \
  -d '{"email": "admin@doorworld.lt", "password": "admin123"}'

# Test product catalog
curl http://localhost:3420/products/categories

# Test translations
curl http://localhost:3420/translations?language=en
```

### Frontend Testing

1. **Login Flow**

   - Navigate to http://localhost:3000
   - Login with admin credentials
   - Verify dashboard loads

2. **Create Specification**

   - Go to "New Specification"
   - Select door model and options
   - Save specification

3. **User Management** (Admin only)
   - Go to "Users" section
   - Create new user
   - Update permissions

## 🚨 Troubleshooting

### Common Issues

#### Database Connection Error

```
Error: connect ECONNREFUSED 127.0.0.1:5432
```

**Solution**:

- Ensure PostgreSQL is running: `brew services start postgresql`
- Check credentials in `.env` file
- Verify database exists: `psql -l`

#### JWT Secret Warning

```
JWT_SECRET not set, using default
```

**Solution**: Set JWT_SECRET in `.env` file

#### Frontend API Errors

```
Network Error / 500 Internal Server Error
```

**Solution**:

- Ensure backend is running on port 3420
- Check backend logs for errors
- Verify API endpoints in browser network tab

#### Port Already in Use

```
Error: listen EADDRINUSE :::3420
```

**Solution**:

- Kill process: `lsof -ti:3420 | xargs kill -9`
- Or use different port in configuration

### Logs and Debugging

**Backend Logs**:

```bash
# View backend logs
cd /Users/kip/doorworld-backend
npm run dev
# Watch console output
```

**Database Logs**:

```bash
# PostgreSQL logs location (macOS)
tail -f /usr/local/var/log/postgresql.log
```

**Frontend Console**:

- Open browser Developer Tools (F12)
- Check Console and Network tabs

## 📦 Production Deployment

### Backend Deployment

1. **Environment Setup**

   ```bash
   NODE_ENV=production
   DB_HOST=your-production-db-host
   JWT_SECRET=your-production-secret
   ```

2. **Build and Deploy**
   ```bash
   npm run build  # If build script exists
   npm start
   ```

### Frontend Deployment

1. **Build for Production**

   ```bash
   cd /Users/kip/doorworld
   npm run build
   ```

2. **Deploy Build**
   - Copy `build/` folder to web server
   - Configure reverse proxy to backend
   - Update API host in constants.js

### Database Migration

```bash
# Backup development data
pg_dump doorworld_db > doorworld_backup.sql

# Restore to production
psql production_db < doorworld_backup.sql
```

## 🔐 Security Considerations

### Production Security

1. **Change Default Credentials**

   - Update admin password
   - Use strong JWT secret
   - Enable HTTPS

2. **Environment Variables**

   - Never commit `.env` files
   - Use environment-specific configs
   - Rotate JWT secrets regularly

3. **Database Security**
   - Use dedicated database user
   - Enable connection encryption
   - Regular security updates

## 📚 Additional Resources

### Documentation

- [Backend API Documentation](./BACKEND_API_DOCUMENTATION.md)
- [Frontend Migration Guide](../doorworld/FRONTEND_MIGRATION_GUIDE.md)
- [Database Schema](./DATABASE_SCHEMA.md)

### Support

- **Issues**: Report bugs via GitHub issues
- **API Testing**: Use Postman collection (if available)
- **Database**: Use pgAdmin for visual management

## 🎉 Success Checklist

- [ ] PostgreSQL installed and running
- [ ] Backend dependencies installed
- [ ] Database initialized and seeded
- [ ] Backend running on port 3420
- [ ] Frontend dependencies installed
- [ ] Frontend running on port 3000
- [ ] Admin user created
- [ ] Can login to frontend
- [ ] Can create specifications
- [ ] Excel export working

## 📞 Getting Help

If you encounter issues:

1. **Check Prerequisites** - Ensure all required software is installed
2. **Verify Configuration** - Double-check .env files and constants
3. **Review Logs** - Check backend and database logs for errors
4. **Test APIs** - Use curl or Postman to test backend endpoints
5. **Clear Cache** - Clear browser cache and restart services

---

**Happy building! 🚀**
