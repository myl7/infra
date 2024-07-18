#!/usr/bin/env zsh
[ "${ZSH_VERSION:-}" = "" ] && echo >&2 "Only works with zsh" && exit 1
set -euo pipefail

curl -fsSLo ~/.tmux.conf https://raw.githubusercontent.com/myl7/config/main/tmux.conf
curl -fsSLo- https://raw.githubusercontent.com/myl7/config/main/tmux.conf | sed '/signingkey = /d' | sed '/gpgsign = /d' > ~/.gitconfig
