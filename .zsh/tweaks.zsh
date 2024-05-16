# Zsh tweaks
setopt extendedhistory histsavenodups histfindnodups histignoredups
setopt histexpiredupsfirst histreduceblanks sharehistory incappendhistory
setopt autocd autopushd extendedglob chase_links noflowcontrol
zmodload zsh/mathfunc zsh/clone zsh/stat zsh/regex
zmodload zsh/net/tcp zsh/zftp
autoload -U zmv
autoload -U zcalc
autoload -Uz promptinit

# Env
export REPORTTIME=3
export KEYTIMEOUT=0
export DIRSTACKSIZE=10
export EDITOR=vim
zstyle ':completion:*' rehash true
func chpwd() { k -h | head -n 10; print ... }
