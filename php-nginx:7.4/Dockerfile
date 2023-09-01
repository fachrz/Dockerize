FROM php:7.4-fpm-alpine3.15

WORKDIR /

RUN apk add --no-cache --update nginx supervisor

COPY ./supervisor/supervisord.conf /supervisord.conf
COPY ./php-fpm/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./nginx/default.conf /etc/nginx/http.d/

#App Directory
COPY ./app/ /app

EXPOSE 80

CMD ["supervisord", "-c", "/supervisord.conf"]



