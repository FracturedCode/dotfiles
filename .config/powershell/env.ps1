#!/usr/bin/env -S pwsh -NoProfile

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

# Info
$Env:USER ??= (whoami)

# Application-specific variables
function Set-DotEnv {
	param([string]$Path)
	Get-Content $Path | Foreach-Object {
		if ([String]::IsNullOrWhiteSpace($_) -or $_.TrimStart().StartsWith('#')) {
			return
		}
		$equalsSign = $_.IndexOf('=')
		$name = $_.Substring(0, $equalsSign)
		$value = Invoke-Expression -Command $_.Substring($equalsSign + 1)
		Set-Content env:\$name $value
	}
}

Get-ChildItem -Hidden "$XDG_CONFIG_HOME/*/.env" | Foreach-Object {
	Set-DotEnv -Path $_.FullName
}