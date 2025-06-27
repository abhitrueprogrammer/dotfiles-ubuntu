#!/usr/bin/env bash

CONFIG_DIR="app_config"

echo "Installing fish shell and fortune..."
sudo apt install -y fish fortune-mod

# Ensure the setup script is executable
chmod +x "$CONFIG_DIR/setup_fish.sh"

# Run the fish setup
"$CONFIG_DIR/setup_fish.sh"
