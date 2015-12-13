# vim
export VIMHOME=$HOME/.vim
export VIM_CMD=vimx
alias vim='vimx'

export SCRIPT=$HOME/Local/script
export NOTES=$HOME/Library/notes
export JOURNO=$HOME/Library/journo_IA
export JEKYLL=$HOME/Library/notes.jekyll
export SRC=$HOME/Local/src
export PRJ=$HOME/Library/projects
export HAIDEN=$PRJ/haiden

#export RANGER_LOAD_DEFAULT_RC="FALSE"
export EDITOR="vimx"
export TERMCMD="konsole"  # for awesome wm
export TERMINAL="konsole" # for i3 wm

# version control
alias sdv='svn diff | vim -R -'
alias svs="date;svn status | sort | ack -v '^X ' | ack '^ ?. '"
alias svu="date;svn update"
alias svq="date;svn status | ack '\?'"
alias svc='date;svn status | ack ^C'
alias svsu="date;svn -u status | ack '^ ?. '"
alias svnup='date;svn update'

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
