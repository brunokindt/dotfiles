if shopt -q login_shell ; then # We're a login shell                                
                                                                                                                                                     
  # touchpad natural scrolling
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

fi
