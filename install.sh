#!/bin/sh
set -e # exit on any failure

## Supported scenarios/features:
# Different config home
#
# atm this is a dumb script that assumes that there is no existing config
# and that dependencies (for which the configuration files are for) are already installed in the assumed locations
# and that you have internet access
# and that you have su permissions

CONFIG=${XDG_CONFIG_HOME:-~/.config}

echog() {
        GREEN='\033[0;32m'
        NOCOLOR='\033[0m'
        echo -e "${GREEN}${@}${NOCOLOR}"
}

# TODO if replace

echog Placing configurations
echo
echo

## Git
echog Git
mkdir -p $CONFIG/git
# if [[ -f $CONFIG/git/config ]]
ln -s gitconfig $CONFIG/git/config

#if [[ -f ~/.gitconfig ]]


## Nano
echog Nano
mkdir -p $CONFIG/nano
ln -s nanorc $CONFIG/nano/nanorc


## Zsh
echog Zsh w/ oh-my-zsh
ln -s zshrc ${ZDOTDIR:-$HOME}/.zshrc

# oh-my-zsh
ZSH=${ZSH:-$CONFIG/oh-my-zsh}
ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}
#if [[ ! -d "$ZSH_CUSTOM" ]]; then
ln -s oh-my-zsh $ZSH_CUSTOM
#fi

# Set zsh as default shell
if [ "$SHELL" != "*zsh" ]; then
	echo Changing shell to zsh
	chsh /bin/zsh
fi
