# Not zsh?
[ -n "$ZSH_VERSION" ] || return 0

# Lines configured by zsh-newuser-install

bindkey -v  # zsh vi mode
unsetopt beep
export KEYTIMEOUT=1     # reduce <esc> lag to 0.1 seconds

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

 #ctrl-w remove word backwards
 bindkey '^w' backward-kill-word

if [ -f "$SRC/git-flow-completion" ]; then
    source "$SRC/git-flow-completion/git-flow-completion.zsh"
fi

