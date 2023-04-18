FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client wget sendmail

# The installation of wordpress is done with WP-CLI (https://wp-cli.org/fr/)
# https://make.wordpress.org/cli/handbook/guides/installing/
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Create the folder of the website and give www-data access to it
RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www

# Modifying php config files
# Modify the deamon config line to 'no' to keep php in foreground
COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
# Modify the listen port to 9000 and uncomment the 'clear_env' line to avoid problem with our environment
COPY conf/www.conf /etc/php/7.3/pool.d/www.conf

# Move the config script in the docker
COPY tools/init_wordpress.sh /var/www
RUN chmod +x /var/www/init_wordpress.sh

WORKDIR /var/www/html
EXPOSE 9000

CMD ["/var/www/init_wordpress.sh"]
