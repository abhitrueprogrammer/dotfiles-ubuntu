#!/bin/bash
CONFIG_DIR="app_config"
scripts="apt.sh ./$CONFIG_DIR/git.sh ./$CONFIG_DIR/vscode.sh ./$CONFIG_DIR/gnome.sh fish.sh docker.sh zen_beta.sh ./$CONFIG_DIR/git.sh"
chmod +x $scripts
./$CONFIG_DIR/gnome.sh
./apt.sh
./$CONFIG_DIR/git.sh
# Installing chrome and github
echo "Install chrome and vscode from their respective websites."
echo "Press enter when done..."

read
./$CONFIG_DIR/vscode.sh

echo "Install 'color picker' and 'vitals' via extension manager"
echo "Press enter when done..."
read

echo "Do you want to install and setup fish? (Y/n)"
read
if [ "$input" == "y" ] || [ "$input" == "Y" ] || [ -z "$input" ]; then
  ./fish.sh
else
  echo "Skipping installation of fish."
fi

if command -v docker &>/dev/null; then
  echo "Do you want to install wakapi?"
  if [ "$input" == "y" ] || [ "$input" == "Y" ] || [ -z "$input" ]; then
    ./wakapi.sh
  else
    echo "Skipping installation of wakapi."
  fi
fi
echo "Setup complete. Install zen using ./zen_beta.sh"
