#!/bin/bash
# ════════════════════════════════════════════════════════════════════════════
# SHIP.sh — One button to publish the art-basel pieces to the web.
# Usage: open Terminal, paste this whole line, hit Enter:
#
#   bash ~/art-basel-deploy/SHIP.sh
#
# What it does:
#   1. Syncs the latest versions from your hhg_cortex_v1 repo into this folder
#   2. Logs you into Vercel if it's your first time (browser opens once)
#   3. Deploys the three pieces to the web
#   4. Prints the live URL — copy that into Figma Sites as an iframe
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

echo ""
echo "🚀 Deploying to Vercel..."
echo "   (If this is your first time, a browser tab will open — just sign in"
echo "    with whatever you prefer: GitHub, Google, or email)"
echo ""

vercel --prod --yes

echo ""
echo "✅ DONE. Your live URL is printed above (look for the 'Production:' line)."
echo "   Copy that URL — paste it into Figma Sites as an iframe to embed."
echo ""
