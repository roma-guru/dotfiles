#!/bin/zsh
# Sys tools
brew install coreutils cmake git gawk
brew install vim zsh starship zplug
brew install bat ranger direnv fzf exa fd ripgrep
brew install htop glances

# Dev langs
brew install golang rust python node

# Dev tools
brew install pgcli micro gh
brew install jq yq
brew install httpie xh curlie
brew install ngrok magic-wormhole
brew install clipy --cask

# Doom Emacs
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules
ln /opt/homebrew/Cellar/emacs-mac/emacs-*-mac-*/Emacs.app /Applications/Emacs.app
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# DBs
brew install postgresql redis
brew tap mongodb/brew
brew install mongodb-community

# Containers
brew install docker --cask
brew install kubernetes-cli minikube

# Some electron apps
brew install --cask spaceradar insomnia gitkraken beekeeper-studio vscode

# Python staff
pip3 install ricksay poetry mypy black autopep8 pylint flake8 jedi ropevim
