#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo apt install openjdk-17-jre-headless  -y
sudo apt install git -y 
sudo git clone https://github.com/techeazy-consulting/techeazy-devops /home/ubuntu/app
cd /home/ubuntu/app
echo "Deployed!" > /var/www/html/index.html
