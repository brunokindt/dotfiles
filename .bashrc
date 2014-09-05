# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# WM-JAVA fix
#wmname LG3D
#
# BASH
#
SAVEHIST=10000
HISTSIZE=10000
HISTFILESIZE=10000
# bash options
shopt -s cmdhist    # save multi-line commands in history as single line
shopt -s histappend # append to the history file

#
for file in $HOME/.profile.d/*.sh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
