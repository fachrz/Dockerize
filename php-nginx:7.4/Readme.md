What's inside :
    - Alpine
    - php7.4
    - Nginx 1.20.2

PHP Config path :
/usr/local/etc

Build :
docker build -t php-nginx .

Run :
docker run -t -d -p 80:80 --name dev-php-nginx php-nginx
