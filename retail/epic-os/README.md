# retail/epic-os — The Public Product

This is the sanitized, installable version of Epic OS for everyone else.

## What is included

- Clean folder structure (no SMOKE paths, no secrets)
- Core scripts and templates
- Public Telegram funnel bot (@epictech_public_bot)
- Full documentation for fresh installs
- One-click bootstrap for new machines (INSTALL LENOVO.bat, install.ps1)

## What is deliberately excluded

- All personal paths and machine profiles
- Any secrets or tokens
- Private media projects (Neon Saga, full desk)
- The private full-access Telegram bot

## Installation on a brand new machine

See `deploy/lenovo/SETUP.md` for the exact steps.

After cloning:

```powershell
.\INSTALL LENOVO.bat
```

Then restore your personal OpenClaw backup (from SMOKE).

## Philosophy

The retail product must be **future-proof** and **recoverable** even if the original creator disappears. Everything personal stays in `personal/`. The retail layer is the gift to the ecosystem.
