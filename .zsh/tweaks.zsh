# Zsh tweaks
setopt autocd extendedglob histsavenodups chase_links noshare_history
zmodload zsh/mathfunc
autoload -U zmv
autoload -Uz promptinit
bindkey -v
bindkey "^p" push-line-or-edit
bindkey -M vicmd "^t" transpose-words
bindkey -M vicmd "K" run-help
export REPORTTIME=3
export KEYTIMEOUT=0
export EDITOR=vim

# FZF power
source ~/.zsh/fzf-bindings
source ~/.zsh/fzf-completion
export FZF_DEFAULT_OPTS="--height=25"

# Just for Fun
[ $RANDOM -lt 7777 ] && ricksay

