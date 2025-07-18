# 👋 Welcome to my dotfiles!

These have been simplified to use [chezmoi](https://www.chezmoi.io).

## Get started

- Install and apply dotfiles

  ```sh
  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply "stanley-xu"
  ```

- Use system package manager

  ```sh
  brew install chezmoi
  chezmoi init --apply "stanley-xu"
  ```

## Usage

`chezmoi` acts as the manager of the dotfiles.

### Quickstart

```sh
chezmoi cd # look around at the managed files (also see `chezmoi managed`)
# You can edit the managed dotfiles...

chezmoi update # pull updates from git

# Edit the *managed* version of the dotfile and apply changes to the real dotfile on close
chezmoi edit --apply ~/.zshrc 

chezmoi diff # see changes as a dry run
chezmoi apply # apply changes
```

### Setup & maintenance

- `chezmoi init $GITHUB_USERNAME` clones your dotfiles from GitHub into the source directory.
- `chezmoi init --apply $GITHUB_USERNAME` clones your dotfiles from GitHub into the source directory and runs chezmoi apply.
- `chezmoi update` pulls the latest changes from your remote repo and runs chezmoi apply.
- Use normal git commands to add, commit, and push changes to your remote repo.

### Daily commands

- `chezmoi add $FILE` adds `$FILE` from your home directory to the source directory.
  - `--template` flag adds `$FILE` as a template
  - `--follow` flag follows symlinks so chezmoi can target real files
- `chezmoi edit $FILE` opens your editor with the file in the source directory that corresponds to `$FILE`.
  - `--apply` flag edits `$FILE` but also runs `chezmoi apply $FILE` afterwards.
- `chezmoi status` gives a quick summary of what files would change if you ran `chezmoi apply`.
- `chezmoi diff` shows the changes that chezmoi apply would make to your home directory.
- `chezmoi apply` updates your dotfiles from the source directory.
- `chezmoi cd` opens a subshell in the source directory.

See the ways to edit in [the docs](https://www.chezmoi.io/user-guide/frequently-asked-questions/usage/#how-do-i-edit-my-dotfiles-with-chezmoi)
