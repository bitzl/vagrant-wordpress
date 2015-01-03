#!/bin/bash

# Make sure you there is no password prompt during install. Empty MySQL root password is ok as it's for a local deveopment VM.
sudo debconf-set-selections /vagrant/provisioning/conf/debconf

# Install Software
sudo aptitude update
sudo aptitude -y install apache2 libapache2-mod-php5 php5-mysql mysql-server mysql-client
sudo aptitude clean
sudo apt-get autoremove

# Install wordpress files
wget -nv https://wordpress.org/latest.tar.gz -O latest.tar.gz
tar xzf latest.tar.gz
sudo mv wordpress /var/www/wordpress
sudo chown -R www-data:www-data /var/www/wordpress
sudo a2enmod php5
sudo a2enmod rewrite
sudo cp /vagrant/provisioning/conf/wordpress.conf /etc/apache2/sites-available/
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo a2ensite wordpress
sudo service apache2 restart

# Create MySQL database
mysql -u root -proot -e "create database wordpress; grant all privileges on wordpress.* to wordpress@localhost identified by 'wordpress'"
