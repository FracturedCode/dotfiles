#!/bin/bash

set -e
source common.sh

#TODO zsh completions
SCRIPT="${1:-scripts/install.sh}"

docker-run-test $SCRIPT $IMAGE_REPO:latest
