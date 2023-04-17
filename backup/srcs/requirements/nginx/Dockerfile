FROM debian:buster

EXPOSE 443

# Install required packages
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install -y vim

# Install OpenSSL package
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl

# Create the key and the certifcate for TSL protocol
# -x509 refers to the certificate's type
# -out and -keyout parameters refers to where the certificate will be saved
# -subj refers to the command response (Country, STate, Locality, Organization name, Organizational Unit name, Common Name (we can use our name))
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/ssl_certif.crt -keyout /etc/nginx/ssl/ssl_key.key -subj "/C=FR/ST=IDF/L=Paris/O=School/OU=42Paris/CN=wdebotte.42.fr"

# Copy the config file in the config foler of nginx
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# Make sure that we can access these files
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Run nginx in foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]
