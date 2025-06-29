#!/usr/bin/env bash
mkdir -p "$HOME/code" "$HOME/git" "$HOME/Documents/obsidian/" "$HOME/test"

clone_if_missing() {
  local repo=$1 dest=$2
  [[ -d $dest ]] || git clone "$repo" "$dest"
}

clone_if_missing git@github.com:abhitrueprogrammer/notes_nik.git "$HOME/Documents/obsidian/notes_nik"
clone_if_missing git@github.com:abhitrueprogrammer/spidy-novel.git "$HOME/Documents/obsidian/spidy-novel"
clone_if_missing git@github.com:abhitrueprogrammer/dotfiles-ubuntu.git "$HOME/dotfiles-ubuntu"
