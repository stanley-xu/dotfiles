#!/usr/bin/env bash

STARTER_ZSHRC="zshrc"
STARTER_ZSH_HOME="zsh"
DST_ZSH_HOME="${HOME}/.${STARTER_ZSH_HOME}" # the "destination" zsh directory
DST_ZSHRC="${HOME}/.${STARTER_ZSHRC}" # the "destination" zshrc

function update_all {
  out "OMZ's completion"
  fetch completion.zsh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh

  out "OMZ's history"
  fetch history.zsh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/history.zsh

  out 'zsh-autosuggestions'
  update_repo zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions.git

  out 'powerlevel10k...'
  update_repo powerlevel10k https://github.com/romkatv/powerlevel10k.git
}

function out {
  echo ''
  echo $1
}

function fetch {
  DST="${DST_ZSH_HOME}/$1"
  LINK=$2

  curl ${LINK} -o ${DST}
}

function update_repo {
  REPO="${DST_ZSH_HOME}/$1" # zsh-autosuggestions
  LINK=$2 # https://github.com/zsh-users/zsh-autosuggestions.git

  if [ ! -d ${REPO} ]; then
    git clone --depth=1 ${LINK} ${REPO}
  else
    git -C ${REPO} pull
  fi
}

function run {
  cd "$(dirname "$0")"

  # Create starter config
  if [ ! -d ${DST_ZSH_HOME} ]; then
    out "${DST_ZSH_HOME} not found"

    out 'Copying starter .zsh/ and .zshrc...'
    cp ${STARTER_ZSHRC} ${DST_ZSHRC} && cp -r ${STARTER_ZSH_HOME} ${DST_ZSH_HOME}
  else
    out 'Updating dependencies...'
  fi

  update_all
}

run

out 'Done'  
