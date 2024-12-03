#!/usr/bin/env zsh
[ "${ZSH_VERSION:-}" = "" ] && echo >&2 "Only works with zsh" && exit 1
set -euo pipefail

function curl_get { curl -fsSL --create-dirs $@; }

curl_get https://raw.githubusercontent.com/myl7/host-init/main/nftables.conf | sudo tee /etc/nftables.conf > /dev/null
sudo systemctl enable nftables
sudo systemctl restart nftables
