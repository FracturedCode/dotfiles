#!/usr/bin/env sh

# This enables the user systemctl services
which systemctl
if [ $? -eq 0 ]; then
	for file in $XDG_CONFIG_HOME/systemd/user/*; do
		if [ -f "$file" ]; then
			echo "Processing user service: $(basename '$file')"
			systemctl --user enable $file
			systemctl --user daemon-reload
			systemctl --user start $file
		fi
	done
fi