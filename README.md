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

```
├── dot_claude
│   └── agents
├── dot_config                                  # XDG_CONFIG_HOME
│   ├── chezmoi
│   │   └── chezmoi.toml
│   ├── mise
│   │   └── config.toml
│   ├── ohmyposh
│   │   └── prompt.toml
│   └── zsh
│       ├── aliases.zsh.tmpl                    # aliases
│       ├── install-tools.zsh                   # (re)installs tools
│       └── main.zsh                            # main file: system config, sources above files
├── dot_docker
├── dot_gitconfig
├── dot_vimrc
├── dot_zshrc.darwin                            # macOS
├── dot_zshrc.tmpl                              # zshrc
├── README.md
├── run_once_symlink_dotfiles.sh                # symlink `~/dotfiles` -> `$XDG_DATA_HOME/chezmoi`
└── run_onchange_install-brew-packages.sh.tmpl  # (re)installs Homebrew and packages
```

## Installation surfaces

1. [Bootstrap Script](dotfiles.stanleyxu.me): installs [mise](https://mise.jdx.dev/) for tooling and [chezmoi](https://www.chezmoi.io/) for dotfiles
2. Chezmoi Scripts (`run_*.sh`)

   - installs Homebrew and/or Homebrew packages (e.g. coreutils)
   - runs one-time setup tasks
   - Note: only run when script content changes (due to chezmoi hashing)

3. Shell RC Files (`main.zsh`):

   - installs other **git-sourced tools** (e.g. `fzf`); reinstalling if missing
   - **activate** tools for each shell session (e.g. `mise`, `zoxide`)

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
