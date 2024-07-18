#!/usr/bin/env bash
set -euo pipefail

apt-get install -y \
  sudo curl wget git neovim zsh rsync tmux \
  net-tools lsof dnsutils nethogs htop iotop nmap tcpdump \
  python3 python3-venv pipx build-essential
