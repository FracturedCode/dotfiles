#!/bin/sh

# gpg on wsl
backup_rm "$GNUPGHOME"
mkdir -p $GNUPGHOME
link_and_backup configurations/gpg/gpg.conf $GNUPGHOME/gpg.conf
config_includes zsh && link_and_backup configurations/gpg/gpg.zsh $ZSH_CUSTOM/gpg.zsh
link_and_backup configurations/gpg/gpg-relay $HOME/.local/bin/gpg-relay
