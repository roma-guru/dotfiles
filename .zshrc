source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh

# Zdharma!
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zdharma/zui"

# Other
zplug "supercrabtree/k"
zplug "Tarrasch/zsh-bd"
zplug "molovo/revolver", as:command, use:revolver
zplug "ChrisPenner/copy-pasta"

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
    # Navi testing
    source <(navi widget zsh)
else
    # Prompt
    promptinit && prompt fade
fi

# Direnv
eval "$(direnv hook zsh)"

