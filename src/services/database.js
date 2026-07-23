const pool = require('../config/pool');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
require('dotenv').config();

const JWT_SECRET = process.env.JWT_SECRET || 'your-secret-key';

async function listAllUsers(nextPageToken) {
  const client = await pool.connect();
  try {
    const limit = 1000;
    const offset = nextPageToken ? parseInt(nextPageToken) : 0;
    
    const countResult = await client.query('SELECT COUNT(*) FROM users');
    const totalCount = parseInt(countResult.rows[0].count);
    
    const result = await client.query(
      'SELECT * FROM users ORDER BY created_at DESC LIMIT $1 OFFSET $2',
      [limit, offset]
    );

    return {
      users: result.rows,
      pageToken: totalCount > offset + limit ? (offset + limit).toString() : null
    };
  } catch (error) {
    console.log('Error listing users:', error);
    throw error;
  } finally {
    client.release();
  }
}

async function createUser(params) {
  const { 
    email,
    password,
    displayName,
    canChangePrice,
    markup
  } = params;

  const client = await pool.connect();
  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    
    // Generate a simple ID
    const userId = `user_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
    
    const result = await client.query(
      'INSERT INTO users (id, email, password, "displayName", "canChangePrice", markup, created_at) VALUES ($1, $2, $3, $4, $5, $6, NOW()) RETURNING id, email, "displayName", "canChangePrice", markup, created_at',
      [userId, email, hashedPassword, displayName, canChangePrice || '', markup || '']
    );

    return result.rows[0];
  } catch (error) {
    console.log(error);
    throw error;
  } finally {
    client.release();
  }
}

async function updateUser(params) {
  const {
    uid,
    email,
    displayName,
    moreData,
  } = params;

  const client = await pool.connect();
  try {
    const result = await client.query(
      'UPDATE users SET email = $1, "displayName" = $2, "canChangePrice" = $3, updated_at = NOW() WHERE id = $4 RETURNING id, email, "displayName", "canChangePrice", markup, created_at, updated_at',
      [email, displayName, moreData?.canChangePrice || '', uid]
    );

    if (result.rows.length === 0) {
      throw new Error('User not found');
    }

    return result.rows[0];
  } catch (error) {
    console.log(error);
    throw error;
  } finally {
    client.release();
  }
}

async function deleteUser(params) {
  const { uid } = params;
  
  const client = await pool.connect();
  try {
    const result = await client.query('DELETE FROM users WHERE id = $1', [uid]);
    
    if (result.rowCount === 0) {
      throw new Error('User not found');
    }

    return { success: true };
  } catch (error) {
    throw error;
  } finally {
    client.release();
  }
}

async function getMoreUserDetails(params) {
  const { uid } = params;
  
  const client = await pool.connect();
  try {
    const result = await client.query(
      'SELECT * FROM users WHERE id = $1',
      [uid]
    );

    return result.rows.length > 0 ? result.rows[0] : {};
  } catch (error) {
    throw error;
  } finally {
    client.release();
  }
}

async function updateMargins(params) {
  const {
    uid,
    moreData,
  } = params;

  const client = await pool.connect();
  try {
    const result = await client.query(
      'UPDATE users SET markup = $1, updated_at = NOW() WHERE id = $2',
      [JSON.stringify(moreData?.price || {}), uid]
    );
    
    if (result.rowCount === 0) {
      throw new Error('User not found');
    }

    return { success: true };
  } catch (error) {
    console.log(error);
    throw error;
  } finally {
    client.release();
  }
}

async function authenticateUser(email, password) {
  const client = await pool.connect();
  try {
    const result = await client.query(
      'SELECT * FROM users WHERE email = $1',
      [email]
    );
    
    if (result.rows.length === 0) {
      throw new Error('User not found');
    }

    const user = result.rows[0];
    const isValidPassword = await bcrypt.compare(password, user.password);
    
    if (!isValidPassword) {
      throw new Error('Invalid password');
    }

    const token = jwt.sign(
      { userId: user.id, email: user.email, isAdmin: user.isAdmin },
      JWT_SECRET,
      { expiresIn: '24h' }
    );

    delete user.password;

    return {
      user,
      token
    };
  } catch (error) {
    throw error;
  } finally {
    client.release();
  }
}

async function verifyToken(token) {
  const client = await pool.connect();
  try {
    const decoded = jwt.verify(token, JWT_SECRET);
    const result = await client.query(
      'SELECT * FROM users WHERE id = $1',
      [decoded.userId]
    );
    
    if (result.rows.length === 0) {
      throw new Error('User not found');
    }

    return result.rows[0];
  } catch (error) {
    throw error;
  } finally {
    client.release();
  }
}

async function ensureDemoUser() {
  const demoEmail = 'demo@demo.com';
  const demoPassword = 'demo';

  try {
    const client = await pool.connect();

    try {
      const hashedPassword = await bcrypt.hash(demoPassword, 10);
      const userId = `user_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;

      await client.query(
        `
          INSERT INTO users (id, email, password, "displayName", "canChangePrice", "isAdmin", created_at, updated_at)
          VALUES ($1, $2, $3, $4, $5, $6, NOW(), NOW())
          ON CONFLICT (email) DO UPDATE SET
            password = EXCLUDED.password,
            "displayName" = EXCLUDED."displayName",
            "canChangePrice" = EXCLUDED."canChangePrice",
            "isAdmin" = EXCLUDED."isAdmin",
            updated_at = NOW()
        `,
        [userId, demoEmail, hashedPassword, 'Demo User', 'true', true]
      );

      console.log('✅ Demo user ready: demo@demo.com / demo');
      return true;
    } finally {
      client.release();
    }
  } catch (error) {
    console.warn('⚠️ Demo user bootstrap skipped:', error.message);
    return false;
  }
}

module.exports = {
  listAllUsers,
  createUser,
  updateUser,
  deleteUser,
  getMoreUserDetails,
  updateMargins,
  authenticateUser,
  verifyToken,
  ensureDemoUser,
};