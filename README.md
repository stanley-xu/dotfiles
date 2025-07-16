# Dotfiles

Welcome to my dotfiles!

These have been simplified to using [chezmoi](https://www.chezmoi.io).

- Install and apply dotfiles

  ```sh
  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
  ```

- Use system package manager

  ```sh
  brew install chezmoi
  chezmoi init --apply $GITHUB_USERNAM
  ```

## Commands

Setup & maintenance

- `chezmoi init $GITHUB_USERNAME` clones your dotfiles from GitHub into the source directory.
- `chezmoi init --apply $GITHUB_USERNAME` clones your dotfiles from GitHub into the source directory and runs chezmoi apply.
- `chezmoi update` pulls the latest changes from your remote repo and runs chezmoi apply.
- Use normal git commands to add, commit, and push changes to your remote repo.

Daily commands

- `chezmoi add $FILE` adds $FILEfrom your home directory to the source directory.
- `chezmoi edit $FILE` opens your editor with the file in the source directory that corresponds to $FILE.
- `chezmoi status` gives a quick summary of what files would change if you ran chezmoi apply.
- `chezmoi diff` shows the changes that chezmoi apply would make to your home directory.
- `chezmoi apply` updates your dotfiles from the source directory.
- `chezmoi edit --apply $FILE` is like chezmoi edit $FILE but also runs chezmoi apply $FILE afterwards.
- `chezmoi cd` opens a subshell in the source directory.
