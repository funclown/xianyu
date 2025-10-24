#!/bin/bash

echo "Starting xianyu-auto-reply system..."

# Create necessary directories
mkdir -p /app/data /app/logs /app/backups /app/static/uploads/images

# Set permissions
chmod 777 /app/data /app/logs /app/backups /app/static/uploads /app/static/uploads/images

# Start the application
exec python Start.py
