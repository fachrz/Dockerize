# syntax=docker/dockerfile:1
FROM php:8.2-fpm-alpine3.18 AS original

FROM scratch
COPY --from=original / /

ENV OS_VERSION=Alpine3.18
ENV PHP_VERSION=8.2-fpm
ENV COMPOSER_VERSION=2

WORKDIR /app

# installing
RUN apk add --no-cache --update \
    nginx \
    supervisor && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --$COMPOSER_VERSION

# Copy all php-fpm configuration
RUN rm /usr/local/etc/php-fpm.d/*
COPY ./php-fpm/* /usr/local/etc/php-fpm.d/

# Configuring
COPY ./supervisor/supervisord.conf /etc/supervisord.conf
COPY ./nginx/default.conf /etc/nginx/http.d/
COPY ./app/ /app
COPY ./entrypoint.sh /entrypoint.sh

# Permissions
RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT [ "/entrypoint.sh" ]



