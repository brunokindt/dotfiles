# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
SAVEHIST=1000
export HISTCONTROL=eraseboth                                # ingore duplicates and spaces (erasedups|ignoreboth|ignoredups|ignorespace)
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:ll:clear:exit'   # don't append consecutive duplicates of these
export HISTSIZE=10000                                       # bash history will save N commands
export HISTFILESIZE=${HISTSIZE}                             # bash will remember N commands

bindkey -v  # zsh vi mode
unsetopt beep
export KEYTIMEOUT=1     # reduce <esc> lag to 0.1 seconds

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    # RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

#
for file in $HOME/.profile.d/*.sh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bruno.kindt/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
