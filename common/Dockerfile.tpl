FROM php:{{TAG}}

COPY opt/oracle /opt/oracle
COPY bin/* /usr/local/bin/
COPY Dockerfile.sh /usr/local/bin/re-php-Dockerfile.sh

ARG PHP_EXT_GROUP=ALL
ARG PHP_EXT=""
ARG PECL_EXT_GROUP=ALL
ARG PECL_EXT=""

{{ARGS}}

RUN chmod +x /usr/local/bin/re-php-* \
 && chmod +x /usr/local/bin/re-pecl-* \
 && sync \
 && /usr/local/bin/re-php-Dockerfile.sh \
 && unlink /usr/local/bin/re-php-Dockerfile.sh
