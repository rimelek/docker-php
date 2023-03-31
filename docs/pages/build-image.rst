====================
Build your own image
====================

Before you begin
================

Clone the repository

.. code-block:: bash

    git clone https://github.com/rimelek/docker-php.git ./rimelek-docker-php
    cd ./rimelek-docker-php

Using the repository the only thing you need to do is specify which extensions you want to be installed.
You can also install every supported extension if you do not specify any extension to install.

The "common" directory is a collection of files that will be copied to each specific PHP version's directory when you
run :code:`./prepare.sh -s PATH`. Replace PATH with the actual path to a PHP version.

**Example**

.. code-block:: bash

  ./prepare.sh -s 8.1/fpm


.. note:: You can also pull the already `built images <https://hub.docker.com/r/itsziget/php/>`_ from Docker Hub.

oci8 and pdo_oci extensions
===========================

If you need to use :code:`oci8` and :code:`pdo_oci` extensions, you have to download some files from Oracle's website.
Follow the steps below to install the extensions

* Download the Basic and SDK package of Oracle Instant Client from the official source (you may need to accept a license):
  `Instant client <http://www.oracle.com/technetwork/database/features/instant-client/index.html>`_
* Copy the contents of :code:`instantclient_xx.x` directory from each package into  :code:`common/opt/oracle/instantclient`
* You can build the image now using :code:`prepare.sh` and Docker. See in the next chapter.

.. note::

  Faster way is building a custom image from existing images on Docker Hub, although you could end up having
  more extensions than you really need.

.. code-block:: Dockerfile

    FROM itsziget/php:8.1-fpm

    COPY oracle/instantclient /opt/oracle/instantclient

    RUN re-php-install-ext oci8 && re-php-install-ext pdo_oci


In this case copy the contents of :code:`instantclient` directory to :code:`./oracle/instantclient`

Then you can save the new image into your own private repository.

Build an image
==============

Make sure the project root folder is writable as the the script needs to create a folder called "build"!

Install all supported extensions:

.. code-block:: bash

    ./prepare.sh -s 8.1/fpm
    cd build/8.1/fpm
    docker build -t myphpimage .


or install only some specified additional extensions:

.. code-block:: bash

    ./prepare.sh -s 8.1/fpm
    cd build/8.1/fpm
    docker build --build-arg PHP_EXT_GROUP=none PHP_EXT="gd bz2" --build-arg PECL_EXT_GROUP=none -t myphpimage


You can change 8.1 to any supported version like 5.6, 7.0, 7.1, 7.2, 7.3, 7.4, 8.0
