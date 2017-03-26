alias ls="ls --color=auto"
alias scpToStore="rsync -av -e ssh --progress --remove-source-files /mnt/garden/toStore/ huggin:/mnt/library/Library/toStore"
alias urxvt="urxvt256c-ml -geometry 180x40 "
alias now='date +"%Y-%m-%d %H:%M"'
alias playmp3='for i in *.mp3; do mplayer "$i"; done'
alias ranger='python $SRC/ranger/ranger.py'
alias week='/bin/date +%V'
# clear urxvt scrollback
alias cls="echo -ne '\033c'"

if [ -f "$SCRIPT/v/v.sh" ]; then
    . "$SCRIPT/v/v.sh"
fi

# z will take you to the most 'frecent' directory that matches ALL of the regexes given on the command line
# example
#   z foo       # cd to most frecent dir matching foo
#   z foo bar   # cd to most frecent dir matching foo and bar
#   z -r foo    # cd to highest ranked dir matching foo
if [ -f "$SRC/z/z.sh" ]; then
    . "$SRC/z/z.sh"
fi

# Quickly go back to a specific parent directory
# example
#   db site
if [ -f "$SRC/bd/bd" ]; then
    alias bd=". $SRC/bd/bd -s"
fi

set_konsole_title() {
  echo -ne "\033]30;$1\007"
}

alias _do_ls_ports='netstat -lnt'
alias _do_cpu='watch -n 5 grep \"cpu MHz\" /proc/cpuinfo'
