#!/usr/bin/env bash
mkdir -p "$HOME/code" "$HOME/git" "$HOME/Documents/Cloud"

clone_if_missing() {
  local repo=$1 dest=$2
  [[ -d $dest ]] || git clone "$repo" "$dest"
}

clone_if_missing git@github.com:abhitrueprogrammer/notes_nik.git "$HOME/Documents/Cloud/notes_nik"
clone_if_missing git@github.com:abhitrueprogrammer/spidy-novel.git "$HOME/Documents/Cloud/spidy-novel"
