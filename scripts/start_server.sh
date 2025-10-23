#!/bin/bash
echo "Starting Apache HTTPD..."

# Start Apache
service httpd start

# Enable Apache to start on boot
chkconfig httpd on

# Verify Apache is running
sleep 3
if pgrep httpd > /dev/null; then
    echo "Apache started successfully"
else
    echo "ERROR: Apache failed to start"
    exit 1
fi
