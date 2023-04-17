# Start the mysql service
service mysql start;

# Create the table that we'll use
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MD_DATABASE_NAME}\`;"

# Create the user to connect on the database
mysql -e "CREATE USER IF NOT EXISTS \`${MD_USER}\`@'localhost' IDENTIFIED BY '${MD_PASSWORD}';"

# Give all privileges to the user created before
mysql -e "GRANT ALL PRIVILEGES ON \`${MD_DATABASE_NAME}\`.* TO \`${MD_USER}\`@'%' IDENTIFIED BY '${MD_PASSWORD}';"

# Modify root user
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MD_ROOT_PASSWORD}';"

# Refresh user's privileges
mysql -e "FLUSH PRIVILEGES;"

# Restart the database
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
exec mysqld_safe
