# iTerm
case $TERM_PROGRAM in
    iTerm.app)
        # Weather
        wttr.in

        # Shell integration
        test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    ;&

    WarpTerminal)
        # Just for Fun
        [ $RANDOM -lt 7777 ] && ricksay

        # Prompt
        eval "$(starship init zsh)"
    ;;
esac

# FZF
source ~/.zsh/fzf-bindings
source ~/.zsh/fzf-completion
export FZF_DEFAULT_OPTS="--height=25"
export FZF_DEFAULT_COMMAND="fd --type f"

# Locale
export LC_ALL="el_GR.UTF-8"

# Bat theme
export BAT_THEME=zenburn

# Homebrew stop breaking!
export HOMEBREW_NO_AUTO_UPDATE=1
