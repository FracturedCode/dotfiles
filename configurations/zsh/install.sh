#!/bin/sh
echog Zsh w/ oh-my-zsh
ln -sT $(realpath configurations/zsh/zshrc) ${ZDOTDIR:-$HOME}/.zshrc

# oh-my-zsh
ln -s $(realpath configurations/zsh/ohmyzsh) $ZSH

rm -rf $ZSH_CUSTOM
ln -s $(realpath configurations/zsh/custom) $ZSH_CUSTOM

# Set zsh as default shell
if [ "$SHELL" != "*zsh" ]; then
	echo Changing default shell to zsh
	# Using awk because this can enable unattended scripts whereas chsh requires a password input and isn't installed on alpine by default.
	# awk is on practically every non-windows machine in the world and we don't need that password prompt
	# https://www.unix.com/shell-programming-and-scripting/194045-change-default-shell-specific-user-awk.html
	# https://archive.fracturedcode.net/archive/1672468429.577091/index.html
	cat /etc/passwd | awk -F":" -v USERNAME="$SUDO_USER" -v NEWSHELL="/bin/zsh" -F: '$1 == USERNAME { $7=NEWSHELL }; 1' OFS=":" > /etc/passwd # TODO make non sudo option
fi