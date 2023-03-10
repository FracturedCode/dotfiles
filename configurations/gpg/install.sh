#!/bin/sh

# gpg on wsl
backup_rm $HOME/.gnupg
mkdir -p $GNUPGHOME
link_and_backup configurations/gpg/gpg.conf $GNUPGHOME/gpg.conf
config_includes zsh && link_and_backup configurations/gpg/gpg.zsh $ZSH_CUSTOM/gpg.zsh
if [ ! -z ${SUDO_USER+x} ]; then
	chown -R $SUDO_USER $GNUPGHOME
fi