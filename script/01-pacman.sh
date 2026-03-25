#!/usr/bin/env bash

set -e

echo "--- 📦 Stage 1: Core System, Hyprland & Dev Tools ---"

# 1. Update system
sudo pacman -Syu --noconfirm

# 2. Package Groups
CORE_TUI=(
  git curl wget ripgrep fd fzf tmux neovim
  eza zoxide yazi lazygit lazydocker zsh
  bat btop gdu nmap stow
)

HYPR_ECOSYSTEM=(
  hyprland xdg-desktop-portal-hyprland
  waybar walker
  wl-clipboard cliphist
  grim slurp
  hyprpolkitagent
  dunst
  qt5-wayland qt6-wayland # Fixes scaling/rendering for QT apps
)

# Dependencies for Yazi/Neovim/Previews
RESOURCES=(
  ffmpeg 7zip jq poppler imagemagick resvg
  imv mpv fastfetch
)

DEV_RUNTIMES=(
  base-devel cmake
  nodejs npm
  go
  gcc
  python python-pip ipython
  docker docker-compose
)

BROWSERS=(
  firefox
  qutebrowser
)

# 3. Installation
ALL_PACKAGES=(
  "${CORE_TUI[@]}"
  "${HYPR_ECOSYSTEM[@]}"
  "${RESOURCES[@]}"
  "${DEV_RUNTIMES[@]}"
  "${BROWSERS[@]}"
)

echo "Installing ${#ALL_PACKAGES[@]} packages..."
sudo pacman -S --needed --noconfirm "${ALL_PACKAGES[@]}"

# 4. Services
sudo systemctl enable --now docker.service
sudo usermod -aG docker $USER

echo "--- ✅ Stage 1 Complete ---"
