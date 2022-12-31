#!/bin/bash

cd $(realpath $0)
source common.sh

echog --- Run all tests script ---

echog Building image
NEW_IMAGE=$(./build.sh -q)
echo NEW_IMAGE

echog Running tests sequentially...
for f in scripts/*; do
	docker-run-test $f $NEW_IMAGE ./sometest.sh
done
