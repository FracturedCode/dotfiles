#!/bin/sh

export RED='\033[0;31m'
export NOCOLOR='\033[0m'

echog() {
	GREEN='\033[0;32m'
	echo -e "${GREEN}${@}${NOCOLOR}" # TODO this actually outputs -e on some platforms
}

nextsuffix() {
	local nonum="$1.bak"
	local bak="$nonum"
	local count=1
	while [ -e "$bak" ]; do
		bak="$nonum.$count"
		count=$((count+1))
	done
	echo "$bak"
}

link_and_backup() {
	if [ -e "$2" ]; then
		bak=$(nextsuffix "$2")
		mv "$2" "$bak"
	fi
	ln -s $@
}