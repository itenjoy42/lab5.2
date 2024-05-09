#!/bin/bash

sudo yum update -y
sudo yum upgrade -y
sudo yum install -y nginx
cd /usr/share/nginx/html
sudo yum install git -y
sudo git clone https://github.com/itenjoy42/pdlab1.1.git
sudo rm -rf index.html
cd pdlab1.1
sudo mv * ../
sudo rm -rf pdlab1.1

sudo systemctl enable nginx
sudo systemctl restart nginx

# yum install mysql-server -y
# systemctl start mysqld
# systemctl enable mysqld

sudo yum install amazon-cloudwatch-agent -y
