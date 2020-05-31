# About my ZSH config

Rather than use a complete "configuration framework" like Oh-my-zsh, I decided to craft my own convention
- Manage `$HOME/.zshrc` myself
- And cherry-pick open-sourced plugins/scripts into the `$HOME/.zsh/` directory

## Script usage

`./update.sh`

If `$HOME/.zsh/` doesn't exist:
- Setup a new configuration
  - This copies my starter `zsh` files and clones its dependencies
  - The above `$HOME/.zsh/` and `$HOME/.zshrc` will be created

Otherwise
- Updating dependencies for my specific configurations

## TODO

[ ] Research/use [Prezto](https://github.com/sorin-ionescu/prezto) so I don't shoot myself in the foot too much

[ ] Using a `/modules` to `source`
