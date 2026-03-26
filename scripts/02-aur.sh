#!/usr/bin/env bash

set -e

echo "--- 🛠️ Stage 2: AUR Helper & AUR Packages ---"

# 1. Bootstrap paru if missing
if ! command -v paru &>/dev/null; then
  echo "Bootstrapping paru..."
  sudo pacman -S --needed --noconfirm base-devel
  git clone https://aur.archlinux.org/paru.git /tmp/paru
  cd /tmp/paru && makepkg -si --noconfirm
  cd - && rm -rf /tmp/paru
fi

# 2. Define AUR Packages
AUR_PACKAGES=(
  # The Must-Haves
  walker-bin
  hyprshot
  ttf-jetbrains-mono-nerd

  # Version Management (Clean AUR versions)
  nvm
  pyenv
)

# 3. Execution
echo "Installing AUR packages..."
paru -S --needed --noconfirm "${AUR_PACKAGES[@]}"

echo "--- ✅ Stage 2 Complete ---"
