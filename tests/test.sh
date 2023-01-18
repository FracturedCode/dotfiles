#!/bin/bash
set -e

cd $(dirname $(realpath $0))
source common.sh

echog --- Run all tests script ---

platforms=(alpine debian)
for platform in ${platforms[@]}; do
	echog Building $platform image
	NEW_IMAGE=$(./build.sh $platform -q)
	echo "$NEW_IMAGE"

	echog Running tests sequentially...
	for f in scripts/*; do
		docker-run-test $f $NEW_IMAGE zsh -c "./sometest.sh"
	done
done
