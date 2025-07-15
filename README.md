# Dotfiles

This repo contains configuration files for dev tools like shells, git, etc. that I use.

Thanks to [Dotbot](https://github.com/anishathalye/dotbot), I just have a declarative [yaml file](install.conf.yaml) that describes my setup.

Then I just run `./install`

_Use for inspiration :)_

## Architecture Notes

### Configuration Philosophy

This dotfiles repo uses a **pragmatic approach** that balances organization with simplicity:

- **Most tools**: Simple 1:1 symlinks (`gitconfig` → `~/.gitconfig`, `vimrc` → `~/.vimrc`)
- **Complex tools** (like zsh): Use `~/.config/<tool>/` organization when it adds value
- **Tool installations** can still modify interface files without touching the repo

### File Structure Pattern

```
# Simple 1:1 symlinks (most tools)
gitconfig     -> ~/.gitconfig
vimrc         -> ~/.vimrc
mise.toml     -> ~/.config/mise/config.toml

# Organized approach (complex tools)
~/.zshrc      -> sources ~/.config/zsh/main.zsh (your config)
~/.config/zsh/ -> your organized, version-controlled config
~/.zshrc.local -> machine-specific overrides (not in repo)
```

### Why This Works

- **Start simple**: 1:1 symlinks for most tools
- **Evolve as needed**: Move to `~/.config/` organization when complexity demands it
- **Tools stay happy**: They find config files where expected
- **Repo stays clean**: Only your intentional config is version-controlled

### Maintenance Guidelines

- **Default to simple symlinks**: `tool-config` → `~/.tool-config`
- **Use ~/.config/ organization when**: Config gets complex, needs multiple files, or benefits from modularity
- **Use .local files for**: Machine-specific settings, temporary testing
- **Review interface files periodically**: Move useful tool additions to your config

### Adding New Tools

1. **Start simple**: Add 1:1 symlink in `install.conf.yaml`
2. **Let tools install normally**: They'll modify interface files
3. **Review what they added**: Decide if it's worth keeping
4. **Evolve if needed**: Move to `~/.config/` organization when complexity grows

## XDG Base Directory Specification

This setup respects XDG variables when tools support them:

- **XDG_CONFIG_HOME** (`~/.config/`): Files you customize (settings, keybindings, themes)
- **XDG_DATA_HOME** (`~/.local/share/`): Files apps manage internally (databases, logs, generated content)

**Key difference**: Config files are meant for user editing; data files are managed by applications.

---

## Resources

- https://dotfiles.github.io/
