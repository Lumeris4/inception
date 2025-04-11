#!/bin/bash

set -e

cd /var/www/html
rm -rf /var/www/html/*
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root

# Commenté temporairement les étapes d'installation et de config
# Une fois ta base de données prête, tu peux décommenter ces lignes.

# Créer le fichier de configuration WordPress
# ./wp-cli.phar config create \
#  --dbname=${WORDPRESS_DB_NAME} \
#  --dbuser=${WORDPRESS_DB_USER} \
#  --dbpass=${WORDPRESS_DB_PASSWORD} \
#  --dbhost=${WORDPRESS_DB_HOST} \
#  --allow-root

# Installer WordPress
# ./wp-cli.phar core install \
#  --url=${WORDPRESS_URL} \
#  --title=${WORDPRESS_TITLE} \
#  --admin_user=${WORDPRESS_ADMIN_USER} \
#  --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
#  --admin_email=${WORDPRESS_ADMIN_EMAIL} \
#  --allow-root

php-fpm8.2 -F



