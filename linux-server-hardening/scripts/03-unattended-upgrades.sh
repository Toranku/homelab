#!/usr/bin/env bash
# Step 3: enable automatic security updates (unattended-upgrades).
set -euo pipefail

sudo apt install -y unattended-upgrades

# Turn on the daily update + upgrade jobs.
sudo tee /etc/apt/apt.conf.d/20auto-upgrades > /dev/null << 'CONF'
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
CONF

sudo systemctl enable --now unattended-upgrades
sudo systemctl status unattended-upgrades --no-pager
