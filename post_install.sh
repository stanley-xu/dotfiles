#!/usr/bin/env bash

# Append to existing config
if [ "$SPIN" ]; then
  cat zshrc >> "${HOME}/.zshrc"
fi
