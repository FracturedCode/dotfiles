#!/bin/sh
# It is preferred to run with "sudo -E ./install.sh", but "./install.sh" will work.
#
# Supported distros:
# alpine
# debian
#
# Assumptions:
# atm this is a dumb script that assumes that there is no existing config in the locations they are to be installed in
# and that dependencies (for which the configuration files are for) are already installed in the assumed locations
# and that you have internet access
#
# Destructivity:
# This script will replace your configs if you leave the program in INSTALL_CONFIGS,
# but it will back them up.
#
# Configurations are installed for:
# git
# nano
# zsh
# wget
# gpg (on wsl)
#
# Customizable vars:
# XDG_CONFIG_HOME # config home. Typically ~/.config
# ZSH # zsh configuration dir. With OMZ. Typically ~/.oh-my-zsh, but this script assumes $CONFIG/oh-my-zsh
# ZSH_CUSTOM # zsh custom config dir. Typically $ZSH/custom
# ZDOTDIR # where z files live, ie .zshenv, .zshrc, etc. Typically $HOME
# GNUPGHOME

set -e # fail on any error and output a message
trap '
LE_EXITCODE=$?
if [ $LE_EXITCODE != 0 ]; then
	echo -e "${RED}Script failed with exit code $LE_EXITCODE. View stderr for more info.${NOCOLOR}"
fi
exit' EXIT

. ./common.sh

export CONFIG=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR
export ZSH=${ZSH:-$CONFIG/oh-my-zsh}
export ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}
export GNUPGHOME=${GNUPGHOME:-$CONFIG/gnupg}

echog "--- Installing dotfiles. Config home: $CONFIG ---"

INSTALL_CONFIGS="git nano zsh wget gpg"
for program in $INSTALL_CONFIGS; do
	echo "Installing config for: $program"
	. ./configurations/$program/install.sh
done
