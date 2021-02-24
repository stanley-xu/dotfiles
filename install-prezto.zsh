#!/usr/bin/env zsh

# STARTER_ZSHRC="$(readlink -f zshrc)" # absolute path
# STARTER_VIMRC='' (TODO)

# Link a starter files
# ln -sf ${STARTER_ZSHRC} "${HOME}/.zshrc"

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done