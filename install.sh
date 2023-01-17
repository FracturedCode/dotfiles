#!/bin/sh
#
# Supported scenarios/features:
# Different config home
#
# Supported distros:
# alpine
#
# Assumptions:
# atm this is a dumb script that assumes that there is no existing config in the locations they are to be installed in
# and that dependencies (for which the configuration files are for) are already installed in the assumed locations
# and that you have internet access
# and that it is run with "sudo -E"
# and that this is an attended, interactive terminal
#
# Assertions:
# That your $ZSH_CUSTOM is empty
#
# Destructivity:
# This script is not destructive. It will not replace your own dotfiles.
# As a consequence there could be variation in behavior based on the program
# if there are multiple locations the program checks for config and multiple locations are populated
# say if you had your own configuration already there
#
# Dependencies:
# git nano zsh wget
# Dependencies/syntax almost certainly available already:
# awk ln mkdir echo rmdir if source var=
#
# Configurations are installed for:
# git
# nano
# zsh
# oh-my-zsh
# wget
#
# Customizable vars:
# XDG_CONFIG_HOME # config home. Typically ~/.config # TODO add this to zshenv if different
# ZSH # zsh configuration dir. With OMZ. Typically ~/.oh-my-zsh, but this script assumes $CONFIG/oh-my-zsh
# ZSH_CUSTOM # zsh custom config dir. Typically $ZSH/custom
# ZDOTDIR # where z files live, ie .zshenv, .zshrc, etc. Typically $HOME

set -e # fail on any error and output a message
trap '
LE_EXITCODE=$?
if [ $LE_EXITCODE != 0 ]; then
	echo -e "${RED}Script failed with exit code $LE_EXITCODE. View stderr for more info.${NOCOLOR}"
fi
exit' EXIT

source common.sh

CONFIG=${XDG_CONFIG_HOME:-$HOME/.config}

echog "--- Installing dotfiles. Config home: $CONFIG ---"

## Git
echog Git
mkdir -p $CONFIG/git
# if [[ -f $CONFIG/git/config ]]
ln -sT $(realpath gitconfig) $CONFIG/git/config

#if [[ -f ~/.gitconfig ]]


## Nano
echog Nano
mkdir -p $CONFIG/nano
ln -sT $(realpath nano/nanorc) $CONFIG/nano/nanorc
cp -r nano/syntax-highlighting $CONFIG/nano/
echo "include $CONFIG/nano/syntax-highlighting/*.nanorc" >> nano/nanorc


## Zsh
echog Zsh w/ oh-my-zsh
ln -sT $(realpath zshrc) ${ZDOTDIR:-$HOME}/.zshrc

# oh-my-zsh
ZSH=${ZSH:-$CONFIG/oh-my-zsh}
ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}

ln -s $(realpath oh-my-zsh/ohmyzsh) $ZSH

# if [[ ! -d "$ZSH_CUSTOM" ]]; then
# 	mkdir -p $ZSH_CUSTOM
# fi
# rmdir $ZSH_CUSTOM # intentionally fail on not-empty dir
ln -s $(realpath oh-my-zsh/custom) $ZSH_CUSTOM

# Set zsh as default shell
if [ "$SHELL" != "*zsh" ]; then
	echo Changing default shell to zsh
	# Using awk because this can enable unattended scripts whereas chsh requires a password input and isn't installed on alpine by default.
	# awk is on practically every non-windows machine in the world and we don't need that password prompt
	# https://www.unix.com/shell-programming-and-scripting/194045-change-default-shell-specific-user-awk.html
	# https://archive.fracturedcode.net/archive/1672468429.577091/index.html
	cat /etc/passwd | awk -F":" -v USERNAME="$SUDO_USER" -v NEWSHELL="/bin/zsh" -F: '$1 == USERNAME { $7=NEWSHELL }; 1' OFS=":" > /etc/passwd
fi


## Wget
echog Wget
mkdir -p $CONFIG/wget
# https://stackoverflow.com/questions/47548271/disable-wget-history-tracking/54843736
echo "alias wget='wget --hsts-file $XDG_CONFIG_HOME/wget/hsts'" >> $ZSH_CUSTOM/aliases.zsh
