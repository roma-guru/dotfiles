# Prompt and completions
autoload -Uz promptinit compinit
promptinit && prompt fade
compinit

# wifi from the start
conn_name="TP-Link_8514"
if [ -z "$(nmcli conn show --active | grep $conn_name)" ]; then
    nmcli conn up $conn_name
fi

# Local plugins
for f in ~/.zsh/*.zsh; source $f;

if [ -z "$DISPLAY" ]; then
    setfont gr737d-8x16
fi
