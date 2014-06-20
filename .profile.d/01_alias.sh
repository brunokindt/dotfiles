alias prj-set='pwd > $PRJ/current'
alias prj-get='cd `cat $PRJ/current`'
alias prj-ls='cat $PRJ/current'
alias prj-edit='vimx --servername PRJ '
alias prj-edit-add='vimx --servername PRJ --remote-tab '
alias prj-notes="cd $NOTES;vimx --servername NOTES"
alias prj-journo="cd $JOURNO/bootstrap/posts;vimx --servername JOURNO"
alias lastnotes='find $NOTES -maxdepth 1 -mtime -2 -type f -iname "note_*" -exec vimx --servername NOTES --remote-tab {} +'
alias ls="ls --color=auto"
alias xlock="xlock -mode blank"
alias nowplaying="ncmpcpp --now-playing"
alias chromium-proxy="chromium-browser --proxy-server=\"http://127.0.0.1:8888\""
alias startDropbox="$HOME/.dropbox-dist/dropboxd"
alias scpToStore="rsync -av -e ssh --progress --remove-source-files $HOME/Downloads/toStore/ pan@huggin:/home/pan/toStore"
alias lsip="nmap -v -sP 192.168.1.1-255 | grep -v down"
alias urxvt="urxvt256c-ml -geometry 180x40 "
alias ports="netstat -tulanp"
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

