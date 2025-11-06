# 👋 Welcome to my dotfiles

You can use this one-liner in your shell:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply "stanley-xu"
```

Or, this script that I host (which will install `mise` too):

```sh
curl -fsSL dotfiles.stanleyxu.me | sh
```

Or, use your system's package manager:

```sh
# macOS
brew install chezmoi
chezmoi init --apply "stanley-xu"
```

## Layout

There are a few ways these dotfiles install my tools:

### 1. [Bootstrap Script](dotfiles.stanleyxu.me)

- Installs and activates [mise](https://mise.jdx.dev/) for tooling
- Uses mise to install [chezmoi](https://www.chezmoi.io/) for dotfiles
- Applies dotfiles via `chezmoi init --apply`

### 2. Chezmoi Scripts (`run_onchange_*.sh`)

- Install **Homebrew** (if not present)
- Install Homebrew packages (coreutils, oh-my-posh, etc.)
- One-time setup tasks (symlinks, etc.)
- Re-run automatically when script content changes

### 3. Shell RC Files (`main.zsh`)

- Install/activate **git-cloned tools** (`fzf`, `zinit`)
- Activate **mise** and **zoxide** for each shell session
- Self-healing: reinstalls if tools are missing

---

<details>
<summary>What is chezmoi?</summary>

## `chezmoi` manages dotfiles

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

### Cheatsheet

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

</details>

---

## Shoutouts

- CLI tools
  - [zinit](https://github.com/zdharma-continuum/zinit) for zsh plugins
  - [zoxide](https://github.com/ajeetdsouza/zoxide) for better `cd`
  - [fzf](https://github.com/junegunn/fzf) for fuzzy finding
- [Oh my Posh](https://ohmyposh.dev/) for prompt customization
- [Mise](https://github.com/jdx/mise) for dev tooling
