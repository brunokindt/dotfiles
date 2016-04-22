if [ ! -z $DISPLAY ]; then

  # touchpad natural scrolling
    synclient PalmDetect=1
    #synclient PalmMinWidth=8
    synclient PalmMinZ=200
    synclient VertScrollDelta=-111
    synclient HorizScrollDelta=-111
  
  # NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  
  # ZEITGEIST
    if hash zeitgeist-daemon 2> /dev/null; then
        /usr/bin/zeitgeist-daemon --replace &
    fi
  
    /usr/bin/xsetroot -solid "#020202"
    xrdb -merge ~/.Xdefaults

    # disable gnome-ssh-askpass
    unset SSH_ASKPASS

fi 

