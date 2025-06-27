#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="app_config"
# ─── Grab whatever Git already knows (if Git exists) ───────────────
if command -v git &>/dev/null; then
  git_user_name=$(git config --global --get user.name || true)
  git_user_email=$(git config --global --get user.email || true)
else
  git_user_name=""
  git_user_email=""
fi
echo "Setting git username as ${git_user_name} and email as ${git_user_email}"
# ─── Prompt only if a value is missing ─────────────────────────────
[ -z "$git_user_name" ] && read -rp "Enter FULL NAME for Git: " git_user_name
[ -z "$git_user_email" ] && read -rp "Enter EMAIL for Git: " git_user_email

ssh_location="${HOME}/.ssh/id_ed25519.pub"

# ─── Prompt only for webdev and config ──────────────────────────────────────
read -rp "Install VS Code extensions for webdev? (Y/n) " answer_vscode_web
read -rp "Update VS Code settings/keybindings(won't update if files already present)? (y/N) " answer_vscode_config

install_vscode_web=false
install_vscode_config=false

[[ -z ${answer_vscode_web:-} || ${answer_vscode_web,,} == y ]] && install_vscode_web=true
[[ ${answer_vscode_config,,} == y ]] && install_vscode_config=true

# ─── Interactive prompts ────────────────────────────────────────────────────
read -rp "Do you want to install and set up Fish shell? (Y/n) " answer_fish
read -rp "Do you want to install Neovim? (Y/n) " answer_nvim

install_fish=false
install_nvim=false
[[ -z ${answer_fish:-} || ${answer_fish,,} == y ]] && install_fish=true
[[ -z ${answer_nvim:-} || ${answer_nvim,,} == y ]] && install_nvim=true

# ── SSH key (idempotent) ────────────────────────────────────────
if [[ -f "$ssh_location" ]]; then
  echo "SSH key already exists at $ssh_location"
else
  key_comment=${git_user_email:-$current_email}
  ssh-keygen -t ed25519 -C "$key_comment"
fi

echo
cat "$ssh_location"
echo
echo "Copy the above key to GitHub → Settings → SSH and GPG keys."
read -rp "Press Enter after you’ve added the key… " _

echo "Install VS Code from its website, then press Enter to continue."
read -r _

# ─── Make scripts executable & run the core set ─────────────────────────────
scripts=(
  "apt.sh"
  "folder.sh"
  "$CONFIG_DIR/git.sh"
  "$CONFIG_DIR/vscode.sh"
  "$CONFIG_DIR/gnome.sh"
  "fish.sh"
  "$CONFIG_DIR/nvim.sh"
  "docker.sh"
  "$CONFIG_DIR/wakapi.sh"

  "zen_beta.sh"
)
chmod +x "${scripts[@]}"

./apt.sh
./"$CONFIG_DIR/git.sh" "$git_user_name" "$git_user_email" "n"
./folder.sh
./"$CONFIG_DIR/gnome.sh"

# Always install base VS Code extensions, pass only web/config flags
./"$CONFIG_DIR/vscode.sh" "$install_vscode_web" "$install_vscode_config"

$install_nvim && ./"$CONFIG_DIR/nvim.sh"

if command -v docker &>/dev/null; then
  ./"$CONFIG_DIR"/wakapi.sh
fi

$install_fish && ./fish.sh
echo "Install the GNOME extensions 'Color Picker' and 'Vitals' via Extension Manager."
read -rp "Press Enter when they're installed… " _

echo
echo "✔  Setup complete."
echo "for browsers: install Chrome from its website and run ./zen_beta.sh when ready."
