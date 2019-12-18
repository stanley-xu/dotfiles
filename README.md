# Dotfiles

This repository contains configuration files for development tools like aliases, shell configs, etc. that I use

*Credit to this [article](https://dev.to/netguru/howto-my-terminal-shell-setup-hyper-js-zsh-starship-2j2k) for inspiration*

## How to use this

There are scripts included that can automate certain tasks:
- Run `update.sh` without arguments

    Will do either of the following depending on if you have a `$HOME/.zsh/` directory:
    - Setup a new configuration
        - This copies my starter `zsh` files and clones its dependencies
        - The above `$HOME/.zsh/` and `$HOME/.zshrc` will be created
    - Updating dependencies for my specific configurations

## About the ZSH configs

Basically: `.zshrc` is the main config file and the `.zsh/` directory contains:
- My own alias file: `aliases.zsh`
- Select scripts made by the community (i.e. Oh-my-zsh contributers, etc.)
    - Instead of using a full oh-my-zsh, I pull in what I need

# Dev environment setup

The remaining steps are written for completeness and a reference (for myself mostly)

---
Overview:
- macOS (10.14): Homebrew, zsh, iTerm
- Windows: WSL, zsh, Hyper terminal
- Extras: Starship prompt, powerline font

---

## Install a package manager

### macOS (10.14 Mojave)

Install [Homebrew](https://brew.sh/)

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Windows

Install WSL (check the most up-to-date instructions)
- Remember to update: `sudo apt update && sudo apt upgrade`

## Terminal setup

1. Install ZSH: `brew install zsh` or `sudo apt install zsh`

2. Set zsh as the default shell

    - macOS:

        Check `/etc/shells` to see that an entry for `zsh` exists but it's the default Apple supplied one; we need the one installed by Homebrew
        1. Update list of shells: `echo "$(which zsh)" >> /etc/shells` (may need sudo)
        2. `chsh -s $(which zsh)`

    - Ubuntu: `chsh -s $(which zsh)` 
        - *Pre Fall Creators* Windows builds are restricted to `bash`
            
            You can simply force zsh to start by writing `bash -c zsh` at the top of your `~/.bashrc`

3. Install Starship prompt: `brew install starship`
    - Ubuntu: follow the website instructions for Linux installs

4. Configure zsh
    - Run the update script: `./update.sh`

5. Install a Powerline font (optional)
  	- i.e. Fira Code (instructions on Github)

6. Install a terminal app 
    - macOS: iTerm
    - Windows: Hyper terminal

7. Configure terminal app 
    - Font: Fira Code
    - Silence bells and flash visual bells

    - iTerm specific
        - Pastel (Dark) colours
        - If `zsh` isn't the default shell, you can use iTerm's "Command" setting:
            
            Profile > General > Command: 'path/to/zsh'
    - Hyper specific
        ```javascript
        shell: 'C:\\Windows\\System32\\wsl.exe', // Fall Creators update
        //shell: 'C:\\Windows\\System32\\bash.exe',
        shellArgs: [],
        ```

## Development tools

### Git

Setup your global configs now

```bash
git config --global user.email "email@example.com"
git config --global user.name "name"
```

### SSH

- SSH keys
    - Git: generate a key pair and copy the verification key to the Git server (Github [instructions](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh))
- Config file template
    ```
    Host *
        <Default settings>
    
    Host <alias for host>
        HostName <hostname>
        User <username>
        IdentityFile <path to auth id file>
    ```

### Containers/VMs

Install Docker for Mac/Windows

### More packages

The following are good to start with:
- Python3: `brew install python3`
- NVM: (instructions on Github page)
    - It's highly [recommended](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally) to use NVM (esp. for WSL)
- Node/NPM: `nvm install node`

For Ubuntu, you may need:
- Build essentials: `sudo apt install build-essential`

## Editor: VS Code

- Install the command line tool `code`
- Paste your existing `settings.json`
