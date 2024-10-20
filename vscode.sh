#!/bin/bash

# Correct array assignment (no spaces around `=`)
extensions=(
  ms-vscode.cpptools-extension-pack
  IgorSbitnev.error-gutters
  eamodio.gitlens
  esbenp.prettier-vscode 
  ms-python.python
  agutierrezr.emmet-keybindings
)

web_extensions=(
  agutierrezr.emmet-keybindings 
  dsznajder.es7-react-js-snippets
  bradlc.vscode-tailwindcss
)

# Install extensions for general usage
for extension in "${extensions[@]}"; do
  code --install-extension "$extension"
done

# Ask the user if they want to install webdev extensions
read -p "Do you want to install vscode extensions for webdev? (y/n): " input

# If the user types 'y', 'Y', or presses Enter, install webdev extensions
if [ "$input" == "y" ] || [ "$input" == "Y" ] || [ -z "$input" ]; then
  for web_extension in "${web_extensions[@]}"; do
    code --install-extension "$web_extension"
  done
else
  echo "Not installing web-extensions."
fi
