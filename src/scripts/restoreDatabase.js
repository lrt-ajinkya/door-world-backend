const { spawn } = require('child_process');
const path = require('path');
const fs = require('fs');

async function restoreDatabase() {
  try {
    // Path to the SQL backup file
    const backupPath = path.join(__dirname, '../../backup/SQL/doorworld_db.sql');
    
    // Check if backup file exists
    if (!fs.existsSync(backupPath)) {
      console.error('❌ Backup file not found:', backupPath);
      process.exit(1);
    }

    console.log('🔄 Starting database restore...');
    console.log('📁 Backup file:', backupPath);

    // Database connection details from environment
    const dbConfig = {
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || '5432',
      user: process.env.DB_USER || 'kip',
      database: process.env.DB_NAME || 'doorworld_db'
    };

    console.log('🔗 Connecting to database:', `${dbConfig.user}@${dbConfig.host}:${dbConfig.port}/${dbConfig.database}`);

    // Build psql command
    const psqlArgs = [
      '-h', dbConfig.host,
      '-p', dbConfig.port,
      '-U', dbConfig.user,
      '-d', dbConfig.database,
      '-f', backupPath,
      '--set', 'ON_ERROR_STOP=on'
    ];

    // Run psql command
    const psqlProcess = spawn('psql', psqlArgs, {
      stdio: ['inherit', 'pipe', 'pipe']
    });

    let output = '';
    let errorOutput = '';

    psqlProcess.stdout.on('data', (data) => {
      const text = data.toString();
      output += text;
      // Show progress for major operations
      if (text.includes('CREATE TABLE') || text.includes('INSERT') || text.includes('COPY')) {
        console.log('📝', text.trim().split('\n')[0]);
      }
    });

    psqlProcess.stderr.on('data', (data) => {
      const text = data.toString();
      errorOutput += text;
      // Show warnings but don't fail on them
      if (text.includes('NOTICE') || text.includes('WARNING')) {
        console.log('⚠️ ', text.trim());
      } else if (!text.includes('psql:')) {
        console.error('❌', text.trim());
      }
    });

    psqlProcess.on('close', (code) => {
      if (code === 0) {
        console.log('✅ Database restore completed successfully!');
        console.log('📊 Restore summary:');
        
        // Count operations from output
        const createTableCount = (output.match(/CREATE TABLE/g) || []).length;
        const insertCount = (output.match(/INSERT/g) || []).length;
        const copyCount = (output.match(/COPY/g) || []).length;
        
        if (createTableCount > 0) console.log(`   • Tables created: ${createTableCount}`);
        if (insertCount > 0) console.log(`   • Records inserted: ${insertCount}`);
        if (copyCount > 0) console.log(`   • Data copied: ${copyCount} operations`);
        
        process.exit(0);
      } else {
        console.error('❌ Database restore failed with exit code:', code);
        if (errorOutput) {
          console.error('Error details:', errorOutput);
        }
        process.exit(1);
      }
    });

    psqlProcess.on('error', (error) => {
      console.error('❌ Failed to start psql process:', error.message);
      console.error('💡 Make sure PostgreSQL client tools are installed');
      process.exit(1);
    });

  } catch (error) {
    console.error('❌ Unexpected error:', error.message);
    process.exit(1);
  }
}

// Run if called directly
if (require.main === module) {
  // Load environment variables
  require('dotenv').config();
  restoreDatabase();
}

module.exports = restoreDatabase;