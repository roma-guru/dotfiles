# Keybinds, use it more!
#
function cd-prev-dir { cd - }
zle -N cd-prev-dir

bindkey -v
bindkey "^z" push-line-or-edit
bindkey "^t" transpose-words
bindkey "^x" transpose-chars
bindkey "^^" cd-prev-dir

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line
bindkey -M vicmd "K" run-help
