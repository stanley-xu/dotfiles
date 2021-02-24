#!/usr/bin/env bash

ALIASES_FILE='aliases.zsh'

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cp ${ALIASES_FILE} $HOME
echo "source ${ALIASES_FILE}" >> $HOME/.zshrc

echo 'Exiting install script...'
cat $HOME/.zshrc 
