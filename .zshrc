# Prompt and completions
autoload -Uz promptinit compinit
promptinit && prompt fade
compinit

# wifi from the start
if [ -z "$(nmcli conn show --active | grep CYTA)" ]; then
    nmcli conn up CYTA
fi

# Local plugins
for f in ~/.zsh/*.zsh; source $f;

if [ -z "$DISPLAY" ]; then
    setfont gr737d-8x16
    tmux
fi
