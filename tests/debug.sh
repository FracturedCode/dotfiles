#!/bin/bash

set -e
source common.sh

SCRIPT="${2:-scripts/install.sh}"
PLATFORM="${1:-alpine}"

docker-run-test $SCRIPT $IMAGE_REPO/$PLATFORM:latest
