#!/bin/bash

sleep 15
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    rm -f /var/www/wordpress/wp-config-sample.php
    cp /var/www/wp-config.php /var/www/wordpress/
    wp-cli --path="/var/www/wordpress/" --allow-root core install --title=$WP_TITLE --admin_name="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL" --url="$WP_HOME"
    wp-cli --path="/var/www/wordpress/" --allow-root user create $WP_USER $WP_USER_EMAIL --role=$WP_USER_ROLE --user_pass="$WP_USER_PASS"
    wp-cli --path="/var/www/wordpress/" --allow-root plugin install redis-cache
    wp-cli --path="/var/www/wordpress/" --allow-root plugin activate redis-cache
    wp-cli --path="/var/www/wordpress/" --allow-root redis enable --force
fi
./usr/sbin/php-fpm7.3 -F