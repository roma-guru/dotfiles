source ~/.zplug/init.zsh

# TODO: Move to prezto
# Supports oh-my-zsh plugins and the like
# zplug "plugins/git",   from:oh-my-zsh
# zplug "plugins/pip",   from:oh-my-zsh
# zplug "plugins/z",   from:oh-my-zsh

# Zdharma!
# zplug "zdharma/fast-syntax-highlighting", defer:2
# zplug "zdharma/zui"

# Other
# zplug "supercrabtree/k"
# zplug "Tarrasch/zsh-bd"
# zplug "molovo/revolver", as:command, use:revolver
# zplug "ChrisPenner/copy-pasta"

# Local plugins
for f in ~/.zsh/*.zsh; source $f;

# Then, source plugins and add commands to $PATH
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Prompt
prompt adam2
