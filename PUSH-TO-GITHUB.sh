#!/usr/bin/env bash
# PUSH-TO-GITHUB.sh
# Run this on your LOCAL machine (the real SMOKE machine) where you are authenticated as github.com/Sm0k367
#
# This will create the public demo repo and push everything.

set -e

REPO_NAME="epic-system-demo"
DESCRIPTION="Live public demo of Epic System — Home base for Epic Tech AI personal OS (SMOKE). Sanitized, interactive, production-grade."

echo "==> Ensuring you're in the demo directory..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [ ! -f "index.html" ]; then
  echo "ERROR: index.html not found. Are you in the epic-system-demo folder?"
  exit 1
fi

echo "==> Current git status:"
git status --short

echo ""
echo "==> Target: https://github.com/Sm0k367/${REPO_NAME}"
echo "==> This will create the repo (if needed) and push the demo."
echo ""
read -p "Press Enter to continue (or Ctrl-C to abort)..."

# Try to create via gh (best path)
if command -v gh >/dev/null 2>&1; then
  echo ""
  echo "==> Checking gh auth..."
  if gh auth status >/dev/null 2>&1; then
    echo "==> Creating public repo via gh CLI..."
    gh repo create "Sm0k367/${REPO_NAME}" \
      --public \
      --source=. \
      --remote=origin \
      --description "$DESCRIPTION" \
      --push 2>&1 || echo "Note: gh create returned non-zero (repo may already exist or remote was added)."
  else
    echo "==> gh is installed but you are not logged in."
    echo "    Run: gh auth login   (choose GitHub.com + SSH or HTTPS)"
    echo "    Then re-run this script."
    echo ""
  fi
else
  echo "==> gh CLI not found. Will add remote manually."
fi

# Ensure remote exists
if ! git remote | grep -q '^origin$'; then
  echo "==> Adding origin remote..."
  git remote add origin "git@github.com:Sm0k367/${REPO_NAME}.git" 2>/dev/null || \
  git remote add origin "https://github.com/Sm0k367/${REPO_NAME}.git"
fi

echo "==> Setting branch to main and pushing..."
git branch -M main
git push -u origin main

echo ""
echo "✅ SUCCESS!"
echo ""
echo "   Repo:   https://github.com/Sm0k367/${REPO_NAME}"
echo "   Demo:   Open index.html directly, or enable GitHub Pages for"
echo "           https://sm0k367.github.io/${REPO_NAME}/"
echo ""
echo "Next (recommended):"
echo "  1. Go to the repo → Settings → Pages"
echo "  2. Source = main branch / root"
echo "  3. Save → your live demo will be at the URL above in ~1 minute"
echo ""
echo "Everything is self-contained. No build step required."
