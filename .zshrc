export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/kubectl",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/poetry",   from:oh-my-zsh
zplug "plugins/python",   from:oh-my-zsh
zplug "plugins/golang",   from:oh-my-zsh

# Zdharma!
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2

# Other
zplug "Tarrasch/zsh-bd"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Local plugins
for f in ~/.zsh/*.zsh; source $f;

if [ $(uname) = Darwin ]; then
    # Prompt
    eval "$(starship init zsh)"
    # Iterm
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
else
    # Prompt
    promptinit && prompt fade
fi

# Direnv
eval "$(direnv hook zsh)"
# zsh fm
func chpwd() { l }
