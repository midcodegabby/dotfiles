#!/usr/bin/env bash

# Editor
export EDITOR='vim'
export VISUAL='vim'

# XDG directory variable - typically ~/.config
[[ ! -z XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="${HOME}/.config"

# General workspace
export PRJ="${HOME}/workspace/projects"
