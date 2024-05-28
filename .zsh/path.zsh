# set PATH so it includes user's private bin if it exists
declare -U path
path=( . ~/.local/bin $path )

# admin tools
path=( /usr/local/sbin /usr/local/bin $path )
