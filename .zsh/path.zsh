declare -U path

# homebrew fix
export HOMEBREW_PREFIX=/opt/homebrew
path=( /opt/homebrew/bin $path )

# set PATH so it includes user's private bin if it exists
path=( ~/.local/bin $path )

# python path
export PYTHONASYNCIODEBUG=1
path=( ~/anaconda3/condabin $path )

# admin tools
path=( /usr/local/sbin /usr/local/bin $path )

# go & rust paths
export GO111MODULE=on
export GOPATH=~/go
path=( $GOPATH/bin $HOME/.cargo/bin $path )
