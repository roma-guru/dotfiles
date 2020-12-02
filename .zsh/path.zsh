# set PATH so it includes user's private bin if it exists
declare -U path
path=( ~/.local/bin $path )

# admin tools
path=( /usr/local/sbin $path )

# go path
export GOPATH=~/go
path=( $GOPATH/bin $path )

# Doom!
path=( ~/.emacs.d/bin $path )

# npm
export NPM_CONFIG_PREFIX=/usr/local
