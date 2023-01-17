#!/bin/bash

source common.sh
PLATFORM="$1"
cp .dockerignore ..
NEW_IMAGE=$(docker build $QUIET \
	-t $IMAGE_REPO/$PLATFORM:latest \
	-t $IMAGE_REPO/$PLATFORM:$(date +"%F-%H.%M.%S") \
	-f Dockerfile \
	--target=$PLATFORM \
	"${@:2}" \
	..)
rm ../.dockerignore
echo "$NEW_IMAGE"
