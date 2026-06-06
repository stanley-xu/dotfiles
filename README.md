# welcome to my dotfiles 😶‍🌫️

My dotfiles don't bite!

For tools like `zsh` that support "inheritance", my dotfiles stay out of your way. Your machine's `.zshrc` stays in your control, and simply `source`s mine at the beginning. You're free to override any of my config within your dotfile, or change the "root" one (at `dot_zshrc.root`). The **local config always wins**.

## Install

```sh
# installs `mise` + `chezmoi`
curl -fsSL dotfiles.stanleyxu.me | sh

# works on any OS
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply "stanley-xu"

# or via Homebrew
brew install chezmoi && chezmoi init --apply "stanley-xu"
```

## What are all these `dot` files?

These are [chezmoi files](https://www.chezmoi.io). Think of these as blueprints that the `chezmoi` CLI tool will use to generate your actual dotfiles (like `.zshrc`). These blueprints lets `chezmoi` tailor the dotfile to your specific machine, if you'd like. Every file in this repo is "watched" or "managed" by `chezmoi`.

It's still just an ordinary `git` repo, so feel free to fork and maintain your own. [Tips for using chezmoi below](#chezmoi-cheatsheet).

## What can it do?

Here are the scripts that install packages and keeps things up-to-date.

1. **Chezmoi scripts** (`run_*.sh`) — run during `chezmoi apply`. `run_once_` runs once per machine; `run_onchange_` re-runs only when the script's content hash changes (e.g. editing the brew package list triggers reinstall).
2. **Shell rc** (`main.zsh` → `install-tools.zsh`) — runs on every shell session. Clones git-sourced tools (`fzf`, `zinit`) if missing, then activates tools for the session (`mise`, `zoxide`).

## A config for every computer

Chezmoi uses templating which allows you to write your own config, per OS. For example, `dot_zshrc.root.tmpl` inlines `dot_zshrc.darwin` only on macOS. See [chezmoi templates](https://www.chezmoi.io/user-guide/templating/).

## Shared and local configs for every computer

For tools like `zsh` and `git`, I've set it up so the shared (`.root`) config files are loaded into the regular dotfile in only one direction.

```
              | |
Shared config --> Local config
              | |
```

Tools opt into shared configuration and the real dotfile is kept **out** of chezmoi's control. This way, there are no conflicts every time you (or your tooling) make edits to your dotfiles. You own your dotfiles. _Your work machine's config will not bleed into your other machines!_

**Local config always wins**

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

The merge is **additive**: the `.root` baseline applies first, your local edits override only what they explicitly set, and everything else stays. The exact merge differs by tool but the result is the same.

### Extracting into the shared config

Treat edits to the everyday `~/.zshrc` / `~/.gitconfig` as a per-machine working copy. The `.root` file is like `git`'s main branch — when you want a change everywhere, "merge it back upstream" by moving it into the tracked `.root`.

### What if I already have a dotfile?

On a fresh machine the stubs are written automatically; if you / tooling created the file first, you'll need to add the `source`/`[include]` line to its top.

### Adding another tool to the `.root` pattern

When you adopt a new tool whose config tooling rewrites in place (and that can source another file), repeat the pattern by hand — it's two files per tool, no shared machinery:

1. **`dot_<x>.root`** — move the real config here (the tracked baseline). Add `.tmpl` if it needs templating.
2. **`create_dot_<x>`** — the once-written stub that pulls the baseline in **first**, using that tool's own include syntax:
   - zsh: `source ~/.zshrc.root`
   - git: `[include]` / `path = ~/.gitconfig.root`
   - tmux: `source-file ~/.tmux.conf.root`
   - vim: `source ~/.vimrc.root`

   The `create_` attribute means chezmoi writes it once on a fresh machine, then never touches it — so the tool/your edits below the include win.

3. **Migrate machines that already have the file** (one-time, per machine) — `create_` only fires when the file is absent, so existing machines need a manual nudge. Split the existing config however you like, line by line:
   - **shared across all machines** → move into `~/.<tool>.root` (tracked, via chezmoi).
   - **machine-specific, or unsure** → leave it in the everyday dotfile (it overrides the baseline).

   Then make sure the everyday file pulls in its `.root` at the top. You don't have to remember to do this: `run_after_check-overrides.sh` runs (read-only) after every `chezmoi apply` and warns you, with these instructions, until the machine is migrated. Extend its short check list when you add a tool.

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
