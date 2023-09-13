#!/bin/bash

# Solicitar el nombre de la base de datos
read -p "Ingrese el nombre de la base de datos: " db_name

# Solicitar el nombre de usuario de PostgreSQL
read -p "Ingrese el nombre de usuario de PostgreSQL: " db_user

# Solicitar la contraseña para el usuario de PostgreSQL
read -s -p "Ingrese la contraseña para el usuario '$db_user': " db_password
echo

# Ejecutar comandos de creación de la base de datos
echo "Creando base de datos..."
sudo -u postgres psql -c "CREATE DATABASE $db_name;"
sudo -u postgres psql -c "CREATE USER $db_user WITH PASSWORD '$db_password';"
sudo -u postgres psql -c "ALTER ROLE $db_user SET client_encoding TO 'utf8';"
sudo -u postgres psql -c "ALTER ROLE $db_user SET default_transaction_isolation TO 'read committed';"
sudo -u postgres psql -c "ALTER ROLE $db_user SET timezone TO 'UTC';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $db_name TO $db_user;"

echo "Base de datos '$db_name' creada con éxito para el usuario '$db_user'."
