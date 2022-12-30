## Path
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

## Aliases
alias gs="git status"


## Secrets
export $(grep -v '^#' .secrets.env | xargs -d '\n')

## Functions
echog() {
        GREEN='\033[0;32m'
        NOCOLOR='\033[0m'
        echo -e "${GREEN}${@}${NOCOLOR}"
}

cde() {
	cd ~/src/Ehi/$1
	git status
}
