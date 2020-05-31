# List
alias l='ls -G'
alias ls='ls -G'
alias la='ls -Ga'
alias ll='ls -Gl'
alias lla='ls -Gla'

alias grep='grep --color=auto'
alias less='less -R'

# Git (most common commands)
alias g='git'
# checking status
alias gs='git status'
alias gbav='git branch --all --verbose' # show all branches
alias gl='git log --oneline' # short form logs
alias gd='git diff' # diff all lines changed
alias gsh='git show'
alias gshf='git show --name-status --pretty=""' # show all files changed
# commiting/indexing/staging
alias ga='git add' # add files to index/staging
alias gc='git commit' # commit
alias gca='git commit --all'
alias gcam='git commit -am'
alias gcamd='git commit --all --amend'
# branching
alias gb='git branch' # branch
alias gbd='git branch --delete' # delete a branch locally
alias gbdd='git branch -D' # forcibly delete local branch (--delete --force)
alias gco='git checkout' # switch branch or checkout existing branches
# updating branches
# alias gf='git fetch'    # left these commented because they encourage danger :/
# alias gpl='git pull'
# alias gps='git push'
# alias gm='git merge' # merge
alias grb='git rebase' # rebase
alias grbi='git rebase --interactive'
alias gcp='git cherry-pick' # cherry-pick any commit
# undo
alias gre='git reset'
# stash
alias gst='git stash'
