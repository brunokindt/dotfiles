# vim
export VIMHOME=$HOME/.vim
export VIM_CMD=vim 

export SCRIPT=$HOME/Local/script
export JOURNO=$HOME/Library/journo_IA
export JEKYLL=$HOME/Library/notes.jekyll
export SRC=$HOME/Local/src
export PRJ=$HOME/Library/projects
export HAIDEN=$PRJ/haiden
export NOTES=$PRJ/notes

#export RANGER_LOAD_DEFAULT_RC="FALSE"
export EDITOR="nvim"
export TERMCMD="konsole"  # for awesome wm
export TERMINAL="konsole" # for i3 wm

# ack
export ACK_COLOR_MATCH="bold magenta"

if [ -d "/usr/local/heroku/bin" ]; then
    PATH="/usr/local/heroku/bin:$PATH"
fi

# update path
if [ -d "$HOME/Local/bin" ]; then
    PATH="$HOME/Local/bin:$PATH"
fi
if [ -d $SCRIPT ]; then
    PATH="$SCRIPT:$PATH"
fi
export PATH
