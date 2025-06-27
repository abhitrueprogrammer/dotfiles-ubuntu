#!/usr/bin/env bash

target_dir="$HOME/git/wakapi"

# 1) Clone once ──────────────────────────────────────────────────────────
git clone git@github.com:muety/wakapi.git "$target_dir"

# 2) .env setup ───────────────────────────────────────────────────────────
if [[ -f "$target_dir/.env" ]]; then
  echo ".env already exists – keeping it."
else
  read -rp "Enter a secret (used for WAKAPI_PASSWORD_SALT, WAKAPI_DB_PASSWORD, WAKAPI_MAIL_SMTP_PASS): " secret
  cat <<EOF >"$target_dir/.env"
WAKAPI_PASSWORD_SALT=$secret
WAKAPI_DB_PASSWORD=$secret
WAKAPI_MAIL_SMTP_PASS=$secret
EOF
  echo ".env created at $target_dir/.env"
fi

# 3) Start via docker compose ────────────────────────────────────────────
sudo docker compose --project-directory "$target_dir" up -d
