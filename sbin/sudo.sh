#!/usr/bin/env bash
set -euo pipefail

INFRA_USER=myl

echo "$INFRA_USER ALL=(ALL:ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$INFRA_USER"
sudo gpasswd -a "$INFRA_USER" sudo
