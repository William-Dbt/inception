#!/bin/sh

service mysql start

sleep 2

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

	cat << EOF > /tmp/init_db.sql
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

	# /usr/sbin/mysqld --user=mysql --bootstrap < /tmp/init_db.sql
	# rm -f /tmp/init_db.sql



	# First remove invalid users from databases that can make problems later
	# mysql -u root -e "DELETE FROM mysql.user WHERE user='';"
	# mysql -u root -e "DELETE FROM mysql.user WHERE user='root' AND host NOT IN ('localhost', '127.0.0.1', '::1');"

	# Change root password, create the new user and wordpress database
	# mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress CHARACTER SET utf8 COLLATE utf8_general_ci;"
	# mysql -u root -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	# mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO '${SQL_USER}'@'%';"
	# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	# mysql -u root -e "FLUSH PRIVILEGES;"

	echo "[MySQL] Done!"
fi

sh

# exec mysqld

# Start the mysql service
# service mysql start;


# Create the table that we'll use
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${{}SQL_DATABASE_NAME}\`;"

# # Create the user to connect on the database
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# # Give all privileges to the user created before
# mysql -e "GRANT ALL PRIVILEGES ON \`$SQL_DATABASE_NAME\`.* TO \`$SQL_USER\`@'%' IDENTIFIED BY '$SQL_PASSWORD';"

# # Modify root user
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpwd';"

# # Refresh user's privileges
# mysql -e "FLUSH PRIVILEGES;"

# # Restart the database
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# exec mysqld
