#!/usr/bin/env zsh
[ "${ZSH_VERSION:-}" = "" ] && echo >&2 "Only works with zsh" && exit 1
set -euo pipefail

function pkg_install { sudo apt-get install -y $@; }
function curl_get { curl -fsSL --create-dirs $@; }

pkg_install neovim
curl_get -o ~/.config/nvim/init.lua https://raw.githubusercontent.com/myl7/config/main/nvim/init.lua

curl_get -o ~/.local/share/nvim/site/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install plugins
nvim -n --headless +'PlugInstall --sync' +qa
