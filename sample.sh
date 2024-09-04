#!/bin/bash

yum update -y
yum install git -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd

cd /var/www/html
git clone https://github.com/Hemashree-BS/skyper.git .
chmod 777 /var/www/html/index.html
systemctl restart httpd
