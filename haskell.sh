export PATH="$HOME/.local/bin:$PATH"

# stack zsh autocompletion for
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"
