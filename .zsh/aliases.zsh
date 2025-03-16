# System
alias _='sudo'
alias su='_ bash'
alias ...='cd ../..'
alias ....='cd ../../..'

# Available special aliases
# alias +=?
# alias $=?
# alias @=?
# alias ,=?

alias t='time'
alias d='dirs -v'
alias l='exa -lh'
alias j='jobs'
alias h="history -i 1"
alias p=print
alias pf=printf

alias func=function
alias def=function
alias cmd=command

alias le='bat'
alias la='l -a'
alias cp='cp -R'
alias rm='rm -r'
alias rmf='rm -rf'
alias du='dust'
alias df='duf'
alias arc='archive'
alias ra='ranger'

alias nog='noglob'
alias loc='noglob locate'
alias noc='nocorrect'
alias mmv='noglob zmv -W'
func mkd {
    cmd mkdir -pv $1
    cd $1
}
alias mkx='chmod a+x'
alias find='noglob find'
alias fd='noglob fd'
alias rg='noglob rg'

alias v="vim"
alias nv="nvim"
alias m="micro"; alias n="nano"
alias sv="sudo vim"
alias vi="vim -u NONE"
alias rr="r -2"
alias rrr="r -3"
alias killj="kill %1"
alias md="macdown"

#alias vimwork='file=work && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimali='file=aliases && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimtw='file=tweaks && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimpath='file=path && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimkeys='file=keybinds && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc && . ~/.zshrc'
alias reload='. ~/.zshrc'

def del {
    mv $1 ~/.Trash
}
alias copy-pubkey='cat ~/.ssh/id_rsa.pub | pbcopy'
func copy-img {
    _ dd if=$1 of=$2 bs=4m status=progress
}
func copy-img.gz {
    _ sh -c "gzcat $1 | pv > $2"
}
func copy-img.xz {
    _ sh -c "xz -d $1 -c | pv > $2"
}

# Direnv
# alias dea="direnv allow"
# alias der="direnv reload"

# Greps
alias agrep='alias | grep'
alias pgrep='ps -e | grep'
alias hgrep='history 1 | grep'
alias egrep='env | grep'
alias lgrep='!! | grep'

# IP info
alias myip='ifconfig en0 | grep "inet\s" | cut -f 2 -d " "'
alias myip-ext='curl ifconfig.pro'
func ipinfo() {
    curl ipinfo.io/$1
}

# Python
for v in {9..12}; do
   alias py3.$v="python3.$v"
   alias mkvenv3.$v="py3.$v -m venv .venv"
done
alias py='python3'
alias pypy='pypy3'
alias ipy='ipython3'
alias act=". .venv/bin/activate"
alias deact='deactivate'
alias pyhttp='py -m http.server 8000'
alias pysetup='py setup.py'
alias pyclean='rm -rfv **/__pycache__ **/*.py[cod]'
alias pypurge='pyclean && rm -rfv **/.env **/.venv **/.pytest_cache **/.mypy_cache'
alias pypkg="touch __init__.py"
alias pyignore='wget https://github.com/github/gitignore/raw/main/Python.gitignore -O .gitignore'

alias conda-act="conda activate"
alias conda-react="conda reactivate"

# Swift
alias sw='swift repl'
alias swb='swift build'
alias swr='swift run'
alias swc='swiftc'

# Containers
alias doc="docker"
alias docomp="docker-compose"
alias pod="podman"
func docsh {
    doc exec -it $1 bash
}
alias kub="kubectl"

# Pip
alias pip=pip3
alias pip3="py -m pip"
alias pipi="pip3 install"

alias pipi-req="pip3 install -r req*.txt"
alias pipi-dev="pip3 install -e ."
alias pipi-test="python3 -m pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple/"
alias piprm="pip3 uninstall"
alias pipun="piprm"
alias pipgrep="pip3 freeze | grep"

# Django
alias djr="./manage.py runserver"
alias djm="./manage.py migrate"
alias djmm="./manage.py makemigrations"
alias djpasswd="./manage.py changepassword"
alias djadmin="./manage.py createsuperuser"

# Hatch
alias ha=hatch
alias har="hatch run"
alias has="hatch shell"
alias hap="hatch python"

# Twine
alias twup="twine upload"
alias twup-test="twine -r testpypi upload"

# Pipenv
alias pesh="pipenv shell"
alias pei="pipenv install"

# Git
alias gin="git init"
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

# Dir aliases
hash -d desk="$HOME/Desktop"
hash -d docs="$HOME/Documents"
hash -d downs="$HOME/Downloads"
hash -d music="$HOME/Music"

hash -d zsh="$HOME/.zsh"
hash -d vim="$HOME/.vim"
hash -d emacs="$HOME/.emacs.d"
hash -d doom="$HOME/.doom.d"
hash -d doom-nv="$HOME/.doom.nv"

hash -d local-bin="$HOME/.local/bin"
hash -d go-home="$HOME/go"
hash -d postgres-data="/opt/homebrew/var/postgres"
hash -d homebrew="/opt/homebrew/Cellar"
hash -d homebrew-core="/opt/homebrew/Library/Taps/homebrew/homebrew-core"
hash -d homebrew-cask="/opt/homebrew/Library/Taps/homebrew/homebrew-cask"
hash -d conda-envs="/opt/homebrew/Caskroom/miniconda/base/envs"

# GLOBAL aliases
alias -g L="|less"
alias -g NULL=">/dev/null 2>&1"
alias -g G="|grep"
alias -g PB="|pbcopy"
alias -g TB="|nc termbin.com 9999"

# OS specifics
alias ypwd='pwd|pbcopy'
alias ldd='otool -L'

# URLs w/o quoting!
alias curl="nog curl"
alias xh="nog xh"
alias http="nog http"

# dotenv helper
def dotenv() {
    for l (`cat .env`) {
        eval "export $l"
    }
}

# magic-wormhole
alias whs="wormhole send"
alias whr="wormhole receive"

# nitty web services
func wttr.in() {
    it2setkeylabel set status "$(curl wttr.in/$1\?format=3)"
}
func file.io() {
    curl -X POST -F "file=@$1" https://file.io | jq .link
}

# Brew
alias brew-svc="brew services"

# AWS vpns
# alias start-vpn="aws ec2 start-instances --ids ..."
# alias stop-vpn="aws ec2 stop-instances --ids ..."

# Translate
alias ru="trans ru:en"
for lang in en el es; do
    alias $lang="trans ${lang}:ru"
done

# Audio stuff
func mp3_cover() {
    if [ $# -lt 3 ]; then
        print "Args: infile.mp3 cover.jpg outfile.mp3"
    else
        ffmpeg -i $1 -i $2 -map 0:0 -map 1:0 -c copy -id3v2_version 3 $3
    fi
}
