What's inside :
    - Alpine
    - php7.4
    - Nginx 1.20.2
    - Composer 2

Notes :
1. Application should put inside /app

PHP Config path :
/usr/local/etc

How to Build :
docker build -t php-nginx-dev:7.4 php-nginx:7.4

How to Run :
docker run --rm -t -d -p 80:80 --name php-nginx-dev php-nginx-dev:7.4
