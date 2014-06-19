#!/usr/bin/env sh
source_dir=`pwd`
dest_dir=$HOME
#dest_dir=`mktemp -d`
echo "dotfile destination is $dest_dir"

mkdir -p $dest_dir/Local/script
mkdir -p $dest_dir/Local/src
mkdir -p $dest_dir/Library/notes
mkdir -p $dest_dir/Library/projects

function linkResource {
    source=$1
    dest=${2:-$dest_dir}

    #  $source should be directory of file
    if [[ -z "$source" || ! -r "$source" ]]; then
        echo "Could not link $source"
        return
    fi

    if [[ -e "$dest/$source" ]]; then
        echo "Destination $dest/$source already exists"
        return
    fi

    # link the resource
    echo "Create link from $source_dir/$source to $dest"
    if [[ ! -d "$dest/$source" ]]; then
        ln -s "$source_dir/$source" "$dest/$source"
    fi
}

linkResource ".vim"
linkResource ".vimrc"
linkResource ".profile.d"
linkResource ".bashrc"
linkResource ".gitignore"
linkResource ".gitconfig"
linkResource ".zshrc"
linkResource "script" "$dest_dir/Local"

echo "Done."
