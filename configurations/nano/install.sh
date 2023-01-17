#!/bin/sh
mkdir -p $CONFIG/nano
link_and_backup $(realpath configurations/nano/nanorc) $CONFIG/nano/nanorc
link_and_backup configurations/nano/syntax-highlighting $CONFIG/nano/syntax-highlighting
echo "include $CONFIG/nano/syntax-highlighting/*.nanorc" >> configurations/nano/nanorc # TODO run at login
