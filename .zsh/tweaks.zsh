# Zsh tweaks
setopt extendedhistory histsavenodups histfindnodups histignoredups histexpiredupsfirst histignorespace
setopt autocd autopushd extendedglob chase_links noshare_history
# zmodload zsh/mathfunc zsh/clone zsh/stat zsh/regex
# zmodload zsh/net/tcp zsh/zftp
autoload -U zmv zcalc
autoload -Uz promptinit compinit

bindkey -v
bindkey "^z" push-line-or-edit
bindkey -M vicmd "^t" transpose-words
bindkey -M vicmd "K" run-help

export REPORTTIME=3
export KEYTIMEOUT=0
export DIRSTACKSIZE=10
export EDITOR=vim

zstyle ':completion:*' rehash true
func chpwd() { l }

# edit in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line

# FZF power
source ~/.zsh/fzf-bindings
source ~/.zsh/fzf-completion
export FZF_DEFAULT_OPTS="--height=25"
export FZF_DEFAULT_COMMAND='fd --type f'
