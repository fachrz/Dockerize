#!/bin/sh

# Start supervisord
echo "Starting supervisord..."

mkdir -p /var/log/supervisor
mkdir -p /var/log/php-fpm

ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
ln -sf /dev/stdout /var/log/php-fpm/access.log
ln -sf /dev/stderr /var/log/php-fpm/error.log

supervisord -c /etc/supervisor/supervisord.conf