export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/ripgrep",   from:oh-my-zsh
zplug "plugins/fd",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh
# zplug "plugins/fasd",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/python",   from:oh-my-zsh
zplug "plugins/golang",   from:oh-my-zsh
zplug "plugins/npm",    from:oh-my-zsh

zplug "modules/archive",    from:prezto
zplug "modules/osx",    from:prezto
zplug "modules/homebrew",    from:prezto

# Other
zplug "supercrabtree/k"
zplug "Tarrasch/zsh-bd"
zplug "molovo/revolver", as:command, use:revolver
zplug "arzzen/calc.plugin.zsh"

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
