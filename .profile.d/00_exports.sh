#!/usr/bin/env bash
# vim
export VIMHOME=$HOME/.vim
export VIM_CMD=vim 

export SCRIPT=$HOME/Local/script
export SRC=$HOME/Local/src
#export PRJ=$HOME/Library/projects
export PRJ=/srv/projects

#export RANGER_LOAD_DEFAULT_RC="FALSE"
export EDITOR="nvim"
export TERMCMD="konsole"  # for awesome wm
export TERMINAL="konsole" # for i3 wm
# export VAGRANT_DEFAULT_PROVIDER=virtualbox

## opt-out of the dotnet telemetry feature
DOTNET_CLI_TELEMETRY_OPTOUT=true

# ack
export ACK_COLOR_MATCH="bold magenta"

# update path
if [ -d "$HOME/Local/bin" ]; then
    PATH="$HOME/Local/bin:$PATH"
fi

export PATH
