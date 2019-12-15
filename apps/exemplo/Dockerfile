FROM alpine:3.9

RUN apk add --update \
    wget \
    curl \
    bash \
    fontconfig \
    libxrender \
    libxext \
    imagemagick \
    unzip \
    make \
    sudo \
    php7 \
    php7-apcu \
    php7-bcmath \
    php7-bz2 \
    php7-calendar \
    php7-curl \
    php7-ctype \
    php7-exif \
    php7-fpm \
    php7-gd \
    php7-gmp \
    php7-iconv \
    php7-imagick \
    php7-imap \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mysqlnd \
    php7-pdo_mysql \
    php7-mongodb \
    php7-memcached \
    php7-opcache \
    php7-pdo_pgsql \
    php7-pgsql \
    php7-posix \
    php7-redis \
    php7-soap \
    php7-sodium \
    php7-sqlite3 \
    php7-pdo_sqlite \
    php7-xdebug \
    php7-xml \
    php7-xmlreader \
    php7-openssl \
    php7-phar \
    php7-xsl \
    php7-zip \
    php7-zlib \
    php7-pcntl \
    php7-cgi \
    php7-phpdbg \
    php7-dom \
    php7-dev \
    phpunit \
    nginx

RUN mkdir -p /www /log
RUN adduser -D -u 1000 ao
RUN chown -R ao:ao /home/ao
RUN chown -R ao:ao /log
RUN chown -R ao:ao /www
RUN echo "ao  ALL = ( ALL ) NOPASSWD: ALL" >> /etc/sudoers
RUN sed -i "/user = .*/c\user = ao" /etc/php7/php-fpm.d/www.conf
RUN sed -i "/^group = .*/c\group = ao" /etc/php7/php-fpm.d/www.conf
RUN sed -i "/listen.owner = .*/c\listen.owner = ao" /etc/php7/php-fpm.d/www.conf
RUN sed -i "/listen.group = .*/c\listen.group = ao" /etc/php7/php-fpm.d/www.conf
RUN sed -i "/listen = .*/c\listen = [::]:9000" /etc/php7/php-fpm.d/www.conf
RUN sed -i "/;access.log = .*/c\access.log = /proc/self/fd/2" /etc/php7/php-fpm.d/www.conf
RUN sed -i "/;clear_env = .*/c\clear_env = no" /etc/php7/php-fpm.d/www.conf
RUN sed -i "/;catch_workers_output = .*/c\catch_workers_output = yes" /etc/php7/php-fpm.d/www.conf
RUN sed -i "/pid = .*/c\;pid = /run/php/php7.1-fpm.pid" /etc/php7/php-fpm.conf
RUN sed -i "/;daemonize = .*/c\daemonize = yes" /etc/php7/php-fpm.conf
RUN sed -i "/error_log = .*/c\error_log = /proc/self/fd/2" /etc/php7/php-fpm.conf
RUN sed -i "/post_max_size = .*/c\post_max_size = 1000M" /etc/php7/php.ini
RUN sed -i "/upload_max_filesize = .*/c\upload_max_filesize = 1000M" /etc/php7/php.ini
RUN sed -i "/zend_extension=xdebug/c\;zend_extension=xdebug" /etc/php7/conf.d/00_xdebug.ini
RUN wget -qO /tini https://github.com/krallin/tini/releases/download/v0.16.1/tini-static
RUN chmod +x /tini
RUN rm -rf /tmp/

USER ao
WORKDIR /www

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENTRYPOINT ["/tini"]

#ENTRYPOINT ["/tini", "--", "/scripts/start.sh"]

CMD ["/bin/bash"]