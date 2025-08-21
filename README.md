# 👋 Welcome to my dotfiles

These have been simplified to use [chezmoi](https://www.chezmoi.io) 🏡

## Let's go!

- Install and apply dotfiles

  ```sh
  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply "stanley-xu"
  ```

- Use system package manager

  ```sh
  # macOS
  brew install chezmoi
  chezmoi init --apply "stanley-xu"
  ```

## What is this?

After the one-time `init` from above, the dotfiles should be good to go.

You're responsible for keeping the dotfiles in sync with the usual git workflow (pull, commit, push). The only difference here, is that there is now a space where `chezmoi` tracks / manages your dotfiles; also called the **source** directory. Dotfiles in here are simply copies that are renamed (e.g. `$HOME/.zshrc` -> `$CHEZMOI_HOME/dot_zshrc`). This space is what `chezmoi` treats as a source of truth when it **applies** dotfiles: writing back to your system `$CHEZMOI_HOME/dot_zshrc` -> `$HOME/.zshrc`.

Source directory == this git repo == `$CHEZMOI_HOME` == `~/.local/share/chezmoi`

## How do I use this?

**Note:** any path referenced in the below commands are paths to your **actual** dotfiles (like `.zshrc`) in your system; not the managed version (like `dot_zshrc`).

- **Add** to the managed space using `chezmoi add /path/to/file`
- **Edit** these files using `chezmoi edit /path/to/file`, or however you like[^1].
  - You can edit on your own by either editing the machine dotfile at `$HOME/*.`, or the source dotfile at `$CHEZMOI_HOME/*`
  - If you edit the machine dotfile, be sure to sync to source directory using `chezmoi add /path/to/file` to re-add or `chezmoi merge /path/to/file`
  - If you edit the source dotfile, you'll need to `apply` it to see it take effect on your machine
    - This is what `chezmoi edit` does
- **Preview** changes with `chezmoi diff`
- **Apply** changes with `chezmoi apply`: writes to your actual dotfiles
- **Push** changes with regular git commands
- **Pull** down changes from upstream (this repo) and apply with `chezmoi update`

[^1]: [these](https://www.chezmoi.io/user-guide/frequently-asked-questions/usage/#how-do-i-edit-my-dotfiles-with-chezmoi) are all the ways you could edit

Example
```sh
chezmoi edit ~/.zshrc
chezmoi diff
chezmoi apply
git commit -am "Made a change" && git push
```

### More useful commands

Shortcuts
- `chezmoi cd` change directory straight to this repo (I also symlink `~/dotfiles` to this repo; it's easier to find and remember)
- `chezmoi managed` shows you what is tracked by chezmoi
- `chezmoi status` gives a quick summary of what files would change if you ran `chezmoi apply`

Adding (`chezmoi add file`)
- `--template` flag adds `file` as a template
- `--follow` flag follows symlinks so chezmoi can target real files

Editing the source dotfile
- Setup your preferred editor
- `chezmoi edit` will open the entire source (managed) directory
- `chezmoi edit --apply file` will apply changes after the editor closes
- `chezmoi edit --watch file` will apply changes after the file is saved in the editor

---

## Projects that my dotfiles involve

- CLI tools
  - [zinit](https://github.com/zdharma-continuum/zinit) for zsh plugins
  - [zoxide](https://github.com/ajeetdsouza/zoxide) for better `cd`
  - [fzf](https://github.com/junegunn/fzf) for fuzzy finding
- [Oh my Posh](https://ohmyposh.dev/) for prompt customization
- [Mise](https://github.com/jdx/mise) for dev tooling
