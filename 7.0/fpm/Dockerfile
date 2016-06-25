FROM php:7.0-fpm

COPY opt/oracle /opt/oracle
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
        libsnmp-dev \
        snmp \
    && docker-php-ext-install -j$(nproc) bcmath bz2 calendar ctype curl fileinfo dom exif ftp gettext \
                                         hash iconv intl json mbstring mcrypt mysqli opcache \
                                         pdo pdo_mysql phar posix recode session simplexml snmp \
                                         sockets tidy tokenizer xml xmlrpc xmlwriter xsl zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
                                   --with-png-dir=/usr/include/ --enable-gd-native-ttf \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) readline \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h \
    && docker-php-ext-configure gmp --with-gmp=/usr \
    && docker-php-ext-install -j$(nproc) gmp \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) imap \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && cd /opt/oracle/instantclient \
    && ICVERSION=$(ls libclntsh.*.* | grep -o '[0-9]\{2\}\.[0-9]\+') \
    && if [ "$ICVERSION" != "" ]; then \
            apt-get install -y libaio-dev \
            && ln -s libclntsh.so.* libclntsh.so \
            && ln -s libocci.so.* libocci.so \
            && echo /opt/oracle/instantclient >> /etc/ld.so.conf \
            && ldconfig \
            && docker-php-ext-configure oci8 --with-oci8=instantclient,/opt/oracle/instantclient \
            && docker-php-ext-install oci8 \
            && cd /opt/oracle/instantclient \
            && mkdir -p include/oracle/$ICVERSION/ \
            && cd include/oracle/$ICVERSION/ \
            && ln -s ../../../sdk/include client \
            && cd - \
            && mkdir -p lib/oracle/$ICVERSION/client \
            && cd lib/oracle/$ICVERSION/client \
            && ln -s ../../../../ lib \
            && cd - \
            && ORACLE_HOME=/opt/oracle/instantclient/lib/oracle/$ICVERSION/client/ docker-php-ext-configure pdo_oci; \
       fi;