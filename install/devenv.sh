#!/bin/zsh
brew install coreutils cmake git
brew install vim zsh starship zplug
brew install bat ranger direnv fzf exa fd ripgrep 
brew install htop glances

brew install golang rust python
brew install pgcli micro hub
brew install jq yq
brew install httpie xh curlie

brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules
ln /opt/homebrew/Cellar/emacs-mac/emacs-*-mac-*/Emacs.app /Applications/Emacs.app
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

brew install postgresql redis
brew install docker kubernetes-cli minikube lazydocker
