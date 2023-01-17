#!/bin/sh
mkdir -p $CONFIG/nano
backup_rm ~/.config/nano/nanorc # this is here for a reason
link_and_backup $(realpath configurations/nano/nanorc) $CONFIG/nano/nanorc
backup_rm ~/.nanorc
link_and_backup $(realpath configurations/nano/syntax-highlighting) $CONFIG/nano/syntax-highlighting
echo "include $CONFIG/nano/syntax-highlighting/*.nanorc" >> configurations/nano/nanorc
