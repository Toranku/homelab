# homelab
A repo for learning sysadmin/DevOps. Documentation what I build and what I learn here.

## Projects
| Project | Status | What it covers |
|---|---|---|
| [linux-server-hardening](linux-server-hardening/) | In progress | ufw, fail2ban, automatic updates, SSH key-only login |

## Planned
Bash scripts, Ansible, Docker Compose, GitHub Actions, Terraform, monitoring (Prometheus/Grafana), k3s, Windows Active Directory lab.

## Journal
### 2026-11-18: Trying VM
- Installed VirtualBox and Ubuntu Server 26.04 LTS
- Configured port forwarding 2222 → 22 and connected over SSH from PowerShell
- **Problem:** SSH returned "connection refused".
  **Cause:** Ran the ssh command inside the VM instead of on the Windows host, and the port forwarding rule was missing.
  **Fix:** Added the NAT port forwarding rule in VirtualBox and ran ssh from PowerShell on the host.
- Set up Git on the VM and authenticated to GitHub with an ed25519 SSH key

### 2026-11-19: Server hardening started
- Created the `linux-server-hardening` project with scripts, evidence and a `verify.sh` check script
- Done: ufw firewall, fail2ban, unattended-upgrades
- **Problem:** my README and evidence files ended up in the wrong place (typos in paths and a missing folder).
  **Fix:** checked `git status` before each commit and used tab completion for paths.
