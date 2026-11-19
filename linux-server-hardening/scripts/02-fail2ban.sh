#!/usr/bin/env bash
# Step 2: install fail2ban and enable the sshd jail.
# Ban an IP for 1 hour after 5 failed logins within 10 minutes.
set -euo pipefail

sudo apt install -y fail2ban

sudo tee /etc/fail2ban/jail.local > /dev/null << 'CONF'
[DEFAULT]
bantime  = 1h
findtime = 10m
maxretry = 5

[sshd]
enabled = true
backend = systemd
CONF

sudo systemctl enable --now fail2ban
sudo systemctl restart fail2ban
sudo fail2ban-client status sshd
