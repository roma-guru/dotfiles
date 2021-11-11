# System
alias _='sudo'
alias cd-='cd -'
alias su='_ bash'
alias ...='cd ../..'
alias ....='cd ../../..'

alias func=function
alias def=function

def trash {
    mv $1 ~/.Trash
}
alias le='bat'
alias d='dirs -v'
alias l='exa -lh'
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
alias vo="vim -O"
alias h="history -i"
alias rr="r -2"
alias rrr="r -3"
alias killj="kill -9 %1"

alias vimzsh="vim ~/.zsh"
alias vimwork='file=work && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimali='file=aliases && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimtw='file=tweaks && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimpath='file=path && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimrc='vim ~/.vimrc && vim +PlugStatus +qa'
alias zshrc='vim ~/.zshrc && . ~/.zshrc'
alias vimipyimp='vim ~/.ipython/profile_default/startup/default_imports.py'
alias reload='. ~/.zshrc'

# Direnv
alias dea="direnv allow"
alias der="direnv reload"

# Greps
alias agrep='alias | grep'
alias pgrep='ps -e | grep'
alias hgrep='history | grep'
alias lgrep='!! | grep'

# IP info
alias myip='ifconfig en0 | grep "inet\s" | cut -f 2 -d " "'
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
alias pytags='ctags -R --language-force=python'
def pypkg() {
    mkdir $1 && touch $1/__init__.py
}

# Anaconda
def conda-act() {
    eval $(conda shell.zsh activate $1)
}
def conda-deact() {
    eval $(conda shell.zsh deactivate)
}

# Django additions
alias djsuper="./manage.py createsuperuser --username $USER --email $USER@localhost"
alias djpasswd="./manage.py changepassword"
alias djck="./manage.py check"

# Pip
alias pip="pip3"
alias pipi="pip3 install"
alias pipi-test="pip3 install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple"
alias pipi-req="pip3 install -r requirements.txt"
alias pipi-dev="pip3 install -e ."
alias piprm="pip3 uninstall"
alias pipgrep="pip3 freeze | grep"

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
alias gdno="git diff --name-only"

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
alias kub='kubectl'

hash -d local-bin="$HOME/.local/bin"
hash -d vim-plug="$HOME/.vim/plugged/"
hash -d go-home="$HOME/go"

# OS specifics
alias ypwd='pwd|pbcopy'
alias ldd='otool -L'

# Brew
alias brewi="brew install"
alias brewica="brew install --cask"
alias brewup="brew update"
alias brewrm="brew uninstall"
alias brewls="brew list"
alias brews="brew search"
alias brewsvc="brew services"
alias brewup="brew upgrade"
alias brewfzf="brew search | fzf --preview 'brew info {}' --layout=reverse --bind 'enter:execute(brew info {} | less)'"

# URLs w/o quoting!
alias curl="nog curl"
alias xh="nog xh"
alias http="nog http"
