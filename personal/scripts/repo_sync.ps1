# Epic System — Git Sync Rules

This script is the **only** approved way to push code from SMOKE to the public repo.

## What it does

- Stages only safe, non-secret files
- Automatically excludes anything that looks personal:
  - Paths containing "smoke", "acer", personal names
  - .env, tokens, keys, credentials
  - MEMORY.md and SESSION.md
  - Any file under media/ (those go through LFS + media_vault.py)
- Commits with a clean, consistent message format
- Pushes

## Usage (always)

```powershell
pwsh -File personal/scripts/repo_sync.ps1
```

Or the short alias that most people on SMOKE have in their PowerShell profile:
```powershell
sync-epic
```

## After a successful sync

You can safely run on the personal machine:
```powershell
python personal/scripts/media_vault.py prune-local
```

This removes local copies of files that are now safely stored in Git LFS on GitHub, freeing tens of gigabytes on SMOKE.

## Why this exists

Without this discipline, it would be far too easy to accidentally commit a token, a personal path, or a raw video file. One leak and the entire personal/retail separation collapses.

The script is intentionally loud when it skips things. If you ever see it skipping more than you expected, stop and investigate before forcing a push.
