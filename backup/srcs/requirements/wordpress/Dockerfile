FROM debian:buster

EXPOSE 9000

# Install required packages
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget

# Install PHP and his dependencies
RUN apt-get install -y php7.3
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client

# Install latest wordpress from his download link and place it where nginx show the default files
# RUN wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www

# Unzip the file and delete the zipped file
# RUN cd /var/www && tar -xzf wordpress-6.2-fr_FR.tar.gz && rm wordpress-6.2-fr_FR.tar.gz

# Create the wordpress location
RUN mkdir -p /var/www/html

# Give root access to write in the folders
RUN chown -R www-data:www-data /var/www
RUN chown -R 755 /var/www

# Modifying php config files
# Modify the deamon config line to 'no' to keep php in foreground
COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
# Modify the listen port to 9000 and uncomment the 'clear_env' line to avoid problem with our environment
COPY conf/www.conf /etc/php/7.3/pool.d/www.conf

# Copy our config file in a /tmp folder to prepare the next configuration with the CLI
COPY conf/wp-config.php /var/www/tmp/wp-config.php

# Move the config script in the docker
COPY tools/auto-config.sh /tmp/auto-config.sh
RUN chmod +x /tmp/auto-config.sh

# Install the CLI
RUN cd /tmp
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Run our script to setup the wordpress configuration and set two users
ENTRYPOINT ["/tmp/auto-config.sh"]
