#!/bin/bash
# Deployment script for dtslib.com to gh-pages branch
# This script must be run manually by the repository owner with proper credentials

set -e

echo "=== DTSLIB.COM Deployment to gh-pages ==="
echo ""

# Ensure we're in the repo root
cd "$(dirname "$0")"

echo "Step 1: Verifying dist folder exists..."
if [ ! -d "dist" ]; then
    echo "ERROR: dist folder not found. Please run 'npm run build' first."
    exit 1
fi

echo "Step 2: Verifying CNAME in dist..."
if [ ! -f "dist/CNAME" ]; then
    echo "ERROR: dist/CNAME not found."
    exit 1
fi

CNAME_CONTENT=$(cat dist/CNAME)
if [ "$CNAME_CONTENT" != "dtslib.com" ]; then
    echo "ERROR: CNAME contains '$CNAME_CONTENT' but should contain 'dtslib.com'"
    exit 1
fi
echo "✓ CNAME is correct: $CNAME_CONTENT"

echo ""
echo "Step 3: Deploying to gh-pages branch..."
echo "Running: git subtree push --prefix dist origin gh-pages"
echo ""

git subtree push --prefix dist origin gh-pages

echo ""
echo "=== Deployment Complete ==="
echo ""
echo "Next steps:"
echo "1. Go to GitHub repository Settings → Pages"
echo "2. Set Source to 'gh-pages' branch"
echo "3. Set Folder to '/ (root)'"
echo "4. Set Custom domain to 'dtslib.com'"
echo "5. Enable 'Enforce HTTPS'"
echo ""
echo "Verification URLs:"
echo "- https://dtslib.com"
echo "- https://dtslib1979.github.io/dtslib.com/"
