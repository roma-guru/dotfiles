declare -U path

# homebrew fix
export HOMEBREW_PREFIX=/opt/homebrew
path=( /opt/homebrew/bin $path )

# set PATH so it includes user's private bin if it exists
path=( ~/.local/bin $path )

# iterm tools
path=( ~/.iterm2 $path )

# doom emacs
path=( ~/.emacs.d/bin $path )

# python path
export PYTHONASYNCIODEBUG=1

# admin tools
path=( /usr/local/sbin /usr/local/bin $path )

# go & rust paths
export GO111MODULE=on
export GOPATH=~/go
path=( $GOPATH/bin $HOME/.cargo/bin $path )

# clibs
export CPATH=/opt/homebrew/include

# biology
path=( ~/Library/Emboss/bin $path )
DYLD_LIBRARY_PATH=~/Library/Emboss/lib
