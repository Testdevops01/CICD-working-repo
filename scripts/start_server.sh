#!/bin/bash
echo "Starting application server..."

# Stop Apache if it's running (it uses port 80)
if systemctl is-active --quiet apache2; then
    echo "Stopping Apache to free port 80..."
    sudo systemctl stop apache2
    sudo systemctl disable apache2
fi

# Stop any existing nginx
sudo systemctl stop nginx 2>/dev/null || true

# Start and enable nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Wait for nginx to start
sleep 3

# Check if nginx is running
if systemctl is-active --quiet nginx; then
    echo "✅ Nginx started successfully"
    echo "Application is now running on port 80"
else
    echo "❌ Failed to start nginx"
    sudo systemctl status nginx --no-pager
    exit 1
fi
