#!/usr/bin/env zsh

###
# Clones the Prezto framework for zsh and overwrites the relevant zsh rcfiles at $HOME
# with the ones in .zprezto/
###

# Download prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Symlinks $ZDOTDIR:-$HOME/.<rcfiles> -> ZDOTDIR:-$HOME/.zprezto/runcoms/rcfiles
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" # override existing rcfiles
done
