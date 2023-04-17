FROM debian:buster

EXPOSE 3306

# Install required packages
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client

# Replace the config file by our
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/db-execute.sh /tmp

# Make sure that we can execute the script
RUN chmod 755 /tmp/db-execute.sh

ENTRYPOINT ["sh", "/tmp/db-execute.sh"]
