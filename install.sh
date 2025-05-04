#!/bin/bash


set -e

PWD=$(pwd)
DOTCONFIG_PATH="$HOME/.config/dotconfig"
BASHRC_FILE="$HOME/.bashrc"
SOURCE_LINE='[ -f ~/.config/dotconfig/my_bashrc.sh ] && source ~/.config/dotconfig/my_bashrc.sh'
TMUX_CONF_FILE="$HOME/.tmux.conf"

# Create symlink for tmux.conf, only if it doesn't already exist
if [ ! -L "$TMUX_CONF_FILE" ]; then
  ln -s "${PWD}/tmux.conf" "$TMUX_CONF_FILE"
  echo "✅ Symlink for tmux.conf created."
else
  echo "ℹ️  tmux.conf symlink already exists, skipping creation."
fi

# Add the source line to .bashrc if not already present
if ! grep -Fxq "$SOURCE_LINE" "$BASHRC_FILE"; then
  printf "\n%s\n" "$SOURCE_LINE" >> "$BASHRC_FILE"
  echo "✅ Added source line to .bashrc"
else
  echo "ℹ️  Source line already present in .bashrc"
fi

echo "✅ Install complete. Restart your terminal or run: source ~/.bashrc"
