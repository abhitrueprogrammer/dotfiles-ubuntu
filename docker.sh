#!/bin/bash

# Check if Docker is installed
if ! command -v docker &>/dev/null; then
  echo "Docker not found. Installing Docker..."
  curl -fsSL https://get.docker.com | bash
else
  echo "Docker is already installed. Skipping installation."
fi
