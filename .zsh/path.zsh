declare -U path

# set PATH so it includes user's private bin if it exists
path=( ~/.local/bin $path )

# doom emacs
path=( ~/.emacs.d/bin $path )

# admin tools
path=( /usr/local/sbin /usr/local/bin $path )

# go & rust paths
export GO111MODULE=on
export GOPATH=~/go
path=( $GOPATH/bin $HOME/.cargo/bin $path )

