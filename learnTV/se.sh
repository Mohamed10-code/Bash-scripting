#!/bin/bash 

set -e
sudo dnf update 
sudo dnf install nginx -y 
systemctl start nginx 
echo "Nginx is succesfully installed and started"

