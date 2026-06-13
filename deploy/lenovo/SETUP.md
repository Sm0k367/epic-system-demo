# Lenovo Fresh Install — Setup Notes

## Prerequisites

- Brand new Windows 11 machine (or reset Lenovo Legion / Acer)
- Git for Windows installed
- PowerShell 7+ recommended

## One-Command Bootstrap

```powershell
git clone https://github.com/Sm0k367/epic-system.git $env:USERPROFILE\.openclaw\workspace
cd $env:USERPROFILE\.openclaw\workspace
.\INSTALL LENOVO.bat
```

The installer will:
1. Create the expected folder structure under `.openclaw`
2. Copy the retail/epic-os skeleton
3. Set up the basic launchers (Epic OS.bat, etc.)
4. Configure the public Telegram bot endpoint (read-only mode)

## After Install — Restore Your Personal Context

This is the critical step that turns the retail OS into *your* Epic OS:

1. Copy your personal `OpenClaw/secrets` backup from SMOKE (or your last known good machine)
2. Place it at `%USERPROFILE%\.openclaw\secrets`
3. Run the restore script:
   ```powershell
   .\personal\bootstrap\restore_from_backup.ps1
   ```
4. Launch `CONTINUE SESSION.bat`

## First Heartbeat

Open a terminal and run:
```powershell
cd $env:USERPROFILE\.openclaw\workspace
.\personal\bootstrap\heartbeat.ps1 --verify
```

You should see:
- Profile loaded (your machine name)
- Secrets verified
- Media vault index connected (if you have vault access)
- Telegram bridge status

## Making It Your Daily Driver

- Pin `CONTINUE SESSION.bat` to taskbar / desktop
- (Optional) Add Epic OS :8780 to browser bookmarks bar
- Set the Telegram bot as a favorite / pinned chat

## Future-Proofing

The entire point of this architecture is that you can lose the physical machine and still recover everything on new hardware in under 30 minutes, as long as you have:
- Your GitHub access
- Your personal OpenClaw secrets backup (encrypted, stored safely)
- The public retail repo

Everything else (media, trading history, agent memory) can be pulled back from Git LFS + the vault.

## Common Issues

**"Epic OS won't start on port 8780"**
- Something else is using the port. Change in the launcher or kill the process.

**"Telegram bot says no repo access"**
- You are probably hitting the public bot. Use the private `@epictech_assistant_bot` (SMOKE only).

**"Scripts complain about missing paths"**
- You skipped the restore step. Personal paths only exist after you bring over your secrets + profile.

---

This process has been battle-tested across multiple machines (Acer Predator, Lenovo Legion, and various test VMs).
