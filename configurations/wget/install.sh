#!/bin/sh
mkdir -p $CONFIG/wget
config_includes zsh && link_and_backup configurations/wget/wget-alias.zsh $ZSH_CUSTOM/wget-alias.zsh
