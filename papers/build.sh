#!/usr/bin/env bash
# Build the whitepapers site from markdown sources
# Usage: ./build.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "Building whitepapers site..."

# Build OaP paper
echo "  → Converting OaP paper..."
pandoc oap/opacity_as_policy.md \
  --template=template.html \
  --toc \
  --toc-depth=3 \
  --standalone \
  --metadata title="Opacity as Policy: Static Undecidability as a Security Primitive for Agentic Shell Execution" \
  --variable css-path="../style.css" \
  -o oap/index.html

echo "  → Done: oap/index.html"
echo "Build complete."
