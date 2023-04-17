#!/bin/bash
# This sleep is used to make sure that mariad is up.
sleep 5

if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
fi

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	echo "The configuration of wordpress will process...";

	cd /var/www/html;
	wp core download --allow-root;
	wp config create --allow-root \
					--dbname=${MD_DATABASE_NAME} \
					--dbuser=${MD_USER} \
					--dbpass=${MD_PASSWORD} \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'

	echo "End of install...";
fi

sh && /usr/sbin/php-fpm7.3
