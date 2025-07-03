#!/usr/bin/env bash
set -euo pipefail

install_fnm_for() {
  local target_shell="$1"
  echo "→ Installing fnm for $(basename "$target_shell")"
  # Pass SHELL to the *installer* (right side of the pipe)
  # curl -fsSL https://fnm.vercel.app/install | SHELL="$target_shell" bash
}

# ── 1. Install fnm for any shells that exist ──────────────────────────────────
command -v fish >/dev/null 2>&1 && install_fnm_for "$(command -v fish)"
command -v bash >/dev/null 2>&1 && install_fnm_for "$(command -v bash)"

source $HOME/.bashrc
fnm install --lts
# ── 2. Enable pnpm via Corepack (runs once; survives shell restart) ───────────
corepack enable pnpm
