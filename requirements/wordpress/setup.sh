#!/bin/bash

set -e

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
    ./wp-cli.phar core download --allow-root

    echo "Creating config..."
    ./wp-cli.phar config create \
        --dbname=${WORDPRESS_DB_NAME} \
        --dbuser=${WORDPRESS_DB_USER} \
        --dbpass=${WORDPRESS_DB_PASSWORD} \
        --dbhost=${WORDPRESS_DB_HOST} \
        --allow-root

    echo "Installing WordPress..."
    ./wp-cli.phar core install \
        --url=${WORDPRESS_URL} \
        --title="${WORDPRESS_TITLE}" \
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
php-fpm8.2 -F





