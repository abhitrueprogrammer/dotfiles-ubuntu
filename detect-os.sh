#!/usr/bin/env bash
# detect-distro

raw_distro=$(lsb_release -si | tr '[:upper:]' '[:lower:]')

case "$raw_distro" in
ubuntu)
  echo "ubuntu"
  ;;
linuxmint | "linux mint" | mint)
  echo "mint"
  ;;
*)
  echo "$raw_distro"
  ;;
esac
