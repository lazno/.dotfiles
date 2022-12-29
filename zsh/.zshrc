#using zap
#https://github.com/zap-zsh/zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

autoload -Uz compinit
compinit

# use zoxide and fzf
#https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"

plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/theme.zsh"
plug "$HOME/.config/zsh/jenv.zsh"

plug "zsh-users/zsh-autosuggestions" #show autosuggestions when typing
plug "zap-zsh/supercharge" #better colors for ls etc
plug "zap-zsh/exa" #https://github.com/ogham/exa
plug "zap-zsh/fzf" #enable reverse search with fzf
#plug "zap-zsh/vim" #vim like navigation in shell and suggestion menus
plug "zsh-users/zsh-syntax-highlighting" 

