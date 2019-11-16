Dev environment setup (macOS)
===

*Credit to this [article](https://dev.to/netguru/howto-my-terminal-shell-setup-hyper-js-zsh-starship-2j2k) for inspiration*

## Configure macOS

I don't do much except tweak these knobs:
1. Keyboard
  	- Key Repeat: Fastest
  	- Delay Until Repeat: Shortest
2. Trackpad
  	- Enable Tap to Click
  	- Enable Silent clicking
  	- Tracking speed: 2nd fastest
3. Display to most scaled

## Homebrew

Install Homebrew (instructions on their website)

## Terminal setup

1. Install ZSH: `brew install zsh`

2. Install Starship prompt: `brew install starship`

3. Configure zsh
    - Run the update script: `./update.sh`
  	- Copy the `.zshrc` into `$HOME`

---
My zshrc is minimal

I'm using the `.zsh` directory for my user settings
- It contains scripts made by the community (i.e. Oh-my-zsh contributers, etc.)
- Only a select few were pulled and used from .zshrc (see `update.sh`)

`aliases.zsh` is my own alias file

---

4. Install Powerline font (optional)
  	- Fira Code (instructions on Github)

5. Install iTerm: (instructions on website)

6. Configure iTerm
    - Bells
        - Silence bells
        - Flash visual bells
    - Pastel (Dark) colours
    - Font: Fira Code
    - Set default shell to zsh
        - Homebrews ZSH installs go into /usr/local
        - You'd need to either
            1. `echo "$(which zsh)" >> /etc/shells`
          
                To get macOS to see zsh as a login shell; then Profile > General > Login should list zsh

            2. Profile > General > Command: `$(which zsh)`

## Git

You may want to setup your global configs now

`git config --global user.email "email@example.com"`

## Install more packages

The following are good to start with:

- Python3: `brew install python3`
- NVM: (instructions on Github page)
- Node/NPM: `nvm install node`

## Install apps

- VS Code
    - Also install the command line tool `code`
    - Paste your existing `settings.json` (I keep mine in my gist)
- Chrome (for the DevTools ;D)
