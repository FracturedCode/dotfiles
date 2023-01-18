#!/bin/zsh
# https://stackoverflow.com/questions/47548271/disable-wget-history-tracking/54843736
alias wget='wget --hsts-file $XDG_CONFIG_HOME/wget/hsts'
