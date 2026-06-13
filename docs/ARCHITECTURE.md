# Architecture — Personal vs Retail

## The Core Idea

One human (SMOKE) runs a powerful personal operating system that is deeply integrated with his life, machines, media, and trading.

At the same time, a clean, safe, installable version of that OS is offered to the world as a product.

These two layers must **never leak** into each other.

## Directory Contract

```
epic-system/
├── personal/          ← SMOKE only. Full power. Full secrets.
│   ├── scripts/
│   ├── bootstrap/
│   ├── skills/
│   ├── btc_epictechai_desk/
│   └── epictech_ecosystem/
├── retail/            ← Everyone else. Sanitized. Safe.
│   └── epic-os/
├── media/vault/       ← Real files on Git LFS (personal only)
├── docs/              ← This file lives here
└── deploy/            ← Machine bootstrap notes
```

## On SMOKE (the live machine)

The actual working directory is:
`%USERPROFILE%\.openclaw\workspace`

This directory contains **exactly** the contents of `personal/` from the repo (symlinked or copied via the bootstrap process). Paths inside scripts are written against this location so that Epic OS keeps working after every sync.

## Sync Discipline (non-negotiable)

- All code changes are pushed using `personal/scripts/repo_sync.ps1`
- This script **explicitly excludes**:
  - Anything containing tokens, keys, or .env
  - MEMORY.md / SESSION.md
  - media/ binaries (they go through Git LFS + separate vault script)
  - Any path containing "smoke", "acer", personal names, etc.

- After a successful push, the personal machine can run `media_vault.py prune-local` to free disk space.

## Continuity & Heartbeat

`personal/bootstrap/heartbeat.sh` (and its Windows equivalent) runs every 3 seconds.

It verifies:
- Machine profile is healthy
- OpenClaw secrets are present and valid
- Media vault index is in sync
- Agents are responsive

If anything is wrong, it surfaces immediately in the Telegram bot and in the Epic OS web shell.

This is what makes the entire system future-proof and recoverable on new hardware.

## Telegram Boundary

- `@epictech_assistant_bot` — private, full repo + machine access. SMOKE only.
- `@epictech_public_bot` — public funnel. Can only do safe, read-only or explicitly allowed retail actions.

## Media Vault

Every stitch / generate / render automatically uploads to `media/vault/` (Git LFS) and prints a clickable GitHub link.

The vault script also supports `prune-local` after push.

## The Retail Promise

If someone installs the retail version on a brand new Lenovo using `INSTALL LENOVO.bat`, they should get a working Epic OS that feels powerful and coherent — without ever seeing a single personal path, secret, or inside joke from SMOKE's life.

The retail product is the distilled essence. The personal layer is the full living system.
