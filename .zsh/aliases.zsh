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
alias mkdir='mkdir -pv'
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

alias vimwork='file=work && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
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
   alias 3.$v="python3.$v"
done
alias 3.9='python3.9'
alias py='python3'
alias pypy='pypy3'
alias ipy='ipython3'
alias mkvenv="py -m venv .venv"
alias act=". .venv/bin/activate"
alias deact='deactivate'
alias pyhttp='py -m http.server 8000'
alias pysetup='py setup.py'
alias pyclean='rm -rf **/__pycache__'
def pypkg() {
    mkdir $1 && touch $1/__init__.py
}
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
alias docomp="docker compose"
alias pod="podman"

# Pip
alias pip=pip3
alias pip3="python3 -m pip"
alias pipi="pip3 install"
alias pipi-test="pip3 install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple"
alias pipi-req="pip3 install -r require*.txt"
alias pipi-dev="pip3 install -e ."
alias pipi-test="pip3 install --extra-index-url https://testpypi.python.org/pypi"
alias piprm="pip3 uninstall"
alias pipun="piprm"
alias pipgrep="pip3 freeze | grep"

# Hatch
alias ha=hatch
alias har="hatch run"
alias has="hatch shell"
alias hap="hatch python"

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

# OS specifics
alias ypwd='pwd|pbcopy'
alias ldd='otool -L'

# URLs w/o quoting!
alias curl="nog curl"
alias xh="nog xh"
alias http="nog http"

# transfer.sh
def transfer() {
    if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;
}

# dotenv helper
def dotenv() {
    for l (`cat .env`) {
        eval "export $l"
    }
}

# magic-wormhole
alias whs="wormhole send"
alias whr="wormhole receive"

# wttr.in
func wttr() {
    it2setkeylabel set status "$(curl wttr.in/$1\?format=3)"
}
