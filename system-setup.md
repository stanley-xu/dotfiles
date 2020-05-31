# System setup

*Note:* instructions are for macOS unless otherwise stated

## System configuration

### Preferences

On macOS, I prefer
- Key repeat and delay until key repeat at its fastest
- Trackpad
  - Tap to click
  - Highest sensitivity
  - Fastest tracking speed

### Encrypt your hard drive

### Software

Chrome and maybe your preferred password manager app are good starters

Other software are recommended below

### Install a package manager

- macOS
  - Install [Homebrew](https://brew.sh/)
- Windows
  - Install WSL (check the most up-to-date instructions)
    - Remember to update: `sudo apt update && sudo apt upgrade`
- Linux
  - Update your package repository
    - For Ubuntu/Debian: `sudo apt update && sudo apt upgrade`

## Terminal setup

### ZSH

1. Install ZSH: `brew install zsh` or `sudo apt install zsh`

2. Set zsh as the default shell
    - macOS >= Catalina (10.15): nothing needs to be done, it's the default shell

    - macOS < Catalina (10.15)
        1. Update list of shells: `echo "$(which zsh)" >> /etc/shells`
        2. `chsh -s $(which zsh)`
        
    - Ubuntu: `chsh -s $(which zsh)` 

3. Configure ZSH dotfiles [here](README.md)

### Terminal prompt

[Starship](https://starship.rs/) is good for every platform, but [Powerlevel10k](https://github.com/romkatv/powerlevel10k) performs better on larger git repos
- Both prompts are highly configurable and generally fast

As of time of writing, both can be installed via Homebrew
- Starship prompt: `brew install starship`
- P10k: [instructions](https://github.com/romkatv/powerlevel10k#homebrew)

### Install a terminal app

I really like [iTerm2](https://www.iterm2.com/)

Here's how I configure it
- **Font:** Meslo or Fira Code + enable ligatures at size 12
- **Bells:** Silence bells and flash visual bells
- **Colours:**
  - Pastel (Dark) colours
- **Enable natural text editing**
  - Profile > Keys > Presets > Natural text editing
- Misc.
  - If `zsh` can't be the default shell, you can use iTerm's "Command" setting:
      
      Profile > General > Command: 'path/to/zsh'

### Install a powerline patched font (Optional)

Sources that can be installed with the system font installer
- [Monorepo](https://github.com/powerline/fonts) of powerline fonts
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) fully enable p10k features
  - P10k's setup will bundle `MesloLGS NF`

Continue to [dev tools setup](dev-setup)
