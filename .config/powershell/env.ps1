#!/usr/bin/env pwsh

# XDG
$Env:XDG_CONFIG_HOME="$HOME/.config"
$Env:XDG_DATA_HOME="$HOME/.local/share"
$Env:XDG_STATE_HOME="$HOME/.local/state"
$Env:XDG_CACHE_HOME="$HOME/.cache"

$XDG_CONFIG_HOME = $Env:XDG_CONFIG_HOME
$XDG_DATA_HOME = $Env:XDG_DATA_HOME
$XDG_STATE_HOME = $Env:XDG_STATE_HOME
$XDG_CACHE_HOME = $Env:XDG_CACHE_HOME

# Path
$Env:PATH = "$HOME/.local/bin:" + $Env:PATH

# Misc preferences
$Env:LANG="en_US.UTF-8"
$Env:EDITOR="nano"
$Env:VISUAL = "nano"
$Env:LS_COLORS = (vivid generate molokai)
$Env:BROWSER = "firefox"
$Env:TERMINAL = "kitty"

$Env:GPG_TTY = $(tty)
$Env:GNUPGHOME = "$XDG_CONFIG_HOME/gnupg"

# Info
$Env:USER ??= (whoami)