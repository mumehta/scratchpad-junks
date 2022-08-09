#!/bin/bash
apt update -y
# DEBIAN_FRONTEND=noninteractive apt -y upgrade
apt -y remove apache2
apt install -y apache2 php php-{common,mysql,xml,xmlrpc,curl,gd,imagick,cli,dev,imap,mbstring,opcache,soap,zip,intl} mysql-server
systemctl start apache2.service
systemctl enable apache2.service

usermod -a -G www-data ubuntu
chown -R ubuntu:www-data /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
cd /var/www/html
curl http://169.254.169.254/latest/meta-data/instance-id -o index.html
curl https://raw.githubusercontent.com/hashicorp/learn-terramino/master/index.php -O
