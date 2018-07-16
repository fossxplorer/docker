FROM arm64v8/alpine:latest
LABEL maintainer="Php-fpm Docker Image Maintainer <me@susinthiran.com>"
RUN apk update && apk upgrade && apk add bash \
    php7-fpm \
    php7-bcmath \
    php7-bz2 \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-exif \
    php7-ftp \
    php7-gd \
    php7-iconv \
    php7-imagick \
    php7-json \
    php7-mcrypt \
    php7-memcached \
    php7-mysqli \
    php7-opcache \
    php7-openssl \
    php7-pdo_mysql \
    php7-redis \
    php7-simplexml \
    php7-xdebug \
    php7-xml \
    php7-zip && 


#&& mkdir -p /run/named && chown named: /run/named
EXPOSE 9000/tcp
COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh
RUN echo "about to start php-fpm"
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["/usr/sbin/php-fpm"]