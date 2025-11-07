function install_failed {
  echo "🔴 Failed to install $1"
}

function install_missing {
  echo "🟡 Installing missing tool: $1"
}

function install_finished {
  echo "🟢 $1 installed!"
}

# ----------------------------------------------

### fzf
FZF_HOME="${XDG_DATA_HOME}/fzf/fzf.git"
FZF_CONFIG_HOME="${XDG_CONFIG_HOME}/fzf"
# Clone if needed
if [ ! -d "${FZF_HOME}" ]; then
  install_missing "fzf"
  mkdir -p "$(dirname "${FZF_HOME}")"
  if git clone --depth 1 https://github.com/junegunn/fzf.git "${FZF_HOME}" && ${FZF_HOME}/install --xdg; then
    install_finished "fzf"
  else
    install_failed "fzf"
    return 1
  fi
fi

# fzf initialization
[ -f "${FZF_CONFIG_HOME}/fzf.zsh" ] && source "${FZF_CONFIG_HOME}/fzf.zsh"
###

### Zinit
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
# Clone zinit if needed
if [ ! -d "${ZINIT_HOME}" ]; then
  install_missing "zinit"
  mkdir -p "$(dirname "${ZINIT_HOME}")"
  if git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"; then
    install_finished "zinit"
  else
    install_failed "zinit"
    return 1
  fi
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

# Zoxide
if command -v zoxide > /dev/null 2>&1; then
  eval "$(zoxide init zsh)"
else
  install_missing "zoxide"
  if curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh; then
    eval "$(zoxide init zsh)"
    install_finished "zoxide"
  else
    install_failed "zoxide"
    return 1
  fi
fi

# Mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
else
  install_missing "mise"
  if curl -sSfL https://mise.run | sh; then
    eval "$(mise activate zsh)"
    install_finished "mise"
  else
    install_failed "mise"
    return 1
  fi
fi
