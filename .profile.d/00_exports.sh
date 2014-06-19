# vim
export VIMHOME=$HOME/.vim
if ! hash vim 2> /dev/null && hash vimx 2> /dev/null; then
  alias vim='vimx'
  export VIM_CMD=vimx
fi

export SCRIPT=$HOME/Local/script
export NOTES=$HOME/Library/notes
export JOURNO=$HOME/Library/journo_IA
export SRC=$HOME/Local/src
export PRJ=$HOME/Library/projects
export HAIDEN=$PRJ/org.hiuki.haiden
export EDITOR="vimx"
export TERMCMD="konsole"
export GREP_OPTIONS='--exclude-dir=".svn" -rn --color'

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

# update path
if [ -d "$HOME/Local/bin" ]; then
    PATH="$HOME/Local/bin:$PATH"
fi
if [ -d $SCRIPT ]; then
    PATH="$SCRIPT:$PATH"
fi
export PATH
