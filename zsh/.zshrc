export PATH=/usr/local/bin:$PATH

# aliases
source $HOME/.zsh/aliases.zsh

# completion system
autoload -Uz compinit

# cache completion (thanks Thomas)
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Oh-my-zsh plugins
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/history.zsh

# zsh-autocompletion
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Starship
eval "$(starship init zsh)"

