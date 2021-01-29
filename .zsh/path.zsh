# set PATH so it includes user's private bin if it exists
declare -U path
path=( . ~/.local/bin $path )

# add user python scripts on Mac
export PYTHONDEVMODE=1
if [[ $(uname) == Darwin ]]; then
    path=( ~/Library/Python/3.7/bin $path )
fi

# admin tools
path=( /usr/local/sbin /usr/local/bin $path )

# go path
export GO111MODULE=on
export GOPATH=~/go
path=( $GOPATH/bin $path )

# ruby for jekyll
export PATH="/usr/local/opt/ruby/bin:$PATH"
