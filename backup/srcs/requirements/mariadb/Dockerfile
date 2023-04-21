FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server mariadb-client procps

# Copy our config file and our script to configure and init mysql database
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init_database.sh /etc/mysql

# Make sure that we can execute the script
RUN chown -R mysql:root /etc/mysql
RUN chmod +x /etc/mysql/init_database.sh

EXPOSE 3306

CMD ["/etc/mysql/init_database.sh"]
