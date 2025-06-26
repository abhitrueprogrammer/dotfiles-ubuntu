#!/usr/bin/env fish

echo "setting fish as default..."
set fish_path (command -s fish)
chsh -s $fish_path
echo "setting default greeting"
function fish_greeting
    echo "hello abhitruechamp"
    fortune -a -s
end

funcsave fish_greeting

