# XDG
$Env:XDG_CONFIG_HOME = "$HOME/.config"
$Env:XDG_DATA_HOME = "$HOME/.local/share"
$Env:XDG_STATE_HOME = "$HOME/.local/state"

# Variables
$Env:GPG_TTY = (tty)
$Env:GNUPGHOME = $XDG_CONFIG_HOME/gnupg


# Path

# Functions
function Assert-IsInteractiveShell {
    # Test each Arg for match of abbreviated '-NonInteractive' command.
    $NonInteractive = [Environment]::GetCommandLineArgs() | Where-Object{ $_ -like '-NonI*' }

    if ([Environment]::UserInteractive -and -not $NonInteractive) {
        # We are in an interactive shell.
        return $true
    }

    return $false
}

# Aliases
function gs { git status }
function wget {
    # https://stackoverflow.com/questions/47548271/disable-wget-history-tracking/54843736
    wget --hsts-file $XDG_STATE_HOME/wget/hsts $args
}

# Prompt
if (Assert-IsInteractiveShell) {
	hyfetch -b fastfetch
	oh-my-posh init pwsh --config $PSScriptRoot/fracturedcode.omp.json | Invoke-Expression
}
