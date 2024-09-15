PHP Docker images with additional extensions
============================================

I started this project in 2016 to support PHP Docker images based on the
[official Docker images of PHP](https://hub.docker.com/_/php/),
but with the ability to add PHP extensions more easily without finding out every time which extension
requires what libraries installed on the host or in this case in the container.

Since I obviously can't support different images for every possible combination of required extensions,
I support one for each PHP version containing all the extensions supported by that version and this project,
but you can also use this project to build your own image.

You will find a branch for each PHP version in the git repository containing this intro text.
For more details and supported tag and extensions, visit the documentation on [Read the Docs](https://readthedocs.org/).

Documentation: https://php-docker-images.readthedocs.io/

