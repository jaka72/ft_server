# Base image
FROM debian:buster

# Variables:
ENV DB_NAME='my_database'
ENV DB_USERNAME='jaka'    
ENV DB_PASSWORD='004277'

ENV WP_ADMIN='jaka'
ENV WP_EMAIL='jmurovec@student.codam.nl'
ENV WP_PASSWORD='004277'
ENV WP_PATH='/var/www/myfolder/wordpress/'

# Updates and useful packages
RUN apt update
RUN apt -y upgrade
RUN apt install -y wget
# Optional tools: vim-tiny procps apt-utils  


# Install and configure Open-SSL
RUN apt install -y openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl_key.key -out /etc/ssl/certs/ssl_key.crt -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=localhost"


# Install Nginx server, Maridb database (mysql), php
RUN apt install -y nginx
RUN apt install -y mariadb-server
RUN apt install -y php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
# Seems these are enough: 
#       php php-fpm  php-mbstring  php-gd php-mysql php-zip php-xml php-curl 


# Download PhpMyAdmin and Wordpress
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
RUN wget https://wordpress.org/latest.tar.gz


# Copy 3 files to be used by Nginx (index.html, info.php, my_nginx.conf)
RUN mkdir                       /var/www/myfolder
COPY ./srcs/index.html          /var/www/myfolder/
COPY ./srcs/info.php            /var/www/myfolder/
RUN rm -f /etc/nginx/sites-enabled/default
COPY ./srcs/my_nginx.conf                           /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/my_nginx.conf  /etc/nginx/sites-enabled/
#  file my_nginx.conf needs to be linked to directory /sites-enabled


# Start services: Nginx, Mysql, Php
#    Create database (Mariadb/Mysql) to be used by Wordpress
COPY ./srcs/create_database.sh /temp/
RUN bash /temp/create_database.sh


# Configure PHPMyAdmin
RUN tar xzfv phpMyAdmin-5.0.4-english.tar.gz -C   /temp
RUN mkdir                                   /var/www/myfolder/phpmyadmin
RUN cp -a /temp/phpMyAdmin-5.0.4-english/.  /var/www/myfolder/phpmyadmin/
COPY ./srcs/config.inc.php                  /var/www/myfolder/phpmyadmin/
#RUN chmod 705 /var/www/myfolder/phpmyadmin/config.inc.php

# Grant permissions, change user:group to www-data and change permission to 755
#   www-data is one of the users, automaticaly created
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*


# Configure WordPress
RUN tar xzvf latest.tar.gz -C   /var/www/myfolder/
COPY ./srcs/wp-config.php       /var/www/myfolder/wordpress/
COPY ./srcs/wp_setup.sh         /temp/
RUN bash                        /temp/wp_setup.sh


# remove unnecessary
RUN rm -rf /temp/phpMyAdmin-5.0.4-english
RUN rm -rf phpMyAdmin-5.0.4-english.tar.gz
RUN rm -rf latest.tar.gz

RUN apt install -y vim-tiny

CMD service mysql restart && service php7.3-fpm start && nginx -g 'daemon off;'
