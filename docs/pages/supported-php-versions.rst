===============================
Supported PHP versions and tags
===============================

Although the official PHP Docker images have multiple variants, this project currently supports only Debian-based
PHP FPM images.

.. list-table:: Supported tags
   :header-rows: 1

   * - tags
     - Dockerfile
   * - 8.3-fpm, latest
     - `8.3/fpm/Dockerfile <https://github.com/rimelek/docker-php/blob/build/8.3/fpm/Dockerfile>`_
   * - 8.2-fpm
     - `8.2/fpm/Dockerfile <https://github.com/rimelek/docker-php/blob/build/8.2/fpm/Dockerfile>`_
   * - 8.1-fpm
     - `8.1/fpm/Dockerfile <https://github.com/rimelek/docker-php/blob/build/8.1/fpm/Dockerfile>`_
   * - 8.0-fpm
     - `8.0/fpm/Dockerfile <https://github.com/rimelek/docker-php/blob/build/8.0/fpm/Dockerfile>`_
   * - 7.4-fpm
     - `7.4/fpm/Dockerfile <https://github.com/rimelek/docker-php/blob/build/7.4/fpm/Dockerfile>`_
   * - 7.3-fpm
     - `7.3/fpm/Dockerfile <https://github.com/rimelek/docker-php/blob/build/7.3/fpm/Dockerfile>`_
   * - 7.2-fpm
     - `7.2/fpm/Dockerfile <https://github.com/rimelek/docker-php/blob/build/7.2/fpm/Dockerfile>`_
   * - 7.1-fpm
     - `7.1/fpm/Dockerfile <https://github.com/rimelek/docker-php/blob/build/7.1/fpm/Dockerfile>`_
   * - 7.0-fpm
     - `7.0/fpm/Dockerfile <https://github.com/rimelek/docker-php/blob/build/7.0/fpm/Dockerfile>`_
   * - 5.6-fpm
     - `5.6/fpm/Dockerfile <https://github.com/rimelek/docker-php/blob/build/5.6/fpm/Dockerfile>`_


You can use any of the above tags to pull a PHP Docker image. If you need PHP 8.1, just run

.. code-block:: bash

  docker pull rimelek/php:8.1-fpm

You can also get more detauls about the images and tags without pulling them by going to
Docker Hub: https://hub.docker.com/r/rimelek/php

.. note::

    You might find some old references to :code:`itsziget/php` which is the previous name of this image repository.
    I realize that I can't just move an image to a different repository and move it back, so I am going to
    keep that repository indefinitely as an alias of :code:`rimelek/php`, but it is recommended to use the namespace
    :code:`rimelek`, since this is what I will focus on and probably check more frequently.

