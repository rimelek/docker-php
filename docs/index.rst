============================================
PHP Docker images with additional extensions
============================================

I started this project in 2016 to support PHP Docker images based on the
`official Docker images of PHP <https://hub.docker.com/_/php/>`_,
but with the ability to add PHP extensions more easily without finding out every time which extension
requires what libraries installed on the host or in this case in the container.

Since I obviously can't support different images for every possible combination of required extensions,
I support one for each PHP version containing all the extensions supported by that version and this project.

You can still use this project to build your own image

.. toctree::
  :maxdepth: 2
  :caption: Contents:

  pages/supported-php-versions
  pages/extensions
  pages/build-image
