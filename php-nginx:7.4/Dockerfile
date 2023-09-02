# syntax=docker/dockerfile:1
FROM php:7.4-fpm-alpine3.15 AS original

FROM scratch
COPY --from=original / /

WORKDIR /

# installing
RUN apk add --no-cache --update \
    nginx \
    supervisor

# install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configuring
COPY ./supervisor/supervisord.conf /supervisord.conf
COPY ./php-fpm/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./nginx/default.conf /etc/nginx/http.d/
COPY ./php-fpm/zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf

# App Directory
COPY ./app/ /app

# entrypoint.sh
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

EXPOSE 80

ENTRYPOINT [ "./entrypoint.sh" ]



