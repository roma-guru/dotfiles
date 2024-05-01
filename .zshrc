# Prompt and completions
autoload -Uz promptinit compinit
promptinit && prompt adam2
compinit

# Local plugins
for f in ~/.zsh/*.zsh; source $f;
