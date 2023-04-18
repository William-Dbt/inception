#!/bin/bash

# while ! mysqladmin ping -h"mariadb:3306" --silent; do
# 	echo "[MySQL] Waiting for database connection..."
# 	sleep 1
# done
# echo "[MySQL] Service has started!"

sleep 5

# Avoid PHP running problems
if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
	touch /run/php/php7.3-fpm.pid
fi

# Download wordpress if isn't already done
if [ ! -f "wp-config-sample.php" ]; then
	echo "[Wordpress] Downloading wordpress..."
	wp core download --allow-root
	echo "[Wordpress] Done!"
fi

# Check if the configuration of wordpress is already done, if not, start the configuration and installation
# https://make.wordpress.org/cli/handbook/how-to/how-to-install/
if [ ! -f "wp-config.php" ]; then
	echo "[Wordpress] Generate config file..."
	wp config create --dbname=$SQL_DATABASE_NAME \
					 --dbuser=$SQL_USER \
					 --dbpass=$SQL_PASSWORD \
					 --dbhost=mariadb:3306 \
					 --allow-root
	echo "[Wordpress] Done!"

	echo "[Wordpress] Installing wordpress..."
	wp core install --url="wdebotte.42.fr" \
					--title="Inception" \
					--admin_user=$WP_ADMIN_USERNAME \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL \
					--allow-root
	echo "[Wordpress] Done!"
fi

# Create another user (admin user already exists thanks to the wp core install)
# https://developer.wordpress.org/cli/commands/user/
if [ ! $(wp user get $WP_USER_USERNAME --allow-root) ]; then
	echo "[Wordpress] Creating new user ($WP_USER_USERNAME)"
	wp user create $WP_USER_USERNAME $WP_USER_EMAIL \
				   --user_pass=$WP_USER_PASSWORD \
				   --allow-root
	echo "[Wordpress] Done!"
fi

/usr/sbin/php-fpm7.3
