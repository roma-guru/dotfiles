# set PATH so it includes user's private bin if it exists
declare -U path
path=( . ~/.local/bin $path )

# python path
export PYTHONASYNCIODEBUG=1

# admin tools
path=( /usr/local/sbin /usr/local/bin $path )

# go path
export GO111MODULE=on
export GOPATH=~/go
path=( $GOPATH/bin $path )
