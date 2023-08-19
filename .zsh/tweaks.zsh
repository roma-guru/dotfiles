# Zsh tweaks
setopt extendedhistory histsavenodups histfindnodups histignoredups histexpiredupsfirst histignorespace
setopt autocd autopushd extendedglob chase_links noshare_history
zmodload zsh/mathfunc zsh/clone zsh/stat zsh/regex
zmodload zsh/net/tcp zsh/zftp
autoload -U zmv
autoload -U zcalc
autoload -Uz promptinit

bindkey -v
bindkey "^z" push-line-or-edit
bindkey -M vicmd "^t" transpose-words
bindkey -M vicmd "K" run-help

export REPORTTIME=3
export KEYTIMEOUT=0
export DIRSTACKSIZE=10
export EDITOR=vim
zstyle ':completion:*' rehash true
func chpwd() { k -h }

# edit in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line

# FZF power
source ~/.zsh/fzf-bindings
source ~/.zsh/fzf-completion
export FZF_DEFAULT_OPTS="--height=25"
export FZF_DEFAULT_COMMAND='fd --type f'

# Stop breking autoupdates!
export HOMEBREW_NO_AUTO_UPDATE=1

# Just for Fun
if [ $RANDOM -lt 7777 -a $TERM_PROGRAM = iTerm.app ]; then
    [ $RANDOM -lt 9999 ] && char=Morty || char=Rick
    ricksay -c $char
fi

# Locale fix for Spanish
export LANG="es_ES.UTF-8"
export LC_ALL="C"
