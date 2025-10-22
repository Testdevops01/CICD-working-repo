#!/bin/bash
echo "Starting dependency installation..."

# Update package list (Ubuntu uses apt-get, not yum)
apt-get update

# Install nginx
apt-get install -y nginx

# Create destination directory
mkdir -p /var/www/html

echo "Dependency installation completed successfully!"
