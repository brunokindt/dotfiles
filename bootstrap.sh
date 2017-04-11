#!/usr/bin/env bash 
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#HOME_DIR=$HOME
HOME_DIR=`mktemp -d`

mkdir -p $HOME_DIR/Local/src

function linkResource {
    local SRC=$1
    local DST=${2:-$HOME_DIR}

    #  $SRC should be directory of file
    if [[ -z "$SRC" || ! -r "$SRC" ]]; then
        echo "Could not link $SRC"
        return
    fi

    if [[ -e "${DST}/${SRC}" ]]; then
        echo "Destination ${DST}/${SRC} already exists"
        return
    fi

    # link the resource
    echo "Create link from $SCRIPT_DIR/$SRC to ${DST}"
    if [[ ! -d "${DST}/${SRC}" ]]; then
        ln -s "${SCRIPT_DIR}/${SRC}" "${DST}/${SRC}"
    fi
}

linkResource ".profile.d"
linkResource ".bashrc"
linkResource ".gemrc"
linkResource ".zshrc"
linkResource ".config/i3"
linkResource ".config/ranger"
linkResource ".config/dunst"

UNAME="$(uname)"
if [ "$UNAME" == "Darwin" ]; then
  linkResource ".envrc"
fi

echo "Done."
