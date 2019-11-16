export PATH=/usr/local/bin:$PATH

# Aliases
source $HOME/.zsh/aliases.zsh

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/stanley/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Oh-my-zsh plugins
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/history.zsh

# zsh-autocompletion
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Starship
eval "$(starship init zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

