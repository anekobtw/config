autoload -Uz compinit
compinit

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

HISTSIZE=10000
SAVEHIST=10000

bindkey -e

alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'

export EDITOR=nano

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/catppuccin_macchiato.omp.json)"

