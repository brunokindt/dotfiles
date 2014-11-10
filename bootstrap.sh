#!/usr/bin/env sh
source_dir=`pwd`
dst_default=$HOME
#dst_default=`mktemp -d`
echo "dotfile destination is $dst_default"

mkdir -p $dst_default/Local/script
mkdir -p $dst_default/Local/src
mkdir -p $dst_default/Library/notes
mkdir -p $dst_default/Library/projects

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

linkResource ".vim"
linkResource ".vimrc"
linkResource ".profile.d"
linkResource ".bashrc"
linkResource ".gitignore"
linkResource ".gitconfig"
linkResource ".zshrc"
linkResource "script" "$dst_default/Local"
linkResource ".i3"
linkResource ".config/ranger"
linkResource ".config/awesome"

ternForVimDir=".vim/bundle/tern_for_vim"
if [ -d "$ternForVimDir" ] && [ -f "$ternForVimDir/package.json" ]; then
    pushd .
    cd "$ternForVimDir" &&
    npm install
    popd
fi

# vim & zeitgeist
if hash "zeitgeist-daemon" 2> /dev/null; then
  wget -O .vim/plugin/zeitgeist.vim "https://raw.githubusercontent.com/jeffwheeler/vimfiles/master/plugin/zeitgeist.vim"
fi

wget -O .vim/colors/sorcerer.vim "https://raw.githubusercontent.com/adlawson/vim-sorcerer/master/colors/sorcerer.vim"
wget -O .vim/colors/monokai "https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim"

echo "Done."
