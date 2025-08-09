#!/usr/bin/env sh

mkdir -p $XDG_DATA_HOME/icons
[[ -f ~/.icons ]] && mv ~/.icons/* $XDG_DATA_HOME/icons