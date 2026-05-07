#!/bin/bash
# ─────────────────────────────────────────────────────────────
#  Aleck the Renovator — Push to GitHub & deploy via Netlify
#  Run this in Git Bash: right-click project folder → Git Bash Here
# ─────────────────────────────────────────────────────────────

set -e
cd "$(dirname "$0")"

# Remove stale lock files (safe to ignore if not present)
rm -f .git/config.lock .git/index.lock 2>/dev/null || true

git init -b main
git config user.email "hauptcc@gmail.com"
git config user.name "hauptcc-svg"

git add -A
git diff --cached --quiet && echo "(Nothing new to commit — already up to date)" || git commit -m "Update site $(date '+%Y-%m-%d %H:%M')"

git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/hauptcc-svg/aleck-the-renovator.git
git push -u origin main --force

echo ""
echo "✓ Pushed to GitHub."
echo "  Netlify will auto-deploy in ~30 seconds."
echo "  Admin panel will be at: https://YOUR-SITE.netlify.app/admin"
