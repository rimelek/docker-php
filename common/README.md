# Supported tags

- 7.2-fpm ([7.2/fpm/Dockerfile](https://github.com/rimelek/docker-php/blob/build/7.2/fpm/Dockerfile))
- 7.1-fpm ([7.1/fpm/Dockerfile](https://github.com/rimelek/docker-php/blob/build/7.1/fpm/Dockerfile))
- 7.0-fpm ([7.0/fpm/Dockerfile](https://github.com/rimelek/docker-php/blob/build/7.0/fpm/Dockerfile))
- 5.6-fpm ([5.6/fpm/Dockerfile](https://github.com/rimelek/docker-php/blob/build/5.6/fpm/Dockerfile))

# Introduction

Using the [official Docker images of PHP](https://hub.docker.com/_/php/) you need to know which dependencies needed to install
and how to configure it before running docker-php-ext-install. This repository contains images with many additional
extensions. You can even install oci8 and pdo_oci. 

All images in this repository based on the official Docker images but gives you more extensions.
If you want to install less extensions but more than provided by the official version, you can use the source [from
github](https://github.com/rimelek/docker-php/tree/master) and install only some of the supported extensions.

For more information about how PHP images works or using smaller official images based on alpine linux for example, 
please, visit the [official repository of PHP](https://hub.docker.com/_/php/).

Currently, all downloadable images from this repository based on Debian.

# Supported extensions

**PHP**

- bz2
- curl
- dom
- ftp
- gd
- gmp
- imap
- intl
- ldap
- mcrypt
- oci8
- pdo_oci
- readline
- recode
- simplexml
- snmp
- tidy
- xml
- xmlreader
- xmlrpc
- xmlwriter
- xsl

**PECL**

- imagick