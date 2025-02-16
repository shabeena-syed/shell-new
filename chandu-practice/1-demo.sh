#!/bin/bash
** shebang **
Cheerla Chandra sekhar9270
11:51 PM

# Update system
echo "Updating system packages..."
sudo yum update -y

# Install Nginx
echo "Installing Nginx..."
sudo amazon-linux-extras enable nginx1
sudo yum install nginx -y

# Start and Enable Nginx
echo "Starting Nginx service..."
sudo systemctl start nginx
sudo systemctl enable nginx

# Check Nginx status
echo "Checking Nginx status..."
sudo systemctl status nginx --no-pager

echo "Nginx installation completed successfully!"