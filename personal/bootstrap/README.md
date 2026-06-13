# Heartbeat + Continuity

This is the soul of the entire system.

## What it does

Every 3 seconds (on SMOKE), a small daemon runs and verifies that the world is still coherent:

- Correct machine profile is loaded (acer.json vs lenovo.json)
- OpenClaw secrets directory exists and has the expected files
- Media vault index is in sync with GitHub LFS
- All critical agents respond to a simple ping
- No unexpected path drift has occurred

## Why it matters

If you ever have to recover on a brand new machine, this heartbeat system + the restore script is what guarantees you can be back to full power in minutes instead of days of detective work.

## Manual trigger (demo)

In the live demo you can press the "Trigger manual heartbeat" button. In the real system on SMOKE you would run:

```powershell
& "$env:USERPROFILE\.openclaw\workspace\personal\bootstrap\heartbeat.ps1" --full
```

## Output example

```
[HEARTBEAT] 2026-06-13 01:19:47
Profile: SMOKE (Acer Predator)
Secrets: OK (17 files)
Vault: 312 files indexed, 0 drift
Agents: epic-os (healthy), trading (healthy), media (healthy)
Continuity: GREEN
Next beat: 3s
```

If anything turns red, the Telegram bot immediately messages SMOKE with the exact failure and suggested recovery steps.

This is future-proofing made real.
