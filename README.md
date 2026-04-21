# 👋 Welcome to my dotfiles

## Install

My bootstrap script (installs `mise` + `chezmoi`):

```sh
curl -fsSL dotfiles.stanleyxu.me | sh
```

Or with `chezmoi` directly:

```sh
# works on any OS
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply "stanley-xu"

# or via Homebrew
brew install chezmoi && chezmoi init --apply "stanley-xu"
```

## Layout

```
├── dot_claude
│   └── agents
├── dot_config                                  # XDG_CONFIG_HOME
│   ├── chezmoi/chezmoi.toml
│   ├── mise/config.toml
│   ├── ohmyposh/prompt.toml
│   └── zsh
│       ├── aliases.zsh.tmpl                    # aliases
│       ├── install-tools.zsh                   # (re)installs git-sourced tools
│       └── main.zsh                            # entry point: system config, sources the above
├── dot_gitconfig
├── dot_vimrc
├── dot_zshrc.darwin                            # macOS-specific, inlined by dot_zshrc.tmpl
├── dot_zshrc.tmpl                              # generates ~/.zshrc
├── run_once_symlink_dotfiles.sh                # symlinks `~/dotfiles` -> source dir
└── run_onchange_install-brew-packages.sh.tmpl  # (re)installs Homebrew + packages
```

## How it's layered

Three execution contexts, each running at a different time:

1. **Bootstrap script** ([dotfiles.stanleyxu.me](https://dotfiles.stanleyxu.me)) — runs once on a fresh machine as a `curl … | sh` alternative to installing `chezmoi` yourself. Installs `mise` and `chezmoi`, then hands off to `chezmoi init --apply`.
2. **Chezmoi scripts** (`run_*.sh`) — run during `chezmoi apply`. `run_once_` runs once per machine; `run_onchange_` re-runs only when the script's content hash changes (e.g. editing the brew package list triggers reinstall).
3. **Shell rc** (`main.zsh` → `install-tools.zsh`) — runs on every shell session. Clones git-sourced tools (`fzf`, `zinit`) if missing, then activates tools for the session (`mise`, `zoxide`).

## Per-machine overrides

Two layers, picked by whether the difference is OS-wide or machine-specific:

**OS-specific** — chezmoi templating, merged at `chezmoi apply` time. `dot_zshrc.tmpl` inlines `dot_zshrc.darwin` only on macOS; add more OS branches with `{{ if eq .chezmoi.os "linux" }}`. See [chezmoi templates](https://www.chezmoi.io/user-guide/templating/).

**Machine-specific** — untracked local files sourced at runtime. Drop overrides in:

- `~/.gitconfig.local` — loaded by `[include]` in tracked `dot_gitconfig`
- `~/.zshrc.local` — sourced at the end of generated `~/.zshrc`

Both are silently skipped if absent, so the same tracked config works on every machine. Example (work machine forcing HTTPS for GitHub):

```ini
# ~/.gitconfig.local
[url "https://github.com/"]
    insteadOf = git@github.com:
```

---

## Chezmoi cheatsheet

Common flow:

```sh
chezmoi edit ~/.zshrc     # edit a managed file
chezmoi diff              # preview target-side changes
chezmoi apply             # write to $HOME
git commit -am "..."      # commit source (then `git push`)
```

Getting around:

- `chezmoi cd` — jump to the source dir (also symlinked at `~/dotfiles`)
- `chezmoi source-path` — absolute path to the source dir (default: `~/.local/share/chezmoi`)
- `chezmoi managed` — list files chezmoi tracks
- `chezmoi status` — summary of what `apply` would change

Adding (`chezmoi add <file>`):

- `--template` — add as a Go template (source file becomes `*.tmpl`)
- `--follow` — resolve symlinks to the real file

Editing source files:

- `chezmoi edit` — open the source dir in `$EDITOR`
- `chezmoi edit <file>` — open just that file's source
- `chezmoi edit --apply <file>` — apply changes after editor exits
- `chezmoi edit --watch <file>` — apply on every save

Syncing:

- `chezmoi update` — `git pull` this repo + `apply`
- Edited the real file in `$HOME` by mistake? `chezmoi add <file>` to re-ingest, or `chezmoi merge <file>` to reconcile.

See [chezmoi FAQ](https://www.chezmoi.io/user-guide/frequently-asked-questions/usage/) for more.

---

## Shoutouts

- CLI tools
  - [zinit](https://github.com/zdharma-continuum/zinit) for zsh plugins
  - [zoxide](https://github.com/ajeetdsouza/zoxide) for better `cd`
  - [fzf](https://github.com/junegunn/fzf) for fuzzy finding
- [Oh my Posh](https://ohmyposh.dev/) for prompt customization
- [Mise](https://github.com/jdx/mise) for dev tooling
