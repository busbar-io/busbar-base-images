#!/bin/bash

#
# build_and_push.sh - Build and push application base images
#

# Variables
registry=$1
suported_images='java node ruby'

# Functions
usage () {
    echo
    echo "build_and_push.sh - Build and push application base images"
    echo
    echo "Usage:"
    echo "    $0 <docker_registry> [image] [version]"
    echo
    echo "If just the image is passed all versions under that image will be build and pushed"
    echo "If no image nor version is passed the script will build and push all available Docker images"
    echo
}

build_and_push () {
    image=$1
    version=$2

    # Docker build
    docker build --rm --force-rm -t ${image}:${version} -t ${image}:latest ${image}/${version} || exit 1

    # Docker tag
    docker tag ${image}:${version} ${registry}/${image}:${version}
    docker tag ${image}:latest ${registry}/${image}:latest

    # Docker push
    docker push ${registry}/${image}:${version}
    docker push ${registry}/${image}:latest
}

# Validation
if [[ $# < 1 ]]; then
    usage
    exit 1
fi

# Action
if [[ $# == 1 ]]; then
    for image in $suported_images; do
        for version in $(ls $image); do
            build_and_push $image $version
        done
    done

elif [[ $# == 2 ]]; then
    image=$2
    for version in $(ls $image); do
        build_and_push $image $version
    done

elif [[ $# == 3 ]]; then
    image=$2
    version=$3
    build_and_push $image $version
fi

exit 0
