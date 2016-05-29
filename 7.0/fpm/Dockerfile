FROM php:7.0-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libbz2-dev \
        libcurl4-openssl-dev \
        libxml2-dev \
        libgmp-dev \
        libc-client2007e-dev \
        libicu-dev \
        libldap2-dev \
        libedit-dev \
        libreadline-dev \
        librecode-dev \
        libxslt-dev \
        libkrb5-dev \
        libtidy-dev \
    && docker-php-ext-install -j$(nproc) bcmath bz2 calendar ctype curl fileinfo dom exif ftp gettext \
                                         hash iconv intl json mbstring mcrypt mysqli opcache \
                                         pdo pdo_mysql phar posix recode session simplexml \
                                         sockets tidy tokenizer xml xmlrpc xmlwriter xsl zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
                                   --with-png-dir=/usr/include/ --enable-gd-native-ttf \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) readline \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h \
    && docker-php-ext-configure gmp --with-gmp=/usr \
    && docker-php-ext-install -j$(nproc) gmp \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) imap

# TODO: ldap oci8 pdo_oci