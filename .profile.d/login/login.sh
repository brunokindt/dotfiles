if [ ! -z $DISPLAY ]; then

  # touchpad natural scrolling
    synclient PalmDetect=1
    #synclient PalmMinWidth=8
    synclient PalmMinZ=200
    synclient VertScrollDelta=-111
    synclient HorizScrollDelta=-111
  
  # ZEITGEIST
    #if hash zeitgeist-daemon 2> /dev/null; then
    #    /usr/bin/zeitgeist-daemon --replace &
    #fi
  
    /usr/bin/xsetroot -solid "#020202"
    #/usr/bin/xsetroot -solid "#b6b6a9"
    if [ -f "~/.Xdefaults" ]; then
        xrdb -merge ~/.Xdefaults
    fi
    echo `date --iso-8601=seconds` >> ~/swamp/out.log

    # disable gnome-ssh-askpass
    unset SSH_ASKPASS

    if hash dunst 2> /dev/null; then
      pkill dunst
      dunst -config ~/.config/dunst/dunstrc &
    fi

fi 

