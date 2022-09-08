#!/bin/bash

if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then 
    service mysql start
    echo "Creating DB user..."
    mysql -u root -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
    echo "Creating DB..."
	mysql -u root -e "CREATE DATABASE ${DB_NAME};"
	mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    echo "Changing root password..."
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}'; FLUSH PRIVILEGES;"
fi
mysqld_safe