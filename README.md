# Dev environment setup

The dotfiles in this repository are relevant at step 4 of the [terminal setup](#terminal-setup).

*Credit to this [article](https://dev.to/netguru/howto-my-terminal-shell-setup-hyper-js-zsh-starship-2j2k) for inspiration*

## Terminal setup

1. Install ZSH: `brew install zsh`
    - Ubuntu: `sudo apt install zsh`

2. Set zsh as the default shell
    - macOS:
        1. Update list of shells: `echo "$(which zsh)" >> /etc/shells`
            - Alternatively, skip this step and use the "Command" setting in iTerm
        2. `chsh -s $(which zsh)`
    - Windows: `chsh -s $(which zsh)` 
        - If you're running a pre Fall Creators build

            You're restricted to `bash` and must add `bash -c zsh` at the top of your `~/.bashrc`

3. Install Starship prompt: `brew install starship`
    - Ubuntu: follow the website instructions for Linux installs

4. Configure zsh
    - Run the update script: `./update.sh`
    - My zsh settings are minimalistic

        I'm using the `.zsh` directory for my user settings
        - It contains select scripts made by the community (i.e. Oh-my-zsh contributers, etc.)
        - `aliases.zsh` is my own alias file

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
- Config file
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
- Bonus: Docker compose

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
