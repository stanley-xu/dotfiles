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
├── create_dot_gitconfig                        # ~/.gitconfig, created once then never touched; includes ~/.gitconfig.root
├── create_dot_zshrc                            # ~/.zshrc, created once then never touched; sources ~/.zshrc.root
├── dot_gitconfig.root                          # managed git baseline (included by ~/.gitconfig)
├── dot_vimrc
├── dot_zshrc.darwin                            # macOS-specific, inlined by dot_zshrc.root.tmpl
├── dot_zshrc.root.tmpl                          # generates ~/.zshrc.root (sourced by ~/.zshrc)
├── run_once_symlink_dotfiles.sh                # symlinks `~/dotfiles` -> source dir
└── run_onchange_install-from-brewfile.sh.tmpl  # (re)installs Homebrew + Brewfile packages
```

## How it's layered

Three execution contexts, each running at a different time:

1. **Bootstrap script** ([dotfiles.stanleyxu.me](https://dotfiles.stanleyxu.me)) — runs once on a fresh machine as a `curl … | sh` alternative to installing `chezmoi` yourself. Installs `mise` and `chezmoi`, then hands off to `chezmoi init --apply`.
2. **Chezmoi scripts** (`run_*.sh`) — run during `chezmoi apply`. `run_once_` runs once per machine; `run_onchange_` re-runs only when the script's content hash changes (e.g. editing the brew package list triggers reinstall).
3. **Shell rc** (`main.zsh` → `install-tools.zsh`) — runs on every shell session. Clones git-sourced tools (`fzf`, `zinit`) if missing, then activates tools for the session (`mise`, `zoxide`).

## Per-machine overrides

Two layers, picked by whether the difference is OS-wide or machine-specific:

**OS-specific** — chezmoi templating, merged at `chezmoi apply` time. `dot_zshrc.root.tmpl` inlines `dot_zshrc.darwin` only on macOS; add more OS branches with `{{ if eq .chezmoi.os "linux" }}`. See [chezmoi templates](https://www.chezmoi.io/user-guide/templating/).

**Machine-specific** — for `~/.zshrc` and `~/.gitconfig`, the file in `$HOME` *is* the per-machine layer (cascade below). For `~/.vimrc`, an optional `~/.vimrc.local` is `source`d by tracked `dot_vimrc` if present.

### The `.root` cascade

`~/.zshrc` and `~/.gitconfig` get edited by tooling (`git config --global`, work setup scripts), so chezmoi can't own them — it would keep reverting those edits. Instead, the real config lives in a tracked **`.root` file**, and chezmoi writes the actual `~/.zshrc` / `~/.gitconfig` just **once** (the `create_` source attribute: create if missing, then leave alone forever). That file pulls in its `.root` first, then whatever tooling/you add afterwards:

```sh
# ~/.zshrc — created once, then yours to edit
source ~/.zshrc.root          # tracked baseline
# anything below overrides it
```
```ini
# ~/.gitconfig — created once, then yours to edit
[include]
	path = ~/.gitconfig.root  # tracked baseline
# anything below overrides it
```

**Mental model:** treat edits to the everyday `~/.zshrc` / `~/.gitconfig` as a per-machine working copy. The `.root` file is `main` — when you want a change everywhere, "merge it back" by moving it into the tracked `.root`.

The merge is **additive**: the `.root` baseline applies first, your local edits override only what they explicitly set, and everything else stays. The exact merge differs by tool (zsh = sequential shell eval, last assignment wins; git = last value wins across includes) but the result is the same. On a fresh machine the stubs are written automatically; if tooling created the file first, just add the `source`/`[include]` line to its top.

### Adding another tool to the `.root` pattern

When you adopt a new tool whose config tooling rewrites in place (and that can source another file), repeat the pattern by hand — it's two files per tool, no shared machinery:

1. **`dot_<x>.root`** — move the real config here (the tracked baseline). Add `.tmpl` if it needs templating.
2. **`create_dot_<x>`** — the once-written stub that pulls the baseline in **first**, using that tool's own include syntax:
   - zsh: `source ~/.zshrc.root`
   - git: `[include]` / `path = ~/.gitconfig.root`
   - tmux: `source-file ~/.tmux.conf.root`
   - vim: `source ~/.vimrc.root`

   The `create_` attribute means chezmoi writes it once on a fresh machine, then never touches it — so the tool/your edits below the include win.
3. **Migrate machines that already have the file** (one-time, per machine) — `create_` only fires when the file is absent, so existing machines need a manual nudge:
   - File holds an *old copy of your managed config* → **overwrite** it with the stub (the config now lives in `.root`).
   - File holds *foreign content you want to keep* → **prepend** the include line at the top, leaving the rest as the per-machine layer.

There's deliberately no generic script driving this — with only a couple of tools, two explicit files each is simpler and lower-risk than a table-and-loop engine. Revisit that trade-off if a third or fourth tool shows up.

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
