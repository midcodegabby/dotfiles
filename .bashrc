#!/usr/bin/env bash

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# rx for groups/others
umask 022

# History
shopt -s histappend

# vim behavior in terminal
set -o vi

# Expand env vars when autocompleting
shopt -s direxpand

# Allow Ctrl+s to do forward search rather than freezing the terminal
stty -ixon

# DO LAST ######################################################################
# Source local machine .bashrc if present ######################################
if [[ -f "${HOME}/.bashrc.local" ]]; then
    . "${HOME}/.bashrc.local"
fi

load_toolchains
