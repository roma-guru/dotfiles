# Zsh tweaks
setopt extendedhistory histsavenodups histfindnodups histignoredups histexpiredupsfirst histignorespace
setopt autocd autopushd extendedglob chase_links noshare_history
zmodload zsh/mathfunc zsh/clone zsh/stat zsh/regex
zmodload zsh/net/tcp zsh/zftp
autoload -U zmv
autoload -Uz promptinit
bindkey -v
bindkey "^p" push-line-or-edit
bindkey -M vicmd "^t" transpose-words
bindkey -M vicmd "K" run-help
export REPORTTIME=3
export KEYTIMEOUT=0
export DIRSTACKSIZE=10
export EDITOR=vim

# FZF power
source ~/.zsh/fzf-bindings
source ~/.zsh/fzf-completion
export FZF_DEFAULT_OPTS="--height=25"

# Stop breking autoupdates!
export HOMEBREW_NO_AUTO_UPDATE=1

# Just for Fun
[ $RANDOM -lt 7777 ] && ricksay

