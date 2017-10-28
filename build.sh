#!/bin/sh

CUSTOM_TAG="${1}"

if [ -z "${CUSTOM_TAG}" ]; then
    >&2 echo "Missing tag"
    echo "Usage ./build.sh <tag-of-new-the-image>";
    exit 1;
fi;

DOCKER_VERSION=$(docker version -f '{{.Client.Version}}');

docker build --build-arg DOCKER_VERSION=${DOCKER_VERSION} -t ${CUSTOM_TAG} .

