#!/bin/bash

# Correct array assignment (no spaces around `=`)
extensions=(
  # language extensions
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

# Install extensions for general usage
for extension in "${extensions[@]}"; do
  code --install-extension "$extension"
done

# Ask the user if they want to install webdev extensions
read -p "Do you want to install vscode extensions for webdev? (Y/n): " input

# If the user types 'y', 'Y', or presses Enter, install webdev extensions
if [ "$input" == "y" ] || [ "$input" == "Y" ] || [ -z "$input" ]; then
  for web_extension in "${web_extensions[@]}"; do
    code --install-extension "$web_extension"
  done
else
  echo "Not installing web-extensions."
fi

read -p "Do you want to update vscode settings? (y/N)" input
# Hard yes only words
if [ "$input" == "y" ] || [ "$input" == "Y" ]; then
  # Define the target directory for VS Code user settings on macOS
  VSCODE_USER_SETTINGS_DIR="${HOME}/.config/Code/User"

  # Check if VS Code settings directory exists
  if [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then
    # Copy your custom settings.json and keybindings.json to the VS Code settings directory
    cp -i "./settings/VSCodeSettings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json"
    # ln -sf "${HOME}/dotfiles/settings/VSCode-Keybindings.json" "${VSCODE_USER_SETTINGS_DIR}/keybindings.json"
  else
    echo "VS Code user settings directory does not exist. Please ensure VS Code is installed."
  fi
else
  echo "skipping copying settings.json."
fi
