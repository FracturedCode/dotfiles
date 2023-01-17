#!/bin/sh
echog Git
mkdir -p $CONFIG/git
# if [[ -f $CONFIG/git/config ]]
link_and_backup $(realpath configurations/git/gitconfig) $CONFIG/git/config

#if [[ -f ~/.gitconfig ]]
