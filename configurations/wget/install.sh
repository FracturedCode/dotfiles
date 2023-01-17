#!/bin/sh
echog Wget
mkdir -p $CONFIG/wget
# https://stackoverflow.com/questions/47548271/disable-wget-history-tracking/54843736
echo "alias wget='wget --hsts-file $XDG_CONFIG_HOME/wget/hsts'" >> $ZSH_CUSTOM/aliases.zsh # TODO make contingent on zsh config being installed
