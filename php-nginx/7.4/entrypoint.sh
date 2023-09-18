#!/bin/sh

# Start supervisord
echo "Starting supervisord..."

mkdir /var/log/supervisor
mkdir /var/log/php-fpm

ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
ln -sf /proc/self/fd/2 /var/log/php-fpm/access.log
ln -sf /proc/self/fd/2 /var/log/php-fpm/error.log

supervisord -c /etc/supervisord.conf