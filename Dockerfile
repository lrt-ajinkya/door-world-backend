# Use Node.js LTS image
FROM node:22-alpine

# Install system dependencies for PostgreSQL client
RUN apk add --no-cache postgresql-client

# Create app user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci --only=production && npm cache clean --force

# Copy source code
COPY --chown=nodejs:nodejs . .

# Create necessary directories with proper permissions
RUN mkdir -p backup logs && \
    chown -R nodejs:nodejs backup logs

# Switch to non-root user
USER nodejs

# Expose port
EXPOSE 3420

# Add healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3420/health', (res) => process.exit(res.statusCode === 200 ? 0 : 1))"

# Start app
CMD ["node", "src/index.js"]