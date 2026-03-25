#!/usr/bin/env bash

set -e

echo "--- 🛠️ Stage 3: Workflow & TUI Bootstrap ---"

# 1. Oh My Zsh & Powerlevel10k
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

# 2. Powerlevel10k Theme
p10k_path="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$p10k_path" ]; then
  echo "Cloning Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k_path"
fi

# 3. Zsh Plugins (The "Power User" Stack)
plugin_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
declare -A PLUGINS=(
  ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
  ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting"
  ["fzf-tab"]="https://github.com/Aloxaf/fzf-tab"
)

for plugin in "${!PLUGINS[@]}"; do
  if [ ! -d "$plugin_dir/$plugin" ]; then
    echo "Cloning $plugin..."
    git clone "${PLUGINS[$plugin]}" "$plugin_dir/$plugin"
  fi
done

# 4. Tmux Plugin Manager (TPM)
# We ensure the plugin directory exists for your specific list
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM..."
  git clone https://github.com/tmux-python/tpm ~/.tmux/plugins/tpm
fi

# 5. Neovim (Lazy.nvim) Bootstrap
lazy_path="$HOME/.local/share/nvim/site/pack/lazy/start/lazy.nvim"
if [ ! -d "$lazy_path" ]; then
  echo "Bootstrapping Lazy.nvim..."
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$lazy_path"
fi

# 6. Set ZSH as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Setting ZSH as default shell..."
  sudo chsh -s "$(which zsh)" "$USER"
fi

echo "--- ✅ Stage 3 Complete ---"
