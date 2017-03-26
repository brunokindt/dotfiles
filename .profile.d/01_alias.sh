alias lastnotes='find $NOTES -maxdepth 1 -mtime -2 -type f -iname "note_*" -exec vimx --servername NOTES --remote-tab {} +'
alias ls="ls --color=auto"
alias xlock="xlock -mode blank"
alias nowplaying="ncmpcpp --now-playing"
alias chrome-proxy="google-chrome --proxy-server=\"http://127.0.0.1:8888\""
alias startDropbox="$HOME/.dropbox-dist/dropboxd"
alias scpToStore="rsync -av -e ssh --progress --remove-source-files /mnt/garden/toStore/ huggin:/mnt/library/Library/toStore"
alias urxvt="urxvt256c-ml -geometry 180x40 "
alias now='date +"%Y-%m-%d %H:%M"'
alias playmp3='for i in *.mp3; do mplayer "$i"; done'
alias h='history | grep'
alias ranger='python $SRC/ranger/ranger.py'
alias week='/bin/date +%V'
# clear urxvt scrollback
alias cls="echo -ne '\033c'"
alias nyaovim="cd $PRJ/boiler/NyaoVim/ && npm run app && cd -"

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

# use optirun (Optimus hybrid graphics chipsets) if available
if hash optirun 2> /dev/null; then
  alias vlc="optirun vlc"
fi

set_konsole_title() {
  echo -ne "\033]30;$1\007"
}

alias _do_npms='npm install --save-develop '

function _do_grep {
 grep -iR "$1" --exclude "*/bower_components/*" --exclude "*/.tmp/*" --color "$2" 
}

alias _do_gcd='gulp components:develop'
alias _do_docker-machine_eval='eval "$(docker-machine env default)"'
alias _do_ls_ports='netstat -lnt'
alias _do_cpu='watch -n 5 grep \"cpu MHz\" /proc/cpuinfo'
