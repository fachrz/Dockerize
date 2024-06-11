FROM ubuntu:jammy as original

WORKDIR /app

ARG TZ=Etc/UTC

# system dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y software-properties-common curl \
    tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get update

# install needed package
RUN apt-get install -y php7.2-fpm \
    git \
    nginx \
    supervisor \
    openssh-client

# installing composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer1 --1 && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# remove unnecessary file
RUN rm /etc/php/7.2/fpm/pool.d/* && \
    rm -r /etc/nginx/sites-available && \
    rm -r /etc/nginx/sites-enabled && \
    rm -r /etc/supervisor/conf.d

# Copy all configuration
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/
COPY ./php-fpm/* /etc/php/7.2/fpm/pool.d/
COPY ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY ./app/ /app
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]