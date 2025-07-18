# Shell
alias ls='ls --color'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Git
# Key workflows
# - git concepts: working -> staging -> remote
# - edit: commit, rebase, fetch / pull, push
# - info: status, remote, diff, branch
alias g='git'

## Info
alias gst='git status'
alias ga='git add'
alias gd='git diff'
alias gco='git checkout'
alias gre='git reset'
alias gl='git log'
alias glo='git log --pretty=oneline --abbrev-commit'
alias glg='git log --graph --decorate --pretty=oneline --abbrev-commit'

## Edit
### Commit (c)
alias gc='git commit --verbose' # diff is shown in editor
alias gca='git commit --verbose --all'
alias gcm='git commit --message'
alias gcam='git commit --all --message'
alias gcr='git commit --amend --reuse-message HEAD'
alias gcp='git cherry-pick --ff'
alias gcR='git reset "HEAD^"'

### Rebase (r)
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias grs='git rebase --skip'

### Fetch (f)
alias gf='git fetch'
alias gff='git pull --ff-only'
alias gfr='git pull --rebase'

### Push (p)
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpF='git push --force'
alias gpu='git push --set-upstream origin "$(git branch --show-current 2> /dev/null)"'
alias gpp='git pull origin "$(git branch --show-current 2> /dev/null)" && git push origin "$(git branch --show-current 2> /dev/null)"'
