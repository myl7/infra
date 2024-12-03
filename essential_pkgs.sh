#!/usr/bin/env bash
set -euo pipefail

function pkg_install { sudo apt-get install -y $@; }

pkg_install sudo zsh tmux neovim curl wget git rsync
pkg_install net-tools dnsutils nethogs htop iotop nmap tcpdump
pkg_install build-essential python3 python3-pip python3-venv
