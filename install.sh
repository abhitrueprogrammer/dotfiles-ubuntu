#!/bin/bash
scripts="apt.sh github.sh vscode.sh gnome.sh"
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
echo "Setup complete"