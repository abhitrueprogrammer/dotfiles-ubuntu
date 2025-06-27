#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="app_config"

# List of setup scripts (space-separated array keeps quoting safe)
scripts=(
  "apt.sh"
  "folder.sh"
  "$CONFIG_DIR/git.sh"
  "$CONFIG_DIR/vscode.sh"
  "$CONFIG_DIR/gnome.sh"
  "fish.sh"
  "docker.sh"
  "zen_beta.sh"
)

# ─── Interactive prompts ────────────────────────────────────────────────────
read -rp "Do you want to install and set up Fish shell? (Y/n) " answer_fish
read -rp "Do you want to install Neovim? (Y/n) " answer_nvim

install_fish=false
install_nvim=false
[[ -z ${answer_fish:-} || ${answer_fish,,} == y ]] && install_fish=true
[[ -z ${answer_nvim:-} || ${answer_nvim,,} == y ]] && install_nvim=true

echo "Install VS Code from its website, then press Enter to continue."
read -r _

# ─── Make scripts executable & run the core set ─────────────────────────────
chmod +x "${scripts[@]}"

./apt.sh
./"$CONFIG_DIR/git.sh"
./folder.sh
./"$CONFIG_DIR/gnome.sh"
./"$CONFIG_DIR/vscode.sh"

# ─── Optional steps ────────────────────────────────────────────────────────
$install_fish && ./fish.sh
$install_nvim && ./"$CONFIG_DIR/nvim.sh"

if command -v docker &>/dev/null; then
  ./wakapi.sh
fi

echo "Install the GNOME extensions 'Color Picker' and 'Vitals' via Extension Manager."
read -rp "Press Enter when they're installed… " _

echo
echo "✔  Setup complete."
echo "for browsers: install Chrome from its website and run ./zen_beta.sh when ready."
