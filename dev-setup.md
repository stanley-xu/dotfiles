# Development tools

## Editor: VS Code

- Install the command line tool `code`
- Paste your existing `settings.json`

## SSH

### Installation

### Config

You may also want a SSH config file for convenience
```
Host *
    <Default settings>

Host <alias for host>
    HostName <hostname>
    User <username>
    IdentityFile <path to auth id file>
```

## Git

1. Create a Github/Gitlab account
2. Join your organization if necessary

There are two protocols for secure connections to Github: using HTTPS or SSH

### SSH

Generate an SSH key pair on your device, sending only the public key to Github

Read full instructions [here](https://help.github.com/en/enterprise/2.17/user/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- The `ssh-agent` makes password-protected keys more convenient

### Global configs

Setup your global configs (your name and email)

```bash
git config --global user.email "email@example.com"
git config --global user.name "name"
```

### Aliases

See my dotfiles and [how to install them](README)

## Containers/VMs

Install Docker for Mac/Windows

## Software packages

The following are good to start with:
- Python3: `brew install python3`
- NVM: (instructions on Github page)
    - It's highly [recommended](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally) to use NVM (esp. for WSL)
- Node/NPM: `nvm install node`

For Ubuntu, you may need:
- Build essentials: `sudo apt install build-essential`
