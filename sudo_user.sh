#!/usr/bin/env bash
set -euo pipefail

SUDO_USER=${SUDO_USER:-myl}

if id "$SUDO_USER" &>/dev/null; then
  echo "User $SUDO_USER already exists"
  exit 1
fi

# Create its home and add it to the sudo group
useradd -mG sudo "$SUDO_USER"
# Allow it to run sudo without password
echo "$SUDO_USER ALL=(ALL:ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$SUDO_USER"
