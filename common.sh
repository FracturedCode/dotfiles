#!/bin/sh

export RED='\033[0;31m'
export NOCOLOR='\033[0m'

echog() {
        GREEN='\033[0;32m'
        echo -e "${GREEN}${@}${NOCOLOR}" # TODO this actually outputs -e on some platforms
}
