export PATH=/opt/homebrew/bin:$PATH
export PATH=~/Library/Python/3.9/bin:$PATH
export VIRTUAL_ENV_DISABLE_PROMPT=1 #disable python venv prompt prefix
#using zap
#https://github.com/zap-zsh/zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"


autoload -U compinit; compinit
autoload -U +X bashcompinit && bashcompinit

# use zoxide and fzf
#https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd j zsh)"
# init starship prompt
eval "$(starship init zsh)"

plug "$HOME/.config/zsh/aliases.zsh"
# plug "$HOME/.config/zsh/theme.zsh"
#plug "$HOME/.config/zsh/jenv.zsh"

plug "zsh-users/zsh-autosuggestions" #show autosuggestions when typing
plug "zap-zsh/supercharge" #better colors for ls etc
# exa is no longer maintained
# https://stackoverflow.com/questions/78298133/exa-package-problem-exa-has-been-disabled-because-it-is-not-maintained-upstrea
# plug "zap-zsh/exa" #https://github.com/ogham/exa
plug "zap-zsh/fzf" #enable reverse search with fzf
#plug "zap-zsh/vim" #vim like navigation in shell and suggestion menus
plug "zsh-users/zsh-syntax-highlighting" 
plug "greymd/docker-zsh-completion"



## needed for tfswitch cli tool
export PATH=$PATH:~/bin

## link postgres cli client binaries 
#export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#kubectl autocomplete
#source <(kubectl completion zsh)
#enable vim mode in terminal
bindkey -v
#aws autocomplete
complete -C '/usr/local/bin/aws_completer' aws


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
