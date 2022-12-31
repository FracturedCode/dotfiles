#!/bin/sh

echog() {
        GREEN='\033[0;32m'
        NOCOLOR='\033[0m'
        echo -e "${GREEN}${@}${NOCOLOR}"
}
