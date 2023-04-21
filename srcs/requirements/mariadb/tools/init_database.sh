#!/bin/sh

service mysql start

# Create mysql database if not exists
if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo "[MySQL] mysql database doesn't exists, creating one!"

	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

	echo "[MySQL] Done!"
fi

# Check if the wordpress database is already created
if [ ! -d "/var/lib/mysql/wordpress" ]; then
	echo "[MySQL] Creating wordpress database and basic user configuration..."

	cat << EOF > /tmp/querys_database.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE user='';
DELETE FROM mysql.user WHERE user='root' AND host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS wordpress CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${SQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

	mysql -u root < /tmp/querys_database.sql
	rm -f /tmp/querys_database.sql

	echo "[MySQL] Done!"
fi
