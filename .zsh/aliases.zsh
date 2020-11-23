# System
alias _='sudo'
alias cd-='cd -'
alias su='_ bash'
alias ...='cd ../..'
alias ....='cd ../../..'

alias func=function
alias def=function

alias le='bat'
alias d='dirs -v'
if [ $(uname) = Linux ]; then
    alias l='exa -lh'
else
    alias l='lsd -l'
fi
alias k='k -h'
alias j='ranger --choosedir=$HOME/.ranger-dir && cd $(cat $HOME/.ranger-dir)'
alias la='l -a'
alias cp='cp -R'
alias rm='rm -r'
alias rmf='rm -rf'
alias du='du -h'
alias df='df -Ph'
alias nog='noglob'
alias loc='noglob locate'
alias desk='cd ~/Desktop'
alias noc='nocorrect'
alias mmv='noglob zmv -W'
alias mkdir='mkdir -pv'
alias mkx='chmod a+x'
alias find='noglob find'

alias e="emacs" && alias v="vim" # make peace not war
alias svim="sudo vim"
alias vi="vim -u NONE"
alias h="history -i"
alias rr="r -2"
alias rrr="r -3"
alias killj="kill -9 %1"

alias vimwork='file=work && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimali='file=aliases && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimtw='file=tweaks && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimpath='file=path && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimrc='vim ~/.vimrc && vim +PlugInstall +qa'
alias zshrc='vim ~/.zshrc && . ~/.zshrc'

# Direnv
alias dea="direnv allow"
alias der="direnv reload"

# Greps
alias agrep='alias | grep'
alias pgrep='ps -e | grep'
alias hgrep='history | grep'
alias lgrep='!! | grep'

# IP info
alias myip='ifconfig en0|grep inet' 
alias myip-ext='curl ifconfig.pro'
func ipinfo() {
    curl ipinfo.io/$1
}

# Python
alias py='python3'
alias pypy='pypy3'
alias ipy='ipython'
alias deact='deactivate'
alias pyhttp='python3 -m http.server 8000'
alias setup='python3 setup.py'
alias pyclean='rm -rf **/__pycache__'
alias pyt='pytest -sx --ff --pdb'
alias pytcov='pytest --cov-report=term'
alias pytags='ctags -R --language-force=python'

# Django additions
alias djsuper="./manage.py createsuperuser --username $USER --email $USER@localhost"
alias djpasswd="./manage.py changepassword"

# Pip
alias pipi="pip install"
alias pipi-test="pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple"
alias pipi-req="pip install -r requirements.txt"
alias pipi-dev="pip install -e ."
alias piprm="pip uninstall"
alias pipgrep="pip freeze | grep"

# Git
alias git='hub'
alias gpa="git push all && git push all --tags"
alias gaf="git add -f"
alias grm="git rm"
alias grmca="git rm --cached"
alias grmf="git rm -r"
alias gmv="git mv"
alias gstap="git stash pop"
alias gshow="git show"
alias gcld1="git clone --depth 1"
alias gsuba="git submodule add"
alias gsubaf="git submodule add -f"
alias gstal="git stash list"

# Jupyter
alias jupy="jupyter notebook"
alias jupyc="jupyter console"

# Go
alias gor="go run"
alias gob="go build"
alias gobd="go build -ldflags=-compressdwarf=false"
alias got="go test"
alias gog="go get -v -u"

# Docker
alias doc='docker'
alias docker-rm-all='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
alias docomp='docker-compose'

# Calc
function cc() python3 -c "from math import *; print($*);"
alias cc='noglob cc'

# Bookmarked dirs
hash -d postgres-logs="/usr/local/var/log"
hash -d postgres-root="/usr/local/var/postgres"
hash -d mongo-logs="/usr/local/var/log/mongodb"
hash -d mongo-root="/usr/local/var/mongodb"

hash -d local-bin="$HOME/.local/bin"
hash -d vim-plug="$HOME/.vim/plugged/"

# OS specifics
if [ $(uname) = Linux ]; then
    alias open='xdg-open'
    alias ypwd='pwd|xclip -selection clipboard'
    # Pacman
    alias paci="_ pacman -S"
    alias pacrm="_ pacman -Rs"
    alias pacupd="_ pacman -Fy"
    alias pacs="pacman -Ss"
    alias pacshow="pacman -Qi"
    alias pacown="pacman -Qo"
    alias pacclean="_ pacman -Ru"
    alias pacfzf="pacman -Ss | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
    # Yay
    alias yayi="yay -S"
    alias yayrm="yay -R"
    alias yays="yay -Ss"
    alias yayshow="yay -Qi"
    # Snap
    alias snapi="snap install"
    alias snaprm="snap uninstall"
    alias snaps="snap find"
    alias snapshow="snap info"
else
    alias ypwd='pwd|pbcopy'
    alias ldd='otool -L'
    # Brew
    alias brewi="brew install"
    alias brewup="brew update"
    alias brewrm="brew uninstall"
    alias brewls="brew list"
    alias brews="brew search"
    alias brewca="brew cask"
    alias brewcai="brew cask install"
    alias brewsvc="brew services"
    alias brewup="brew upgrade"
    alias brewfzf="brew search | fzf --preview 'brew info {}' --layout=reverse --bind 'enter:execute(brew info {} | less)'"
fi

