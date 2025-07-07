# Shell
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

source ~/.config/zsh/aliases.zsh

# Mise initialization
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
