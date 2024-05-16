# Keybinds, use it more!
#

bindkey -v
bindkey "^z" push-line-or-edit
bindkey "^t" transpose-words
bindkey "^x" transpose-chars

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line
bindkey -M vicmd "K" run-help
