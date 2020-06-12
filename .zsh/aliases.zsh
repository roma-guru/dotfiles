# System
alias _='sudo'
alias ...='cd ../..'
alias ....='cd ../../..'
alias func=function
alias def=function
alias less='bat'
alias d='dirs -v'
alias l='exa -hl'
alias k='k -h'
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
alias svim="sudo vim"
alias vi="vim -u NONE"
alias h="history -i"
alias vimali='vim ~/.zsh/aliases.zsh && . ~/.zsh/aliases.zsh'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc && . ~/.zshrc'

# Greps
alias agrep='alias | grep'
alias pgrep='ps -e | grep'
alias hgrep='history | grep'

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
alias venv='python3 -m venv'
alias act='. *env/bin/activate'
alias deact='deactivate'
alias pyhttp='python3 -m http.server 8000'
alias setup='python3 setup.py'

# Pip
alias pipi="pip install"
alias pipi-test='pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple'
alias pipi-req="pip install -r requirements.txt"
alias pipi-dev='pip install -e .'
alias piprm="pip uninstall"
alias pipgrep='pip freeze | grep'

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

# Django
alias djr="./manage.py runserver 8000"
alias djt="./manage.py test"
alias djm="./manage.py migrate"
alias djmm="./manage.py makemigrations"
alias djcs="./manage.py collectstatic"
alias djpass="./manage.py changepassword"
alias djsuper="./manage.py createsuperuser"
alias djsh="./manage.py shell"

# Go
alias gor="go run"
alias gob="go build"
alias got="go test"
alias gog="go get -v -u"

# Docker
alias docker-rm-all='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'

# Calc
function cc() python3 -c "from math import *; print($*);"
alias cc='noglob cc'

# Bookmarked dirs
hash -d postgres-logs="/usr/local/var/log"
hash -d postgres-conf="/usr/local/var/postgres"
hash -d local-bin="$HOME/.local/bin"

# OS specifics
if [ $(uname) = Linux ]; then
    alias open='xdg-open'
    alias ypwd='pwd|xclip -selection clipboard'
    # Pacman
    alias paci="pacman -S"
    alias pacrm="pacman -R"
    alias pacs="pacman -Ss"
    alias pacown="pacman -So"
    # Yay
    alias yayi="yay -S"
    alias yayrm="yay -R"
    # Snap
    alias snapi="snap install"
    alias snaprm="snap uninstall"
else
    alias ypwd='pwd|pbcopy'
    # Brew
    alias brewi="brew install"
    alias brewup="brew update"
    alias brewrm="brew uninstall"
    alias brewls="brew list"
    alias brews="brew search"
fi

