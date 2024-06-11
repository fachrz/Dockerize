This is the base image purposed for Development Environment

What's inside :
- Ubuntu Jammy
- git
- php
- nginx
- openssh-client
- composer 1 & 2

Notes :
Application should put inside `/app`

How to Build :
```sh
$ docker build -t php-nginx:7.2-jammy php-nginx/7.2-jammy
```

Build Multiple Arch :
1. Create buildx driver
```sh
$ docker buildx create --name mybuilder --use --bootstrap
```

2. Build with Buildx
```sh
$ docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag fachrz/php-nginx:7.2-jammy php-nginx/7.2-jammy
```

```--push``` will pushing the image to the repositories

How to Run :
```
$ docker run -t -d -p 80:80 --name php-nginx php-nginx:7.2-jammy
