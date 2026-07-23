const express = require('express');
const bodyParser = require('body-parser');
const routes = require('./routes/index');
const cors = require('cors');

const app = express();

const corsOptions = {
  origin: process.env.NODE_ENV === 'production' 
    ? ['https://doorworld-frontend.onrender.com']
    : true,
  credentials: true,
  optionsSuccessStatus: 200
};

app.use(bodyParser.json())
app.options('*', cors(corsOptions))
app.use(cors(corsOptions))

app.use('/images', express.static('src/images'));

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    environment: process.env.NODE_ENV || 'development',
    version: require('../package.json').version
  });
});

app.use('/', routes);

// Database is already initialized with PostgreSQL
console.log('Using PostgreSQL database');

module.exports = app;
