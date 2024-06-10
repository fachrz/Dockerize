
What's inside :
- alpine
- git
- php7.4
- nginx
- composer 1 & 2

Notes :
Application should put inside `/app`

How to Build :
```sh
$ docker build -t php-nginx:7.4 php-nginx/7.4
```

Build Multiple Arch :
1. Create buildx driver
```sh
$ docker buildx create --name mybuilder --use --bootstrap
```

2. Build with Buildx
```sh
$ docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag php-nginx:7.4 php-nginx/7.4
```

```--push``` will pushing the image to the repositories

How to Run :
```
$ docker run -t -d -p 80:80 --name php-nginx php-nginx:7.4
