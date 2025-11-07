# System configuration
# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export USER_INSTALLS="$HOME/.local/bin" # common convention (incl. mise)
export PATH="$USER_INSTALLS:$PATH"

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

# Aliases
source ~/.config/zsh/aliases.zsh

# Install and initialize tools (fzf, zinit, zoxide, mise)
source ~/.config/zsh/install-tools.zsh
