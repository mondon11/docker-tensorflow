#!/bin/bash

CONTAINER=cuda11.4.1-cudnn8-ubuntu18.04-python3.7-tf1.14-torch1.10-devel
TAG=$(date '+%Y%m%d%H%M%S') 

DOCKER_IMAGE=$CONTAINER:$TAG

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#BUILDROOT=$DIR/..
BUILDROOT=$DIR

cmd="docker build \
    -t $DOCKER_IMAGE \
    -f $DIR/Dockerfile \
    $BUILDROOT"
echo $cmd
eval $cmd
