#!/bin/bash

source common.sh

cp .dockerignore ..
NEW_IMAGE=$(docker build $QUIET \
	-t $IMAGE_REPO:latest \
	-t $IMAGE_REPO:$(date +"%F-%H.%M.%S") \
	-f Dockerfile \
	$@ \
	..)
rm ../.dockerignore
echo "$NEW_IMAGE"
