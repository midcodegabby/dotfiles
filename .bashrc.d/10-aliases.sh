#!/usr/bin/env bash

# ls
alias ls='ls -F --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# diff
alias diff='diff -u --color'

# git ##########################################################################
# Basic Essentials
alias ga='git add'
alias gaa='git add --all'
alias gs='git status'
alias gb='git branch'

# Commits & Syncing
alias gc='git commit -v'
alias gcm='git commit -m'
alias gca='git commit -v -a'
alias gp='git push'
alias gl='git pull'
alias gcsm='git commit -s -m'

# Navigation & History
alias gco='git checkout'
alias gcb='git checkout -b'
alias glo='git log --oneline --decorate'
alias glg='git log --stat'

# Quality of Life
alias gd='git diff'
alias gst='git stash'
alias gsp='git stash pop'
alias gdt='git difftool'
