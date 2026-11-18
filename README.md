# homelab
A repo for learning sysadmin/DevOps. Documentation what I build and what I learn here.

## Journal
### 2026-11-18: Trying VM
- Installed VirtualBox and Ubuntu Server 26.04 LTS
- Configured port forwarding 2222 → 22 and connected over SSH from PowerShell
- **Problem:** SSH returned "connection refused".
  **Cause:** Ran the ssh command inside the VM instead of on the Windows host, and the port forwarding rule was missing.
  **Fix:** Added the NAT port forwarding rule in VirtualBox and ran ssh from PowerShell on the host.
- Set up Git on the VM and authenticated to GitHub with an ed25519 SSH key
