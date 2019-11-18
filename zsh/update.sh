#!/usr/bin/env bash

ZSH_DIR=".zsh" # refers to the .zsh directory in this project
ZSH_HOME=${HOME}"/"${ZSH_DIR} # the "destination" zsh directory
ZSH_CONFIG=".zshrc" # my starter config file

function do_curl {
  echo "OMZ's completion"
  curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh -o completion.zsh
  echo ''

  echo "OMZ's history"
  curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/history.zsh -o history.zsh
  echo ''
}

if [ -d ${ZSH_HOME} ]; then
  echo 'Updating external scripts...'
  cd ${ZSH_HOME}

  do_curl

  echo "Updating repo: zsh-autosuggestion"
  cd zsh-autosuggestions && git pull

elif [ -d ${ZSH_DIR} ]; then
  echo 'Creating ZSH home directory...'
  echo 'Starting with included .zsh and .zshrc'
  cp ${ZSH_CONFIG} ~
  cp -r ${ZSH_DIR} ~
  cd ${ZSH_HOME}

  do_curl

  echo "Cloning repo: zsh-autosuggestion"
  git clone https://github.com/zsh-users/zsh-autosuggestions.git
else
  echo "Error: can't find ${ZSH_DIR}"
  exit 1
fi

echo 'Done'  
