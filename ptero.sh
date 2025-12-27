#!/usr/bin/env bash
set -Eeuo pipefail

# Colors
RESET='\033[0m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
BOLD='\033[1m'

# Correct URLs
PANEL_URL="https://raw.githubusercontent.com/rasinop/Installer/refs/heads/main/panel.sh"
NODE_URL="https://raw.githubusercontent.com/rasinop/Installer/refs/heads/main/node.sh"

menu() {
  clear
  echo -e "${BLUE}Pterodactyl Installer - AlphaX${RESET}"
  echo "1) Install Panel"
  echo "2) Install Node"
  echo "0) Back to Menu"
  echo -ne "${YELLOW}Select an option: ${RESET}"
}

while true; do
  menu
  read -r choice
  case "$choice" in
    1)
      echo -e "${GREEN}Launching Panel Installer...${RESET}"
      bash <(curl -fsSL "$PANEL_URL")
      read -rp "Press Enter to return to menu..."
      ;;
    2)
      echo -e "${GREEN}Launching Node Installer...${RESET}"
      bash <(curl -fsSL "$NODE_URL")
      read -rp "Press Enter to return to menu..."
      ;;
    0)
      continue
      ;;
    *)
      echo -e "${RED}Invalid option.${RESET}"
      sleep 1
      ;;
  esac
done
