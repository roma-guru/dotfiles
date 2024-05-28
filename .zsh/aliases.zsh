# System aliases
alias _='sudo'
alias cd-='cd -'
alias su='_ bash'
alias ...='cd ../..'
alias ....='cd ../../..'

alias func=function
alias def=function

alias le='bat'
alias d='dirs -v'
alias l='ls -l'
alias la='l -a'
alias cp='cp -R'
alias rm='rm -r'
alias rmf='rm -rf'
alias du='du -h'
alias df='df -Ph'
alias nog='noglob'
alias loc='noglob locate'
alias noc='nocorrect'
alias mmv='noglob zmv -W'
alias mkdir='mkdir -pv'
alias mkx='chmod a+x'
alias find='noglob find'

alias v="vim"
alias sv="sudo vim"
alias vi="vim -u NONE"
alias h="history -i"
alias rr="r -2"
alias rrr="r -3"
alias killj="kill -9 %1"

alias vimali='file=aliases && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimtw='file=tweaks && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimpath='file=path && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimrc='vim ~/.vimrc && vim +PlugInstall +qa'
alias zshrc='vim ~/.zshrc && . ~/.zshrc'

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

alias mkvenv='py -m venv .venv'
alias act='. .venv/bin/activate'
alias deact='deactivate'

alias pyhttp='python3 -m http.server 8000'
alias setup='python3 setup.py'
alias pyclean='rm -rf **/__pycache__'

# Pip
alias pipi="pip install"
alias pipi-test="pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple"
alias pipi-req="pip install -r requirements.txt"
alias pipi-dev="pip install -e ."
alias piprm="pip uninstall"
alias pipgrep="pip freeze | grep"

# Git
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

hash -d desk="$HOME/Desktop"
hash -d docs="$HOME/Documents"
hash -d downs="$HOME/Downloads"
hash -d local-bin="$HOME/.local/bin"
hash -d vim-plug="$HOME/.vim/plugged/"
