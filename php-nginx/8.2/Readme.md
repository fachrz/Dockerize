What's inside :
    - Alpine
    - php8.2
    - Nginx 1.20.2
    - Composer 2

Notes :
1. Application should put inside /app

PHP Config path :
/usr/local/etc

How to Build :
docker build -t php-nginx-dev:8.2 php-nginx:8.2

if you want to build to push to dockerhub use this :
DOCKER_BUILDKIT=0 docker build -t fachrz/php-nginx:8.2 php-nginx:8.2

How to Run :
docker run --rm -t -d -p 80:80 --name php-nginx-dev php-nginx-dev:8.2