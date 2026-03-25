#!/usr/bin/env bash

set -e

# Get the absolute path of the dotfiles directory
DOTFILES_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
CONFIG_DIR="$DOTFILES_DIR/config"

echo "--- 🚀 Starting Full System Installation ---"

# 1. Run the modular scripts
chmod +x "$DOTFILES_DIR/scripts/"*.sh
"$DOTFILES_DIR/scripts/01-pacman.sh"
"$DOTFILES_DIR/scripts/02-aur.sh"
"$DOTFILES_DIR/scripts/03-setup.sh"

echo "--- 🔗 Stowing Configurations from $CONFIG_DIR ---"

# Packages to stow
STOW_PACKAGES=(
  zsh
  tmux
  nvim
  hypr
  yazi
)

# Loop through and stow each package
for package in "${STOW_PACKAGES[@]}"; do
  echo "Stowing $package..."
  # -d: source directory (where the folders are)
  # -t: target directory (where to symlink them)
  # -R: restow (recursive/overwrite)
  stow -d "$CONFIG_DIR" -t "$HOME" -R "$package"
done

echo "--- ✨ All Done! ---"
