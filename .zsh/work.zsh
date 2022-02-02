#!/bin/zsh
# ssh-agent
ssh-add ~/.ssh/id_ed25519

# Poetry
alias pipup=pip install --upgrade pip
alias poet=poetry
alias pyt="PYTHONPATH=project pytest"
alias use-3.8=p env use 3.8
alias use-3.9=p env use 3.9
alias use-3.10=p env use 3.10
hash -d pvenvs=~/Library/Caches/pypoetry/virtualenvs

# Kubernetes
alias kub=kubectl
alias doc=docker
alias mini=minikube
alias kus=kustomize
alias stern="stern --template '{{printf \"%s\n\" .Message }}'"

alias use-local="kubectx docker-desktop"
alias use-poc="kubectx dgx2-mt.poc"
