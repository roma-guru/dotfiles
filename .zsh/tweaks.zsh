# Zsh tweaks
setopt extendedhistory histsavenodups histfindnodups histignoredups histexpiredupsfirst histignorespace
setopt autocd autopushd extendedglob chase_links noshare_history
# zmodload zsh/mathfunc zsh/clone zsh/stat zsh/regex
# zmodload zsh/net/tcp zsh/zftp
autoload -U zmv zcalc
autoload -Uz promptinit compinit

export REPORTTIME=3
export KEYTIMEOUT=0
export DIRSTACKSIZE=10
export EDITOR=vim

bindkey -v
bindkey -M vicmd "M" run-help
bindkey -M vicmd "T" transpose-words
#...

bindkey "^v" edit-command-line
bindkey "^z" push-line-or-edit
#bindkey "^_" ...
#bindkey "^e" ...
#bindkey "^t" ...
#bindkey "^y" ...
#bindkey "^a" ...
#bindkey "^s" ...
#bindkey "^k" ...
#bindkey "^x" ...
#bindkey "^n" ...

zstyle ':completion:*' rehash true
func chpwd() { l }

# edit in vim
autoload -z edit-command-line
zle -N edit-command-line

# FZF power
source ~/.zsh/fzf-bindings
source ~/.zsh/fzf-completion
export FZF_DEFAULT_OPTS="--height=25"
export FZF_DEFAULT_COMMAND='fd --type f'

# Zoxide instead of traditional z
eval "$(zoxide init zsh)"
export _ZO_ECHO=1
