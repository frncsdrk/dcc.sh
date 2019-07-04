#!/usr/bin/env bash
#
# build script for docker image

IMAGE_NAME="dcc.sh"

docker build -t "${IMAGE_NAME}" . "$@"
