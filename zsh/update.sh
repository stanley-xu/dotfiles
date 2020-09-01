#!/usr/bin/env bash

STARTER_ZSHRC="zshrc"
ZSH_DIR="zsh"
DST_ZSH_DIR="${HOME}/.${ZSH_DIR}" # the "destination" zsh directory
DST_ZSHRC="${HOME}/.${STARTER_ZSHRC}" # the "destination" zshrc

function update_all {
  cd ${DST_ZSH_DIR}

  echo "OMZ's completion"
  curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh -o completion.zsh
  echo ''

  echo "OMZ's history"
  curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/history.zsh -o history.zsh
  echo ''

  echo 'zsh-autosuggestions'
  update_repo zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions.git
}

function update_repo {
  REPO=$1 # zsh-autosuggestions
  LINK=$2 # https://github.com/zsh-users/zsh-autosuggestions.git

  if [ ! -d ${REPO} ]; then
    git clone ${LINK}
  else
    git -C ${REPO} pull
  fi
}

function add_p10k {
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
}

function run {
  cd "$(dirname "$0")"

  # Create starter config
  if [ ! -d ${DST_ZSH_DIR} ]; then
    echo "${DST_ZSH_DIR} not found"

    if [ -d "$HOME/powerlevel10k" ]; then
      echo 'Adding powerlevel10k...'
      add_p10k
    fi
    
    echo 'Copying starter .zsh/ and .zshrc...'
    cp ${STARTER_ZSHRC} ${DST_ZSHRC} && cp -r ${ZSH_DIR} ${DST_ZSH_DIR}
  else
    echo 'Updating external scripts...'
  fi

  update_all
}

run

echo 'Done'  
