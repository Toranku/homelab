#!/usr/bin/env bash
# Step 1: enable the ufw firewall, allowing only SSH.
# Order matters: allow SSH BEFORE enabling, or remote access is cut off.
set -euo pipefail

sudo ufw allow OpenSSH
sudo ufw --force enable
sudo ufw status verbose
