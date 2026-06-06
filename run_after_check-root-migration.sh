#!/usr/bin/env bash
# Read-only migration check — runs after every `chezmoi apply`. It NEVER edits a
# file; it only warns when this machine's dotfiles predate the .root pattern and
# still hold their config inline instead of sourcing the shared ~/.<tool>.root
# baseline. Splitting them is a per-line judgement call, so this just points at
# the docs. See README "Per-machine overrides".

pending=""

check() {  # $1 = dotfile   $2 = marker proving it's migrated   $3 = include line for the top
    [ -f "$1" ] || return 0                      # absent → create_ bootstraps fresh machines
    grep -qF "$2" "$1" 2>/dev/null && return 0    # already sources its .root baseline → fine
    pending="${pending}      • ${1}  →  add at top:  ${3}
"
}

check "$HOME/.zshrc"     '.zshrc.root'     'source ~/.zshrc.root'
check "$HOME/.gitconfig" '.gitconfig.root' '[include] then  path = ~/.gitconfig.root'

if [ -n "$pending" ]; then
    printf '\n⚠️  Some dotfiles predate the .root pattern and still hold config inline:\n\n%s\n' "$pending"
    printf '    Decide what goes where — your call, line by line:\n'
    printf '      • shared across all machines   →  move into ~/.<tool>.root  (tracked, via chezmoi)\n'
    printf '      • machine-specific, or unsure  →  leave it in the everyday dotfile  (overrides the baseline)\n\n'
    printf '    Full steps: chezmoi cd → README.md → "Per-machine overrides"\n\n'
fi

exit 0
