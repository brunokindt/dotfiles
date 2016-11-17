export VIMHOME=$HOME/.vim
export SCRIPT=$HOME/Local/script
export SRC=$HOME/Local/src
export PRJ=$HOME/Library/projects
export EDITOR="nvim"

# ack
export ACK_COLOR_MATCH="bold magenta"

if [ -d $SCRIPT ]; then
    PATH="$SCRIPT:$PATH"
fi
export PATH
