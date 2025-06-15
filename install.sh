#!/bin/bash
scripts="apt.sh github.sh vscode.sh gnome.sh fish.sh setup_fish.sh docker.sh zen_beta.sh"
chmod +x $scripts
./gnome.sh
./apt.sh
./github.sh
# Installing chrome and github
echo "Install chrome and vscode from their respective websites."
echo "Press enter when done..."

read
./vscode.sh

echo "Install 'color picker' and 'vitals' via extension manager"
echo "Press enter when done..."
read
echo "Do you want to install and setup fish? (Y/n)"
if [ "$input" == "y" ] || [ "$input" == "Y" ] || [ -z "$input" ]; then
  ./fish.sh
else
  echo "Skipping installation of fish."
fi

echo "Do you want to install and setup docker? (Y/n)"
if [ "$input" == "y" ] || [ "$input" == "Y" ] || [ -z "$input" ]; then
  ./docker.sh
else
  echo "Skipping installation of docker."
fi
echo "Setup complete. Run zen using ./zen_beta.sh"
