# Busbar Application Base Image

Base Docker images for building application containers.

## build_and_push.sh

The build_and_push.sh script can build and push some or all images:

```
build_and_push.sh - Build and push application base images

Usage:
    ./build_and_push.sh <docker_registry> [image] [version]

If just the image is passed all versions under that image will be build and pushed
If no image nor version is passed the script will build and push all available Docker images
```
