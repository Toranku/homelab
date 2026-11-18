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
