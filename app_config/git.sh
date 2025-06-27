#!/usr/bin/env bash
#set -euo pipefail   # Uncomment for strict error handling

ssh_location="${HOME}/.ssh/id_ed25519.pub"

git_user_name="${1:-}" # Optional positional arg
git_user_email="${2:-}"

# ── Git user.name ───────────────────────────────────────────────
current_name=$(git config --global --get user.name || true)

if [[ -z $current_name || $current_name != "$git_user_name" ]]; then
  [[ -z $git_user_name ]] &&
    read -rp "Enter FULL NAME for Git: " git_user_name

  git config --global user.name "$git_user_name"
  echo "Git user.name set to '$git_user_name'"
else
  echo "Git user.name already set to '$current_name' — skipping."
fi

# ── Git user.email ──────────────────────────────────────────────
current_email=$(git config --global --get user.email || true)

if [[ -z $current_email || $current_email != "$git_user_email" ]]; then
  [[ -z $git_user_email ]] &&
    read -rp "Enter EMAIL for Git: " git_user_email

  git config --global user.email "$git_user_email"
  echo "Git user.email set to '$git_user_email'"
else
  echo "Git user.email already set to '$current_email' — skipping."
fi

# ── Default branch name ─────────────────────────────────────────
git config --global init.defaultBranch main

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
