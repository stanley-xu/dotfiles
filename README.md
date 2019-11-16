Dev environment setup (macOS)
===

# Configure macOS

I don't do much except tweak these knobs:
1. Keyboard
  - Key Repeat: Fastest
  - Delay Until Repeat: Shortest
2. Trackpad
  - Enable Tap to Click
  - Enable Silent clicking
  - Tracking speed: 2nd fastest
3. Display to most scaled

# Homebrew

Install Homebrew (instructions on their website)

# Terminal setup

1. Install ZSH: `brew install zsh`

2. Configure zsh
  - Copy the `.zsh` directory into $HOME
  - Copy the `.zshrc` into $HOME

---
My zshrc is minimal

The .zsh/ directory contains scripts made by the community (i.e. Oh-my-zsh, etc.)
- Only a select few were pulled and used from .zshrc

.zsh/aliases.zsh is my own alias file

---

2. Install Powerline font (optional)
  - Fira Code (instructions on Github)

2. Install iTerm: (instructions on website)

3. Configure iTerm
- Bells
  - Silence bells
  - Flash visual bells
- Pastel (Dark) colours
- Font: Fira Code
- Set default shell to zsh
  - Homebrews ZSH installs go into /usr/local
  - You'd need to either
    1. echo "$(which zsh)" >> /etc/shells
      
      To get macOS to see zsh as a login shell; then Profile > General > Login should list zsh
    2. Profile > General > Command: $(which zsh)

# Git

You may want to setup your global configs now

`git config --global user.email "email@example.com"`

# Install more packages

The following are good to start with:

- Python3: `brew install python3`
- NVM: (instructions on Github page)
- Node/NPM: `nvm install node`

# Install apps

- VS Code
    - Also install the command line tool `code`
    - Paste your existing `settings.json` (I keep mine in my gist)
- Chrome (for the DevTools ;D)

