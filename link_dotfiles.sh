#!/bin/bash

# Create symlinks between $HOME/.* and the versions in this repo

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Nice colors for linking messages
GREEN='\033[0;32m'
BYELLOW='\033[1;33m'
NO_COLOR='\033[0m'

VERBOSE=false

while getopts "vh" opt; do
    case $opt in
        v)
            VERBOSE=true
            ;;
        ?|h)
            echo "Usage: "${BASH_SOURCE[0]}" [-v]"
            echo "  -v: verbose output"
            exit 1
            ;;
    esac
done

# Enable globbing of dotfiles in wildcard
shopt -s dotglob

# Loop over all dotfiles in this repo
for dotfile_path in "${SCRIPT_DIR}"/*; do
    # Searches l-r across dotfile_path, deletes everything before the last /
    dotfile="${dotfile_path##*/}"

    # Skip to next loop if dotfile is any of these:
    # .git dir, LICENSE, or this script
    [[ "$dotfile" == ".git" ]] && continue
    [[ "$dotfile" == "${BASH_SOURCE[0]##*/}" ]] && continue
    [[ "$dotfile" == "LICENSE" ]] && continue
    [[ "$dotfile" == "README.md" ]] && continue

    # Check if link/local dotfile already exists
    if [[ -f "${HOME}/${dotfile}" ]]; then
        # If local dotfile links to the dotfile in this repo, skip to the next loop
        if [[ "$(readlink -f "${HOME}/${dotfile}")" == "${dotfile_path}" ]]; then
            [[ $VERBOSE == true ]] && echo "~/${dotfile} already links to ${dotfile_path}"
            continue
        fi

        printf "${BYELLOW}WARNING: local version of %s already exists, skipping link...\n" "$dotfile"
	    continue
    else
        ln -s "${dotfile_path}" "${HOME}/${dotfile}"
        printf "${GREEN}~/%s${NO_COLOR} -> %s\n" "$dotfile" "$dotfile_path"
    fi
done

# Disable globbing of dotfiles in wildcard
shopt -u dotglob
