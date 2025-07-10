
link_and_backup configurations/zsh/ohmyzsh $ZSH
link_and_backup configurations/zsh/custom $ZSH_CUSTOM
# TODO include gitstatusd
link_and_backup configurations/zsh/zshrc ${ZDOTDIR:-$HOME}/.zshrc