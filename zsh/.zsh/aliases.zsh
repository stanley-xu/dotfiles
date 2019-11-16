# List
alias l='ls -G'
alias ls='ls -G'
alias ll='ls -lG'

alias grep='grep --color=auto'
alias less='less -R'

# Git
alias gs='git status' # Show the working tree status
alias gst='git status'
alias ga='git add' # Add file contents to the index
alias gb='git branch'
alias gbav='git branch --all --verbose' # When in list mode, show sha1 and commit subject line for each head, along with relationship to upstream branch (if any)
alias gbd='git branch --delete' # Delete a branch. The branch must be fully merged in its upstream branch, or in HEAD if no upstream was set with --track or --set-upstream-to.
alias gbdd='git branch -D' # Shortcut for --delete --force.
alias gc='git commit' # Record changes to the repository
alias gca='git commit --all' # Tell the command to automatically stage files that have been modified and deleted, but new files you have not told Git about are not affected.
alias gcm='git commit -m' # Use the given <msg> as the commit message.
alias gcam='git commit -am' # Shortcut for --all and -m
alias gcd='git commit --amend' # Replace the tip of the current branch by creating a new commit.
alias gcad='git commit --all --amend' # Shortcut for --amend and --all
alias gcl='git clone' # Clone a repository into a new directory
alias gcp='git cherry-pick' # Apply the changes introduced by some existing commits
alias gd='git diff' # Show changes between commits, commit and working tree, etc
alias gf='git fetch' # Download objects and refs from another repository
alias gl='git log --oneline' # Show commit logs, the commit message is prefixed with this information on the same line.
alias gm='git merge' # Join two or more development histories together
alias gco='git checkout' # Switch branches or restore working tree files.
alias gpr='git prune --verbose --progress' # Prune all unreachable objects from the object database. Report all removed objects. Show progress.
alias gps='git push' # Update remote refs along with associated objects
alias gpl='git pull' # Fetch from and integrate with another repository or a local branch.
alias gplr='git pull --rebase' # When true, rebase the current branch on top of the upstream branch after fetching.
alias grb='git rebase' # Reapply commits on top of another base tip.
alias grbi='git rebase --interactive' # Make a list of the commits which are about to be rebased. Let the user edit that list before rebasing. This mode can also be used to split commits.
alias gre='git reset' # Reset current HEAD to the specified state
alias greh='git reset --hard' # Resets the index and working tree. Any changes to tracked files in the working tree since <commit> are discarded.
alias gres='git reset --soft' # Does not touch the index file or the working tree at all (but resets the head to <commit>, just like all modes do). This leaves all your changed files "Changes to be alias gcommitted".
alias gr='git remote' # Manage set of tracked repositories
alias grv='git remote --verbose' # Be a little more verbose and show remote url after name.
alias gsa='git stash apply' # Like pop, but do not remove the state from the stash list.
alias gsl='git stash list' # List the stash entries that you currently have.
alias gsp='git stash pop' # Remove a single stashed state from the stash list and apply it on top of the current working tree state, i.e., do the inverse operation of git stash push.
alias gt='tag' # Create, list, delete or verify a tag object signed with GPG.

# Misc.
alias zshreload='source ~/.zshrc'
alias shtop='sudo htop'

