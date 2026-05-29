#!/bin/bash
# ════════════════════════════════════════════════════════════════════════════
# SHIP.sh — One button to update the live art-basel pieces.
# Usage: open Terminal, paste this whole line, hit Enter:
#
#   bash ~/art-basel-deploy/SHIP.sh
#
# What it does:
#   1. Syncs the latest versions from your hhg_cortex_v1 repo
#   2. Pushes to GitHub (which auto-rebuilds GitHub Pages within ~30s)
#   3. The live URL stays the same — Figma Sites picks up the new version
# ════════════════════════════════════════════════════════════════════════════

set -e
cd ~/art-basel-deploy

echo ""
echo "🎨 Syncing latest art from your repo..."
cp ~/hhg_cortex_v1/playground/jacob/art-basel-wireframe-portrait/pass-12-fused-xray.html index.html
cp ~/hhg_cortex_v1/playground/jacob/art-basel-wireframe-portrait/pass-10-final-embed.html wireframe.html
cp ~/hhg_cortex_v1/playground/jacob/art-basel-wireframe-portrait/pass-11-skeleton-variant.html skeleton.html
echo "   ✓ index.html (Profile, Through — main)"
echo "   ✓ wireframe.html (Profile, in Wireframe)"
echo "   ✓ skeleton.html (Profile, in Skeleton)"

# Check if anything actually changed
if git diff --quiet && git diff --cached --quiet; then
  echo ""
  echo "ℹ️  No changes — local already matches what's live."
  exit 0
fi

echo ""
echo "📤 Pushing to GitHub..."
git add -A
git -c commit.gpgsign=false -c user.email=jacob@haegghaegg.se -c user.name="Jacob Hägg" commit -q -m "Update: refreshed from playground/jacob/art-basel-wireframe-portrait/"
git push -q origin main

echo ""
echo "✅ Pushed. GitHub Pages rebuilds in ~30 seconds."
echo "    Live at: https://lepetittruffier.github.io/profile-through/"
echo "    Refresh Figma Sites preview to see the new version."
echo ""
