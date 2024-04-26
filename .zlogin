# Just for Fun
if [ $RANDOM -lt 7777 -a $TERM_PROGRAM = iTerm.app ]; then
    ricksay
fi

# Prompt
eval "$(starship init zsh)"

# Iterm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# FZF
source ~/.zsh/fzf-bindings
source ~/.zsh/fzf-completion
export FZF_DEFAULT_OPTS="--height=25"
export FZF_DEFAULT_COMMAND='fd --type f'
