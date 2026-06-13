# Epic System — Live Demo

**🚀 This is the public, sanitized, interactive demo** of the private repository:  
https://github.com/Sm0k367/epic-system

> **To publish this right now** (on your real SMOKE machine that is logged into GitHub as Sm0k367):
> ```bash
> cd /path/to/this/folder
> ./PUSH-TO-GITHUB.sh
> ```
> Or do it manually (see instructions below).

---

**Live hosted version (once published):** https://sm0k367.github.io/epic-system-demo/  
**Source:** https://github.com/Sm0k367/epic-system-demo

---

**This is a public, sanitized, interactive demo** of the private repository:  
https://github.com/Sm0k367/epic-system

## What this demo shows

- The **personal stack** that runs on SMOKE (Acer)
- The **retail product** (Epic OS) for the rest of the ecosystem
- Continuity / heartbeat system
- Media vault behavior
- One-click launchers and safe sync rules
- Personal vs Retail boundary

## How the real system works on SMOKE

```powershell
# Primary launcher
Double-click "CONTINUE SESSION.bat" on Desktop

# Opens:
# - SESSION.md (current context + open loops)
# - Epic OS web shell at http://127.0.0.1:8780
# - Telegram bridge (@epictech_assistant_bot — full repo access)

# Safe GitHub sync (always use this)
pwsh -File personal/scripts/repo_sync.ps1
```

## Fresh machine (Lenovo / Acer)

```powershell
git clone https://github.com/Sm0k367/epic-system.git $env:USERPROFILE\.openclaw\workspace
cd $env:USERPROFILE\.openclaw\workspace
.\INSTALL LENOVO.bat
# Then restore OpenClaw secrets from your personal backup
```

## Rules that keep everything working

- Never commit tokens, .env, MEMORY.md, or any media binaries
- Always push via `repo_sync.ps1`
- Epic OS must continue to work on SMOKE after every sync

## This demo

Everything here is faithful to the real system but contains **no secrets** and is safe to share publicly. The real media vault (312+ files) lives in the private repo under Git LFS.

---

## 🚀 Publishing to GitHub (recommended)

### Easiest (one command on your real SMOKE machine)

```bash
# 1. Copy this entire folder to your real machine (or git clone the private epic-system and copy the demo subfolder)
# 2. On SMOKE (where `gh auth login` has already been done as Sm0k367):
cd /path/to/epic-system-demo
./PUSH-TO-GITHUB.sh
```

The script will:
- Create the public repo `Sm0k367/epic-system-demo`
- Add the remote
- Push everything (including the self-contained `index.html`)

### Manual steps (if you prefer)

1. Go to https://github.com/new
2. Repository name: `epic-system-demo`
3. Public
4. **Do NOT** initialize with README (we already have one)
5. Create repository

6. On your machine:

```bash
cd /path/to/epic-system-demo
git remote add origin git@github.com:Sm0k367/epic-system-demo.git
# or if you prefer HTTPS:
# git remote add origin https://github.com/Sm0k367/epic-system-demo.git

git branch -M main
git push -u origin main
```

### Enable instant live hosting (GitHub Pages)

After the push:

1. Go to the new repo → **Settings** → **Pages**
2. Source: **Deploy from a branch**
3. Branch: `main` / root
4. Save

Your demo will be live at:  
**https://sm0k367.github.io/epic-system-demo/**

(Already prepared with `.nojekyll` so the single-file demo works perfectly.)

---

**Built for one human. Designed to last.**
