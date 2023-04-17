#!/bin/bash

while ! mysqladmin ping -h"127.0.0.1" --silent; do
	echo "[MySQL] Waiting for database connection..."
	sleep 1
done

echo "[MySQL] Service has started!"

# Avoid PHP running problems
if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
	touch /run/php/php7.3-fpm.pid
fi

if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "[Wordpress] The installation will start...";

	wp core download --allow-root
	wp config create --allow-root \
					--dbname=$SQL_DATABASE_NAME \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/html'

	echo "[Wordpress] End of install..."
fi

/usr/sbin/php-fpm7.3
