#!/bin/bash

source ../common.sh

export IMAGE_REPO='fc/dotfiles/test'

docker-run-test() {
	echog "$1"
	docker run --rm -it \
		-e TERM -e COLORTERM -e LC_ALL=C.UTF-8 \
		-v $(realpath "$1"):/home/test/sometest.sh \
		"${@:2}"
}
