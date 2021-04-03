
# wwp-cli.phar is a commandline tool, it helps installing Wordpress, themes and plugins ...
# https://pagely.com/blog/what-is-wp-cli/
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

service mysql restart
service nginx start

# Install Worpderss
# https://developer.wordpress.org/cli/commands/core/
wp core install --path=${WP_PATH} --url="/" --title="My Wordpress" --admin_user=${WP_ADMIN} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL} --allow-root


# Connect msql database to Wordpress 
# www.chillburn.com.au/weblog/the-easiest-way-to-move-a-live-wordpress-site-to-localhost
mysql -e "USE ${DB_NAME}; UPDATE wp_options SET option_value='https://localhost/wordpress' WHERE option_name='siteuri' OR option_name='home';"