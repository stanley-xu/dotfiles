#!/usr/bin/env bash

STARTER_ZSHRC="zshrc"
ZSH_DIR="zsh"
DST_ZSH_DIR="${HOME}/.${ZSH_DIR}" # the "destination" zsh directory
DST_ZSHRC="${HOME}/.${STARTER_ZSHRC}" # the "destination" zshrc

function update_all {
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
    cd ${REPO} && git pull
  fi
}

# Create starter config
if [ ! -d ${DST_ZSH_DIR} ]; then
  echo "${DST_ZSH_DIR} not found"
  echo 'Copying starter .zsh/ and .zshrc ...'

  cp ${STARTER_ZSHRC} ${DST_ZSHRC}
  cp -r ${ZSH_DIR} ${DST_ZSH_DIR}
  cd ${DST_ZSH_DIR}
else
  echo 'Updating external scripts...'
  cd ${DST_ZSH_DIR}
fi

update_all

echo 'Done'  
