#!/bin/sh
mkdir -p $CONFIG/wget
# https://stackoverflow.com/questions/47548271/disable-wget-history-tracking/54843736
config_includes zsh && link_and_backup $(realpath wget-alias.zsh) $ZSH_CUSTOM/wget-alias.zsh
