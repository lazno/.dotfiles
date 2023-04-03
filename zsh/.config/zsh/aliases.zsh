#!/bin/sh

alias vim="nvim"
alias v="nvim"

# aws sso + export profile for legacy aws tools
# https://github.com/victorskl/yawsso
sso() {
  aws sso login --profile $1 && yawsso --profile $1
}

# shortcut for repository directory
repos() {
  cd ~/dev/repos/$1
}

# metals and nvim logs
alias tail-lsp="tail -f $HOME/.local/state/nvim/lsp.log"
alias tail-nvim-metals="tail -f $HOME/.cache/nvim/nvim-metals/nvim-metals.log"
alias tail-bsp="tail -f $HOME/Library/Caches/org.scalameta.metals/bsp.trace.json"

# aws bastion host dont know alacritty TERM yet. this will set it to a more commonly known TERM 
alias ssh="TERM=xterm-256color $(which ssh)"
tg() {
  terragrunt $@
}
