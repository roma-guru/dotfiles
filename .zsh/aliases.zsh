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
alias d='dirs -v'
alias l='exa -lh'
alias j='ranger --choosedir=$HOME/.ranger-dir && cd $(cat $HOME/.ranger-dir)'
alias h="history -i 1"

alias func=function
alias def=function

alias le='bat'
alias la='l -a'
alias cp='cp -R'
alias rm='rm -r'
alias rmf='rm -rf'
alias du='dust'
alias df='duf'
alias nog='noglob'
alias loc='noglob locate'
alias desk='cd ~/Desktop'
alias noc='nocorrect'
alias mmv='noglob zmv -W'
alias mkdir='mkdir -pv'
alias mkx='chmod a+x'
alias find='noglob find'
alias arc='archive'

alias e="emacsclient -c -a emacs" && alias v="vim" # make peace not war
alias nv="nvim"
alias m="micro"; alias n="nano"
alias svim="sudo vim"
alias vi="vim -u NONE"
alias rr="r -2"
alias rrr="r -3"
alias killj="kill %1"

alias vimzsh="vim ~/.zsh"
alias vimwork='file=work && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimali='file=aliases && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimtw='file=tweaks && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
alias vimpath='file=path && vim ~/.zsh/$file.zsh && . ~/.zsh/$file.zsh'
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

# Swift
alias sw='swift'
alias swc='swiftc'

# Containers
alias doc="docker"
alias docomp="docker compose"
alias pod="podman"

# Anaconda
def conda-act() {
    eval $(conda shell.zsh activate $1)
}
def conda-deact() {
    eval $(conda shell.zsh deactivate)
}

# Pip
alias pip=pip3
alias pip3="py -m pip"
alias pipi="pip3 install"
alias pipi-test="pip3 install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple"
alias pipi-req="pip3 install -r requirements.txt"
alias pipi-dev="pip3 install -e ."
alias pipi-test="pip3 install --extra-index-url https://testpypi.python.org/pypi"
alias piprm="pip3 uninstall"
alias pipgrep="pip3 freeze | grep"

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
alias gdno="git diff --name-only"

# Jupyter
alias jupy="jupyter notebook"
alias jupyc="jupyter console"

# Dir aliases
hash -d zsh="$HOME/.zsh"
hash -d local-bin="$HOME/.local/bin"
hash -d vim-plug="$HOME/.vim/plugged/"
hash -d go-home="$HOME/go"
hash -d postgres-data="/opt/homebrew/var/postgres"
hash -d homebrew="/opt/homebrew/Cellar"
hash -d homebrew-core="/opt/homebrew/Library/Taps/homebrew/homebrew-core"
hash -d homebrew-cask="/opt/homebrew/Library/Taps/homebrew/homebrew-cask"
hash -d python-packages="/opt/homebrew/lib/python3.9/site-packages"

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
