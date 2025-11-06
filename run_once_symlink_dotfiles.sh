#!/usr/bin/env sh

# XDG_DATA_HOME may not be set when chezmoi runs this script
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

ln -sf "${XDG_DATA_HOME}/chezmoi" "$HOME/dotfiles"
