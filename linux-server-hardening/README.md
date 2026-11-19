# Linux server hardening
Step-by-step hardening of a fresh Ubuntu Server VM

## Steps
### 1. Firewall (ufw)
**Goal:** Block all incoming traffic except SSH.

```bash
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status verbose
```

**Result:** default policy is deny (incoming) / allow (outgoing), only SSH (22/tcp) is allowed.

**Verification:** opened a second SSH session before closing the first one.

**Notes:** allow SSH before enabling ufw, otherwise can lock yourself out.

### 2. fail2ban
**Goal:** block IPs that repeatedly fail SSH logins (brute-force protection).

**Script:** [scripts/02-fail2ban.sh](scripts/02-fail2ban.sh)

**Result:** sshd jail enabled. 5 failed logins within 10 minutes = 1 hour ban.

**Verification:** [evidence/02-fail2ban-status.txt](evidence/02-fail2ban-status.txt), [evidence/02-verify-output.txt](evidence/02-verify-output.txt)
