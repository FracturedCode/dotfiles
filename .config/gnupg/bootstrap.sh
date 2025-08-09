#!/usr/bin/env sh

rm -rf $HOME/.gnupg
mkdir -p "${XDG_DATA_HOME}/gnupg"
rm "${XDG_DATA_HOME}/gnupg/gpg.conf"
ln -s "${XDG_CONFIG_HOME}/gnupg/gpg.conf" "${XDG_DATA_HOME}/gnupg/gpg.conf"