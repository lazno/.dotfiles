export PATH=/opt/homebrew/bin:$PATH
export PATH=~/Library/Python/3.9/bin:$PATH
#using zap
#https://github.com/zap-zsh/zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

autoload -Uz compinit
compinit

# use zoxide and fzf
#https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd j zsh)"

plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/theme.zsh"
#plug "$HOME/.config/zsh/jenv.zsh"

plug "zsh-users/zsh-autosuggestions" #show autosuggestions when typing
plug "zap-zsh/supercharge" #better colors for ls etc
plug "zap-zsh/exa" #https://github.com/ogham/exa
plug "zap-zsh/fzf" #enable reverse search with fzf
#plug "zap-zsh/vim" #vim like navigation in shell and suggestion menus
plug "zsh-users/zsh-syntax-highlighting" 


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
autoload -U compinit; compinit
