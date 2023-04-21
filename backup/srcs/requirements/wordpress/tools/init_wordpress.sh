#!/bin/bash

echo "Waiting 10 seconds before starting initialization script..."
sleep 10

# Avoid PHP running problems
if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
	touch /run/php/php7.3-fpm.pid
fi

# Download wordpress if isn't already done
if [ ! -f "wp-config-sample.php" ]; then
	echo "Downloading wordpress..."
	wp core download --allow-root
	echo "Done!"
fi

# Check if the configuration of wordpress is already done, if not, start the configuration and installation
# https://make.wordpress.org/cli/handbook/how-to/how-to-install/
if [ ! -f "wp-config.php" ]; then
	echo "Create config file..."
	wp config create --dbname=wordpress \
					 --dbuser=$SQL_USER \
					 --dbpass=$SQL_PASSWORD \
					 --dbhost=mariadb:3306 --path='/var/www/html' \
					 --allow-root
	echo "Done!"

	echo "Installing wordpress..."
	wp core install --url="wdebotte.42.fr" \
					--title="Inception" \
					--admin_user=$WP_ADMIN_USERNAME \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL \
					--allow-root
	echo "Done!"
fi

# Create another user (admin user already exists thanks to the wp core install)
# https://developer.wordpress.org/cli/commands/user/
if [[ -z $(wp user get $WP_USER_USERNAME --allow-root) ]]; then
	echo "Creating new user ($WP_USER_USERNAME)"
	wp user create $WP_USER_USERNAME $WP_USER_EMAIL \
				   --user_pass=$WP_USER_PASSWORD \
				   --allow-root
	echo "Done!"
fi

echo "Starting php-fpm"

/usr/sbin/php-fpm7.3 -F -R