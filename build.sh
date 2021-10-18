#!/bin/bash

CONTAINER=cuda10.0-cudnn7-ubuntu18.04-python3.7-tf1.14-devel
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
