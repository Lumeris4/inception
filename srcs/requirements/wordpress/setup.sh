#!/bin/bash

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
echo "Creating config..."
./wp-cli.phar config create \
  --dbname=wordpress \
  --dbuser=wpuser \
  --dbpass=password \
  --dbhost=mariadb \
  --allow-root --debug

echo "Installing WordPress..."
./wp-cli.phar core install \
 --url=https://lelanglo.42.fr \
 --title=inception \
 --admin_user=${WP_ADMIN_USER} \
 --admin_password=${WP_ADMIN_PASSWORD} \
 --admin_email=${WP_ADMIN_EMAIL} \
 --allow-root

./wp-cli.phar user create \
${WP_USER} ${WP_USER_EMAIL} \
 --role=subscriber \
 --user_pass=${WP_USER_PASSWORD} \
 --allow-root

echo "Starting php-fpm..."
exec php-fpm7.4 -F





