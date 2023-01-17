#!/bin/sh
echog Nano
mkdir -p $CONFIG/nano
ln -sT $(realpath configurations/nano/nanorc) $CONFIG/nano/nanorc
ln -s configurations/nano/syntax-highlighting $CONFIG/nano/syntax-highlighting
echo "include $CONFIG/nano/syntax-highlighting/*.nanorc" >> configurations/nano/nanorc # TODO run at login
