
service nginx start
service mysql start
service php7.3-fpm start

# Configure a Mysql database to be used by Wordpress
#   These variables (name, username, hostname and password) are defined in Dockerfile
#   In MySQL, by default, the username is root and there’s no password.
#   https://chartio.com/resources/tutorials/how-to-grant-all-privileges-on-a-database-in-mysql/
echo "CREATE DATABASE ${DB_NAME};"| mysql -u root --skip-password
echo "CREATE USER ${DB_USERNAME}@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USERNAME}@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password

# command "WITH GRANT OPTION" creates a MySQL user that can edit the permissions of other users.

# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'mylocalhost' WITH GRANT OPTION;"| mysql -u root

# Save changes with flush
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password