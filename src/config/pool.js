const { Pool } = require('pg');
require('dotenv').config();

const isProduction = process.env.NODE_ENV === 'production';
const connectionString = process.env.DATABASE_URL || process.env.DB_URL;

const poolConfig = connectionString
  ? {
      connectionString,
      ssl: isProduction ? {
        require: true,
        rejectUnauthorized: false
      } : false,
      max: 10,
      idleTimeoutMillis: 30000,
      connectionTimeoutMillis: 2000,
    }
  : {
      database: process.env.DB_NAME || 'doorworld_db',
      user: process.env.DB_USER || 'postgres',
      password: process.env.DB_PASSWORD || 'password',
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 5432,
      ssl: isProduction ? {
        require: true,
        rejectUnauthorized: false
      } : false,
      max: 10,
      idleTimeoutMillis: 30000,
      connectionTimeoutMillis: 2000,
    };

// Shared PostgreSQL connection pool
const pool = new Pool(poolConfig);

module.exports = pool;