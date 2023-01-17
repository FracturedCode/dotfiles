#!/bin/zsh

echo test: backups.sh

source ./.config/dotfiles/common.sh

test_new_link() {
	if [ ! -L "$LINK" ] || [ ! -e "$LINK" ]; then
		exit 1
	fi
}

mkdir backup
echo "helloworld" > test.txt
LINK="$(realpath backup)/txt"
SOURCE="$(realpath test.txt)"
echo Initial link
link_and_backup "$SOURCE" "$LINK"
test_new_link
echo First backup
link_and_backup "$SOURCE" "$LINK"
test_new_link
if [ ! -L "$LINK.bak" ] || [ ! -e "$LINK.bak" ]; then
	exit 1
fi
echo Second backup
link_and_backup "$SOURCE" "$LINK"
test_new_link
if [ ! -L "$LINK.bak.1" ] || [ ! -e "$LINK.bak.1" ]; then
	exit 1
fi
echo Third backup
link_and_backup "$SOURCE" "$LINK"
echo testing link
test_new_link
echo testing backup
if [ ! -L "$LINK.bak.2" ] || [ ! -e "$LINK.bak.2" ]; then
	exit 1
fi
echo Done
