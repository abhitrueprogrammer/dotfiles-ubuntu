curl -L https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz -o zen.tar.xz
tar -xf zen.tar.xz -C ~
rm zen.tar.xz

mv ./settings/zen.desktop ~/.local/share/applications/zen.desktop
