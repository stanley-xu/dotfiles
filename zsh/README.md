# About my ZSH config

Rather than use a complete "configuration framework" like Oh-my-zsh, I decided to craft my own convention

```
|__ $HOME
  |__ .zshrc
  |__ .zsh/
    |__ aliases.zsh (custom)
    |__ <some_script>.zsh
    |__ <some_repo>/
    |__ ...
```

## Script usage

Run the update script

```bash
./update.sh
```

If `$HOME/.zsh/` doesn't exist:
- The script sets up a new configuration
  - This copies my starter `zsh` files and clones its dependencies
  - The above `$HOME/.zsh/` and `$HOME/.zshrc` will be created

Otherwise
- It updates dependencies for my specific configurations

## TODO

[ ] Research/use [Prezto](https://github.com/sorin-ionescu/prezto) so I don't shoot myself in the foot too much

[ ] Using a `/modules` to `source`
