#!/usr/bin/env bash
set -euo pipefail

function pkg_install { sudo apt-get install -y $@; }
function curl_get { curl -fsSL --create-dirs $@; }

pkg_install zsh zsh-syntax-highlighting zsh-autosuggestions
chsh -s $(which zsh)

# zsh config
curl_get -o "$HOME/.zshrc" https://raw.githubusercontent.com/myl7/config/main/.zshrc
curl_get -o "$HOME/.zshenv" https://raw.githubusercontent.com/myl7/config/main/.zshenv

# p10k theme
P10K_DIR="$HOME/.local/share/zsh-theme-powerlevel10k"
if [[ -d "$P10K_DIR" ]]; then
  (cd "$P10K_DIR" && git pull --rebase) || true
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k "$P10K_DIR"
fi
curl_get -o "$HOME/.p10k.zsh" https://raw.githubusercontent.com/myl7/config/main/.p10k.zsh
