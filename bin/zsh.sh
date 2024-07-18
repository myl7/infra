#!/usr/bin/env bash
set -euo pipefail

sudo apt-get install -y command-not-found zsh-autosuggestions zsh-syntax-highlighting fasd
curl -fsSLo "$HOME/.zshrc" https://raw.githubusercontent.com/myl7/config/main/zshrc
curl -fsSLo "$HOME/.zshenv" https://raw.githubusercontent.com/myl7/config/main/zshenv
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/powerlevel10k
