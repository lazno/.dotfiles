#brew install --cask nikitabobko/tap/aerospace!/bin/zsh

#brew install --cask nikitabobko/tap/aerospace/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

brew tap microsoft/git
brew install --cask git-credential-manager-core # this will cache git credentials, so no retyping passwords
git credential-manager configure

brew install --cask wezterm

brew install stow 	  #stow for managing dotfiles

#clone dotfiles
cd ~ && git clone https://github.com/lazno/.dotfiles.git 
cd ~/.dotfiles && stow zsh #setup zshell config

brew install starship

brew install fzf    #fuzzy search engine
brew install zoxide #jump to directories
brew install exa    #replacement for ls

#zap plugin manager github.com/zap-zsh/zap
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)


brew install --cask nikitabobko/tap/aerospace

brew install neovim
#install nvm and use it to install node (needed for lazyvim)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash


cd ~/.dotfiles && stow nvim #setup neovim config

#brew install rustup-init #rust



#install sdk manager
curl -s "https://get.sdkman.io" | bash && source "$HOME/.sdkman/bin/sdkman-init.sh"

#install jdk 11
sdk install java 11.0.18-tem #install jdk 11

#install nerdfonts
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

#neovim build prerequisites
brew install ninja libtool cmake pkg-config gettext curl


brew install --cask alfred
brew install coursier/formulas/coursier && cs setup

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /


brew install --cask visual-studio-code

brew install --cask scroll-reverser


cd ~/.dotfiles && stow karabiner
brew install --cask karabiner-elements


npm install -g aws-cdk # install aws cdk cli
brew install yarn


pip3 install yawsso

brew install --cask docker
brew install --cask docker-compose


brew install --cask tunnelblick
brew install --cask postman

brew install gh #install github cli

brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install terragrunt

brew install jq

pip3 install ec2instanceconnectcli # install mssh

brew install --cask 1password/tap/1password-cli

scoop bucket add snyk https://github.com/snyk/scoop-snyk
scoop install snyk

echo "export NVM_DIR=~/.nvm\nsource \$(brew --prefix nvm)/nvm.sh" >> .zshrc

pip3 install awsume #easily assume aws roles without explicitly using profiles
