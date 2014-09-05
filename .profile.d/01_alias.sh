alias lastnotes='find $NOTES -maxdepth 1 -mtime -2 -type f -iname "note_*" -exec vimx --servername NOTES --remote-tab {} +'
alias ls="ls --color=auto"
alias xlock="xlock -mode blank"
alias nowplaying="ncmpcpp --now-playing"
alias chromium-proxy="chromium-browser --proxy-server=\"http://127.0.0.1:8888\""
alias startDropbox="$HOME/.dropbox-dist/dropboxd"
alias scpToStore="rsync -av -e ssh --progress --remove-source-files $HOME/Downloads/toStore/ pan@huggin:/home/pan/toStore"
alias urxvt="urxvt256c-ml -geometry 180x40 "
alias now='date +"%Y-%m-%d %H:%M"'
alias playmp3='for i in *.mp3; do mplayer "$i"; done'
alias h='history | grep'
alias ranger='python $SRC/ranger/ranger.py'

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
