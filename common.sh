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

backup_rm() {
	FILE="$1"
	if [ -e "$FILE" ]; then
		bak=$(nextsuffix "$FILE")
		mv "$FILE" "$bak"
		echo Backed up "$FILE" to "$bak"
	fi
}

link_and_backup() {
	LINK="$2"
	backup_rm "$LINK"
	ln -s "$(realpath $1)" "$LINK"
}

config_includes() {
	if test "${INSTALL_CONFIGS#*$1}" != "$INSTALL_CONFIGS"; then
		return 0
	else
		return 1
	fi
}