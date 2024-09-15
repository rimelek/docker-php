FROM php:8.2-fpm

COPY opt/oracle /opt/oracle
COPY bin/* /usr/local/bin/
COPY Dockerfile.sh /usr/local/bin/re-php-Dockerfile.sh

ARG PHP_EXT_GROUP=ALL
ARG PHP_EXT=""
ARG PECL_EXT_GROUP=ALL
ARG PECL_EXT=""


ARG PECL_EXT_GROUP_ALL="\
imagick \
channel://pecl.php.net/xmlrpc-1.0.0RC3 \
"
ARG PHP_EXT_GROUP_ALL="\
bcmath \
bz2 \
calendar \
ctype \
curl \
fileinfo \
dom \
exif \
ftp \
gettext \
hash \
iconv \
intl \
json \
mbstring \
mysqli \
opcache \
pdo \
pdo_mysql \
phar \
posix \
session \
simplexml \
snmp \
sockets \
tidy \
tokenizer \
xml \
xmlwriter \
xsl \
zip \
gd \
gmp \
imap \
ldap \
oci8 \
pdo_oci \
readline \
"



RUN chmod +x /usr/local/bin/re-php-* \
 && chmod +x /usr/local/bin/re-pecl-* \
 && sync \
 && /usr/local/bin/re-php-Dockerfile.sh \
 && unlink /usr/local/bin/re-php-Dockerfile.sh
