#!/usr/bin/env sh
source_dir=`pwd`
dst_default=$HOME
#dst_default=`mktemp -d`
echo "dotfile destination is $dst_default"

mkdir $dst_default/Local
mkdir $dst_default/Local/src
#mkdir -p $dst_default/Library/notes
#mkdir -p $dst_default/Library/projects

function linkResource {
    local src=$1
    local dst=${2:-$dst_default}

    #  $src should be directory of file
    if [[ -z "$src" || ! -r "$src" ]]; then
        echo "Could not link $src"
        return
    fi

    if [[ -e "$dst/$src" ]]; then
        echo "Destination $dst/$src already exists"
        return
    fi

    # link the resource
    echo "Create link from $source_dir/$src to $dst"
    if [[ ! -d "$dst/$src" ]]; then
        ln -s "$source_dir/$src" "$dst/$src"
    fi
}

linkResource ".profile.d"
linkResource ".bashrc"
linkResource ".gemrc"
linkResource ".zshrc"
linkResource "script" "$dst_default/Local"
linkResource ".config/i3"
linkResource ".config/ranger"
linkResource ".config/awesome"

UNAME="$(uname)"
if [ "$UNAME" == "Darwin" ]; then
  linkResource ".envrc"
fi

echo "Done."
