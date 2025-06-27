#!/usr/bin/env bash
set -euo pipefail

install_web=${1:-true}
install_config=${2:-false}

# Always install these
base_extensions=(
  ms-python.python
  ms-vscode.cpptools-extension-pack
  IgorSbitnev.error-gutters
  eamodio.gitlens
  esbenp.prettier-vscode
  streetsidesoftware.code-spell-checker
  agutierrezr.emmet-keybindings
  GitHub.copilot
)

web_extensions=(
  agutierrezr.emmet-keybindings
  dsznajder.es7-react-js-snippets
  bradlc.vscode-tailwindcss
  SimonSiefke.svg-preview
  dbaeumer.vscode-eslint
)

echo "🔧 Installing base VS Code extensions..."
for ext in "${base_extensions[@]}"; do
  code --install-extension "$ext"
done

if $install_web; then
  echo "🌐 Installing webdev VS Code extensions..."
  for ext in "${web_extensions[@]}"; do
    code --install-extension "$ext"
  done
fi

if $install_config; then
  echo "⚙️ Updating VS Code settings and keybindings..."
  VSCODE_USER_SETTINGS_DIR="${HOME}/.config/Code/User"

  if [[ -d "$VSCODE_USER_SETTINGS_DIR" ]]; then
    cp -n "./settings/VSCodeSettings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json"
    cp -n "./settings/VSCode-Keybindings.json" "${VSCODE_USER_SETTINGS_DIR}/keybindings.json"
  else
    echo "❌ VS Code settings directory not found. Is VS Code installed?"
  fi
else
  echo "⏭ Skipping VS Code settings/keybindings update."
fi
