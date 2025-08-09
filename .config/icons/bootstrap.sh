#!/usr/bin/env sh

mkdir -p $XDG_DATA_HOME/icons
[[ -d ~/.icons ]] && mv ~/.icons/* $XDG_DATA_HOME/icons