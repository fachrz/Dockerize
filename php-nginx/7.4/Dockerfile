# syntax=docker/dockerfile:1
FROM php:7.4-fpm-alpine3.15 AS original

FROM scratch
COPY --from=original / /

ENV OS_VERSION=Alpine3.15
ENV PHP_VERSION=7.4-fpm
ENV PHPIZE_DEPS="autoconf dpkg-dev dpkg file g++ gcc libc-dev make pkgconf re2c"
ENV PHP_INI_DIR=/usr/local/etc/php
ENV PHP_CFLAGS="-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
ENV PHP_CPPFLAGS="-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
ENV PHP_LDFLAGS="-Wl,-O1 -pie"

WORKDIR /app

# installing
RUN apk add --no-cache --update \
    openssh-client \
    git \
    nginx \
    supervisor

# installing composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer1 --1 && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy all php-fpm configuration
RUN rm /usr/local/etc/php-fpm.d/*
COPY ./php-fpm/* /usr/local/etc/php-fpm.d/

# Configuring
COPY ./supervisor/supervisord.conf /etc/supervisord.conf
COPY ./nginx/default.conf /etc/nginx/http.d/
COPY ./app/ /app
COPY ./entrypoint.sh /entrypoint.sh

# permissions
RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT [ "/entrypoint.sh" ]



