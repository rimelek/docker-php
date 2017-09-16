# README

## Introduction

This repository contains the source to build multiple PHP versions based on the [official Docker images of PHP](https://hub.docker.com/_/php/).
For now, only PHP 5.6 FPM, PHP 7.0 FPM and PHP 7.1 FPM are supported. 

It makes easier to install an extension without knowing which dependencies you need to install or how you have to configure
the dependencies before running the official docker-php-ext-install.

Only thing you need to do is specifying which extensions you want to be installed. You can also install every supported
extension if you do not specify any extension to install.

The "common" directory is a collection of files that will be copied to each specific PHP version's directory when you run "./build.sh PATH".
Replace PATH with the actual path to a Dockerfile. 

**Example**

```bash
./build.sh 7.0/fpm
```
    
**Tip:**: It is recommended to pull the already [built images](https://hub.docker.com/r/itsziget/php/) from Docker Hub.
    
## oci8 and pdo_oci extensions

If you need to use oci8 and pdo_oci extensions, you have to download some files from Oracle's website. Follow the steps below
to install the extensions

* Download the Basic and SDK package of Oracle Instant Client from the official source (you need to accept a license): 
[http://www.oracle.com/technetwork/database/features/instant-client/index.html](http://www.oracle.com/technetwork/database/features/instant-client/index.html)
* Copy the contents of instantclient_xx.x directory from each package into  5.6/fpm/opt, 7.0/fpm/opt or 7.1/fpm/opt
* You can build the image now using build.sh. See in the next chapter.

**Tip:** Faster way is building a custom image from existing images on Docker Hub. 

```dockerfile
FROM itsziget/php:7.0-fpm

COPY oracle/instantclient /opt/oracle/instantclient

RUN re-php-install-ext oci8 && re-php-install-ext pdo_oci
```
    
In this case copy the contents of "instantclient" directory to ./oracle/instantclient 

Then you can save the new image into your own private repository.

## Build an image

Make sure the root folder is writable!

**PHP 7.1-fpm**:

Install all supported extensions:

```bash
chmod +x ./build.sh
./build.sh 7.1/fpm -t myphpimage
```
    
or install only some specified additional extensions:

```bash
chmod +x ./build.sh
./build.sh 7.1/fpm --build-arg PHP_EXT_GROUP=none PHP_EXT="gd bz2" --build-arg PECL_EXT_GROUP=none -t myphpimage
```

**PHP 7.0-fpm**:

Install all supported extensions:

```bash
chmod +x ./build.sh
./build.sh 7.0/fpm -t myphpimage
```
    
or install only some specified additional extensions:

```bash
chmod +x ./build.sh
./build.sh 7.0/fpm --build-arg PHP_EXT_GROUP=none PHP_EXT="gd bz2" --build-arg PECL_EXT_GROUP=none -t myphpimage
```

**PHP 5.6-fpm**:

Install all supported extensions:

```bash
chmod +x ./build.sh
./build.sh 5.6/fpm -t myphpimage
```
    
or install only some specified additional extensions:

```bash
chmod +x ./build.sh
./build.sh 5.6/fpm --build-arg PHP_EXT_GROUP=none PHP_EXT="gd bz2" --build-arg PECL_EXT_GROUP=none -t myphpimage
```
