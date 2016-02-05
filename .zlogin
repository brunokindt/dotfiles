#
for file in $HOME/.profile.d/login/*.sh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
