#!/usr/bin/env sh
d=`pwd`
mkdir -p $HOME/Local/script
mkdir -p $HOME/Local/src
mkdir -p $HOME/Library/notes
mkdir -p $HOME/Library/projects

if [[ ! -d $HOME/.vim ]]; then
    ln -s $d/.vim $HOME/.vim
fi
