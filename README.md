# README

## ORACLE support

* Download the Basic and SDK package of Oracle Instant Client from the official source (you need to accept a license): 
[http://www.oracle.com/technetwork/database/features/instant-client/index.html](http://www.oracle.com/technetwork/database/features/instant-client/index.html)
* Copy the contents of instantclient_xx.x folder from each package into  5.6/fpm/opt or 7.0/fpm/opt
* You can build the image now using build.sh. See in the next chapter.

## Build an image

Make sure the root folder is writable!

**PHP 7.0-fpm**:

Install all supported extensions:

    chmod +x ./build.sh
    ./build.sh 7.0/fpm -t myphpimage
    
or install only some specified additional extensions:

    chmod +x ./build.sh
    ./build.sh 7.0/fpm --build-arg PHP_EXT_GROUP=none PHP_EXT="gd bz2" --build-arg PECL_EXT_GROUP=none -t myphpimage

**PHP 5.6-fpm**:

Install all supported extensions:

    chmod +x ./build.sh
    ./build.sh 5.6/fpm -t myphpimage
    
or install only some specified additional extensions:

    chmod +x ./build.sh
    ./build.sh 5.6/fpm --build-arg PHP_EXT_GROUP=none PHP_EXT="gd bz2" --build-arg PECL_EXT_GROUP=none -t myphpimage


