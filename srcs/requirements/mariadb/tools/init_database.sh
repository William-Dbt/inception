#!/bin/sh

service mysql start

# Check if the wordpress database is already created
# if [ ! -d "/var/lib/mysql/${SQL_DATABASE_NAME}" ]; then
if [ ! -d "/var/lib/mysql/${SQL_DATABASE_NAME}" ]; then
	echo "[MySQL] Creating wordpress database and basic user configuration..."

	# mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE \`${SQL_DATABASE_NAME}\`;"
	# mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	# mysql -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE_NAME}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	# mysql -u root -p${SQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	# mysql -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

	echo "[MySQL] Done!"
fi

exec mysqld
# sh
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
