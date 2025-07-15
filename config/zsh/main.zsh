### System
# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=${HISTSIZE}
HISTDUP=erase

# Enhance history search
setopt appendhistory
setopt sharehistory # across zsh sessions
setopt hist_ignore_space # prefix a command with space " " for incognito mode
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Keybindings
bindkey -e # emacs-mode hotkeys (e.g. CTRL + F to accept autosuggest)
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # update autocomplete matcher to be case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colourize completions
###

source ~/.config/zsh/aliases.zsh

### Zinit
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
# Clone zinit if needed
if [ ! -d "${ZINIT_HOME}" ]; then
  mkdir -p "$(dirname) ${ZINIT_HOME}"
  git clone git@github.com:zdharma-continuum/zinit.git "${ZINIT_HOME}"
fi

source "${ZINIT_HOME}/zinit.zsh"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit
###

# Mise initialization
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
