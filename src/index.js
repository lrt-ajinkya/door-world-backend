const app = require('./app');
const { ensureDemoUser } = require('./services/database');

let server;

server = app.listen(3420, () => {
  console.log(`Express is running on port ${server.address().port}`);
});

ensureDemoUser().catch((error) => {
  console.warn('Demo user startup check failed:', error.message);
});
