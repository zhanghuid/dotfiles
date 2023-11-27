FROM php:7.1-fpm as base
LABEL maintainer="iamhuide@google.com"

RUN apt-get clean all && apt-get update
RUN apt install gnupg -y

# 设置更新源
COPY ./tencent.source /etc/apt/sources.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6ED0E7B82643E131
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

# Download script to install PHP extensions and dependencies
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
    curl \
    git \
    zip unzip \
    && install-php-extensions \
    bcmath \
    bz2 \
    exif \
    gd \
    intl \
    memcached \
    mysqli \
    opcache \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    redis \
    xsl \
    zip \
    sockets\
    swoole\
    mongodb\
    mcrypt
# already installed:
#      iconv \
#      mbstring \

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && ln -s $(composer config --global home) /root/composer \
    && composer config -g repos.packagist composer https://mirrors.tencent.com/composer/
ENV PATH=$PATH:/root/composer/vendor/bin COMPOSER_ALLOW_SUPERUSER=1


RUN apt-get update \
    && apt-get install -y procps

WORKDIR /work/web
# keep running - 1
# ENTRYPOINT ["tail", "-f", "/dev/null"]

# keep running - 2
# EXPOSE 9000
CMD ["/usr/local/sbin/php-fpm"]
