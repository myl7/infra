#!/usr/bin/env bash
set -euo pipefail

INFRA_USER=myl

sudo apt-get install -y command-not-found zsh-autosuggestions zsh-syntax-highlighting fasd
curl -fsSLo "$HOME/.zshrc" https://raw.githubusercontent.com/myl7/config/main/zshrc
curl -fsSLo "$HOME/.zshenv" https://raw.githubusercontent.com/myl7/config/main/zshenv
curl -fsSLo "$HOME/.p10k.zsh" https://raw.githubusercontent.com/myl7/config/main/p10k.zsh
rm -rf ~/.local/share/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/powerlevel10k
sudo usermod -s /usr/bin/zsh "$INFRA_USER"
