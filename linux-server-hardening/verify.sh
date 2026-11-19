#!/usr/bin/env bash
# Checks that the hardening steps applied so far are in place.
set -u

pass() { echo "PASS: $1"; }
fail() { echo "FAIL: $1"; }

ufw_status="$(sudo ufw status verbose)"

echo "$ufw_status" | grep -q "Status: active" \
  && pass "ufw is active" || fail "ufw is not active"

echo "$ufw_status" | grep -q "deny (incoming)" \
  && pass "default policy denies incoming traffic" || fail "default incoming policy is not deny"

echo "$ufw_status" | grep -q "22/tcp.*ALLOW IN" \
  && pass "SSH (22/tcp) is allowed" || fail "SSH is not allowed"

sudo systemctl is-active --quiet fail2ban \
  && pass "fail2ban service is running" || fail "fail2ban service is not running"

sudo fail2ban-client status sshd > /dev/null 2>&1 \
  && pass "fail2ban sshd jail is enabled" || fail "fail2ban sshd jail is not enabled"
