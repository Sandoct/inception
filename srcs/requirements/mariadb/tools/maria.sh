#service mysql start;

#mysql -e "CREATE DATEBASE wordpress;"
#mysql -e "CREATE USER IF NOT EXISTS 'wpuser'@'localhost' IDENTIFIED BY 'password';"
#mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'%' IDENTIFIED BY 'password';"
#mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PWD';"
#mysql -e "FLUSH PRIVILEGES;"
#mysqladmin -u root -p$SQL_ROOT_PWD shutdown
#exec mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'

#!/bin/bash

#--------------mariadb start--------------#
service mariadb start # start mariadb
 # wait for mariadb to start

#--------------mariadb config--------------#
# Create database if not exists
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`;"

# Create user if not exists
mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_USER_PWD}';"

# Grant privileges to user
mariadb -e "GRANT ALL PRIVILEGES ON ${SQL_DB}.* TO \`${SQL_USER}\`@'%';"

# Flush privileges to apply changes
mariadb -e "FLUSH PRIVILEGES;"

#--------------mariadb restart--------------#
# Shutdown mariadb to restart with new config
mysqladmin -u root -p$SQL_ROOT_PWD shutdown

# Restart mariadb with new config in the background to keep the container running
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
