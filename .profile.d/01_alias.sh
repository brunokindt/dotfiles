alias now='date +"%Y-%m-%d %H:%M"'
alias week='/bin/date +%V'

# z will take you to the most 'frecent' directory that matches ALL of the regexes given on the command line
# example
#   z foo       # cd to most frecent dir matching foo
#   z foo bar   # cd to most frecent dir matching foo and bar
#   z -r foo    # cd to highest ranked dir matching foo
if [ -f "$SRC/z/z.sh" ]; then
    . "$SRC/z/z.sh"
fi

# Quickly go back to a specific parent directory
# example
#   db site
if [ -f "$SRC/bd/bd" ]; then
    alias bd=". $SRC/bd/bd -s"
fi

alias __do_git_delete_merged_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias __do_mongod_start='mongod --dbpath $HOME/swamp/db'
alias __do_open_simulator='open -n /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app' 
alias __do_docker_eval='eval "$(docker-machine env default)"'
alias __do_docker_boiler_eval='eval "$(docker-machine env boiler)"'
alias __do_mysqld_stat='ln -sfv /usr/local/opt/mysql/*.plist && ~/Library/LaunchAgents && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
