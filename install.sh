#!/bin/sh
# It is preferred to run with "sudo -E ./install.sh", but "./install.sh" will work.
#
# Supported distros:
# alpine
# debian
#
# Assumptions:
# that dependencies (for which the configuration files are for) are already installed in the assumed locations
# and that you have internet access (initial config should work, but powerlevel10k will search for gitstatusd first run)
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
# INSTALL_CONFIGS # a space delimited list of programs to install configs for

. ./common.sh

export CONFIG=${XDG_CONFIG_HOME:-$HOME/.config}
export GNUPGHOME=${GNUPGHOME:-$CONFIG/gnupg}