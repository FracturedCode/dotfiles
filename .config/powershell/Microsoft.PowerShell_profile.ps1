# XDG
$Env:XDG_CONFIG_HOME = "$HOME/.config"
$Env:XDG_DATA_HOME = "$HOME/.local/share"
$Env:XDG_STATE_HOME = "$HOME/.local/state"

$XDG_CONFIG_HOME = $Env:XDG_CONFIG_HOME
$XDG_DATA_HOME = $Env:XDG_DATA_HOME
$XDG_STATE_HOME = $Env:XDG_STATE_HOME

# Variables
$Env:GPG_TTY = (tty)
$Env:GNUPGHOME = "$XDG_CONFIG_HOME/gnupg"
$Env:LANG="en_US.UTF-8"
$Env:EDITOR="nano"
$Env:LS_COLORS = (vivid generate molokai)

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

function Get-CustomFormatChildItem {
    Get-ChildItem -Force $args | `
        Select-Object UnixMode, User, Group, LastWriteTime, Size, @{ Name = "Name"; Expression = {Format-TerminalIcons $_} } | `
        Format-Table
}

function Install-Modules {
    param([string[]]$modules)
    $modules | Foreach-Object {
        if (-not (Get-Module -ListAvailable -Name $_)) {
            Write-Host "$_ not found. Installing"
            Install-Module -Name $_ -Force -Scope CurrentUser
        }
    }
}

# Aliases
function gs { git status }
function wget {
    # https://stackoverflow.com/questions/47548271/disable-wget-history-tracking/54843736
    wget --hsts-file $XDG_STATE_HOME/wget/hsts $args
}
Set-Alias -Name top -Value btop
Set-Alias -Name ls -Value Get-CustomFormatChildItem

# Modules

Install-Modules @("PSReadLine", "CompletionPredictor", "DirectoryPredictor", "Terminal-Icons")

# Prompt
if (Assert-IsInteractiveShell) {

	hyfetch -b fastfetch
	oh-my-posh init pwsh --config $PSScriptRoot/fracturedcode.omp.json | Invoke-Expression

	$Env:CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
	$Env:CARAPACE_MATCH = "1"
	$Env:CARAPACE_TOOLTIP = "0"
	Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
	Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
	Set-PSReadLineOption -BellStyle None  
	carapace _carapace | Out-String | Invoke-Expression
}
