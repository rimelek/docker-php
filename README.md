# README

## Introduction

This repository contains the source to build multiple PHP versions based on the [official Docker images of PHP](https://hub.docker.com/_/php/).
For now, the following versions are supported:

- PHP 5.6 FPM
- PHP 7.0 FPM
- PHP 7.1 FPM
- PHP 7.2 FPM
- PHP 7.3 fpm

It makes easier to install an extension without knowing which dependencies you need to install or how you have to configure
the dependencies before running the official docker-php-ext-install.

Only thing you need to do is specifying which extensions you want to be installed. You can also install every supported
extension if you do not specify any extension to install.

The "common" directory is a collection of files that will be copied to each specific PHP version's directory when you run "./prepare -s PATH".
Replace PATH with the actual path to a Dockerfile. 

**Example**

```bash
./prepare.sh -s 7.3/fpm
```
    
**Tip:**: It is recommended to pull the already [built images](https://hub.docker.com/r/itsziget/php/) from Docker Hub.
    
## oci8 and pdo_oci extensions

If you need to use oci8 and pdo_oci extensions, you have to download some files from Oracle's website. Follow the steps below
to install the extensions

* Download the Basic and SDK package of Oracle Instant Client from the official source (you need to accept a license): 
[http://www.oracle.com/technetwork/database/features/instant-client/index.html](http://www.oracle.com/technetwork/database/features/instant-client/index.html)
* Copy the contents of instantclient_xx.x directory from each package into  5.6/fpm/opt, 7.0/fpm/opt, 7.1/fpm/opt, 7.2/fpm/opt or 7.3/fpm/opt
* You can build the image now using prepare.sh and docker. See in the next chapter.

**Tip:** Faster way is building a custom image from existing images on Docker Hub. 

```dockerfile
FROM itsziget/php:7.3-fpm

COPY oracle/instantclient /opt/oracle/instantclient

RUN re-php-install-ext oci8 && re-php-install-ext pdo_oci
```
    
In this case copy the contents of "instantclient" directory to ./oracle/instantclient 

Then you can save the new image into your own private repository.

## Build an image

Make sure the root folder is writable!

Install all supported extensions:

```bash
./prepare.sh -s 7.3/fpm
cd build/7.3/fpm
docker build -t myphpimage .
```
    
or install only some specified additional extensions:

```bash
./prepare.sh -s 7.3/fpm
cd build/7.3/fpm
docker build --build-arg PHP_EXT_GROUP=none PHP_EXT="gd bz2" --build-arg PECL_EXT_GROUP=none -t myphpimage
```

You can change 7.3 to any supported version like 5.6, 7.0, 7.1 or 7.2
