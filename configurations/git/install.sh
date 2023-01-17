#!/bin/sh
mkdir -p $CONFIG/git
link_and_backup $(realpath configurations/git/gitconfig) $CONFIG/git/config
if [[ -f ~/.gitconfig ]]; then
    backup_rm ~/.gitconfig
fi
# TODO add forcepull script