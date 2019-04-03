alias ls="ls --color=auto"
alias urxvt="urxvt256c-ml -geometry 180x40 "
alias now='date +"%Y-%m-%d %H:%M"'
alias week='/bin/date +%V'
alias yw='/bin/date +%Y-w%V'
alias ywp='git push origin $(/bin/date +%Y-w%V)'
# clear urxvt scrollback
alias cls="echo -ne '\033c'"
alias git_log_unique="git log --pretty=format:'%C(White)%s' | sort | uniq --unique"
alias next="nvim -S ~/swamp/pbr-next.vim"

# z will take you to the most 'frecent' directory that matches ALL of the regexes given on the command line
# example
#   z foo       # cd to most frecent dir matching foo
#   z foo bar   # cd to most frecent dir matching foo and bar
#   z -r foo    # cd to highest ranked dir matching foo

SRC="$HOME/Local/src"

alias ranger='python $SRC/ranger/ranger.py'

if [ -f "${SRC}/z/z.sh" ]; then
    . "${SRC}/z/z.sh"
fi

# Quickly go back to a specific parent directory
# example
#   db site
if [ -f "${SRC}/bd/bd" ]; then
    alias bd=". ${SRC}/bd/bd -s"
fi

set_konsole_title() {
  echo -ne "\033]30;$1\007"
}

alias _do_ls_ports='netstat -lnt'
alias _do_cpu='watch -n 5 grep \"cpu MHz\" /proc/cpuinfo'
alias _do_cpu2='mpstat 5'
alias _do_cpu_temp='cat /sys/class/thermal/thermal_zone0/temp'

_do_cpu_temp2() {
  local DATE=$(date --iso-8601='seconds')
  local CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
  echo "${DATE} ${CPU_TEMP}"
}

# nvm
_do_nvm_init() {
  if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  fi
}

# Ctags
alias mktags="ctags --extra=+f -R ."

# Clang Format
alias cformat='clang-format -style=file -i $(find . -name \*.h -print -o -name \*.cpp -print)'

# View dirty memory
alias dirty='watch grep -e Dirty: -e Writeback: /proc/meminfo'

alias brightness_low="xrandr --output eDP-1 --brightness 0.5"
alias brightness_normal="xrandr --output eDP-1 --brightness 0.75"
alias brightness_high="xrandr --output eDP-1 --brightness 0.85"
alias brightness_full="xrandr --output eDP-1 --brightness 1"
#
# #!/bin/sh
# set -ex
# echo $(realpath $1) >> /tmp/lst
#
alias feh="feh --force-aliasing --sort mtime --draw-filename --keep-zoom-vp --action1 \;\"echo $(realpath %F) >> /tmp/lst\"" 
