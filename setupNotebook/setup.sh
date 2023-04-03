#!/bin/zsh

#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

brew install fzf    #fuzzy search engine
brew install zoxide #jump to directories
brew install exa    #replacement for ls

#zap plugin manager github.com/zap-zsh/zap
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)


brew install rustup-init #rust

brew install --cask kitty #kitty terminal manager
brew install stow 	  #stow for managing dotfiles

#clone dotfiles
cd ~ && git clone https://github.com/lazno/.dotfiles.git 

cd ~/.dotfiles && stow zsh #setup zshell config

#install sdk manager
curl -s "https://get.sdkman.io" | bash && source "$HOME/.sdkman/bin/sdkman-init.sh"

#install jdk 11
sdk install java 11.0.18-tem #install jdk 11

#install nerdfonts
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

#neovim build prerequisites
brew install ninja libtool cmake pkg-config gettext curl

#install neovim v0.8.1
cd ~ && git clone https://github.com/neovim/neovim && cd neovim && git checkout v0.8.1 && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd ~/neovim && sudo make install 
sudo chown -R "${USER}" ~/.local/state

cd ~/.dotfiles && stow nvim #setup neovim config

brew install --cask authy
brew install --cask bitwarden

brew install --cask alfred
brew install coursier/formulas/coursier && cs setup

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
