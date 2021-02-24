#!/usr/bin/env bash

###
# Copies rcfiles from this repo to the system by symlinking dotfiles/*rc files here onto $HOME/.*rc
# Tries to piggy-back on any existing rcfiles (i.e. zshrc)
###

# Existing rcfiles
SRC_ZSHRC="$(realpath zshrc)"
DST_ZSHRC="${HOME}/.zshrc"

# Link to $HOME
if [ ! -f ${DST_ZSHRC} ]; then
  ln -s ${SRC_ZSHRC} ${DST_ZSHRC}
else
  cat ${SRC_ZSHRC} >> ${DST_ZSHRC} # append
fi
