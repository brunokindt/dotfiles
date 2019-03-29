#!/usr/bin/env bash 
set -e

_log_success() {
  echo "$(tput setaf 2) $1 $(tput sgr 0)"
}

_log_warn() {
  echo "$(tput setab 1)$(tput setaf 2) $1 $(tput sgr 0)"
}

# should be readable directory 

if [ ! -d "$HOME/Local/bin" ]; then
  _log_warn "~/Local/bin (should be a readable directory)" 
else
  _log_success "$HOME/Local/bin"
fi

#
# Should be readable directory and symlink
#
check=(
  "$HOME/.profile.d"
  "$HOME/.config/i3"
  "$HOME/.config/ranger"
  "$HOME/.config/dunst"
)
check_msg="Should be a readable symbolic link directory" 
for fpath in "${check[@]}"
  do
    if [ ! -L $fpath ]; then
      _log_warn "${fpath} (${check_msg})" 
    else
      _log_success "${fpath}"
    fi
done
  
# # should be readable file and symlink
# 
# ".bashrc"
# ".gemrc"
# ".zshrc"
# 
# # should not exist
# 
# "~/Local/script"
# "echo $SCRIPT"
# "echo $SCRIPTS"
# "echo $JOURNO"
# "echo $NOTES"
# "echo $HAIDEN"
# 
