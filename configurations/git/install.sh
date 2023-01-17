#!/bin/sh
echog Git
mkdir -p $CONFIG/git
# if [[ -f $CONFIG/git/config ]]
ln -sT $(realpath configurations/git/gitconfig) $CONFIG/git/config

#if [[ -f ~/.gitconfig ]]
