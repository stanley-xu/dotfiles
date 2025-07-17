### System
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
###

source ~/.config/zsh/aliases.zsh

### fzf
FZF_HOME="${XDG_DATA_HOME}/fzf/fzf.git"
FZF_CONFIG_HOME="${XDG_CONFIG_HOME}/fzf"
# Clone if needed
if [ ! -d "${FZF_HOME}" ]; then
  mkdir -p "$(dirname) ${FZF_HOME}"
  git clone --depth 1 https://github.com/junegunn/fzf.git "${FZF_HOME}"
  ${FZF_HOME}/install --xdg
fi

# fzf initialization
[ -f "${FZF_CONFIG_HOME}/fzf.zsh" ] && source "${FZF_CONFIG_HOME}/fzf.zsh"
###

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
zinit light Aloxaf/fzf-tab

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # update autocomplete matcher to be case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colourize completions
zstyle ':completion:*' menu no # opt out of default ls menu (for fzf-tab)
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # preview colourized dir submenu

# More plugins
# https://github.com/ohmyzsh/ohmyzsh/wiki/plugins
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# See https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#completions-2
autoload -U compinit && compinit
zinit cdreplay -q
###

# Mise initialization
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
else
  echo 'mise not found, installing...'
  curl https://mise.run | sh
  mise --version

  echo 'Activating mise...'
  eval "$(mise activate zsh)"

  echo 'Verifying mise...'
  mise doctor
fi
