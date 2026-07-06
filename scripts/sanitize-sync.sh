#!/usr/bin/env bash
# Export a sanitized copy of the current tree for public release.
# Requires: bash, rsync, find, sed (GNU sed on Linux — used in GitHub Actions).
# Usage: ./scripts/sanitize-sync.sh [output-dir]
# Default output: ./public-export

set -euo pipefail

ROOT_DIR="$(pwd)"
OUTPUT_DIR="${1:-public-export}"

echo "Sanitizing from: $ROOT_DIR"
echo "Output directory: $OUTPUT_DIR"

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

rsync -a . "$OUTPUT_DIR" \
  --exclude ".git" \
  --exclude "$OUTPUT_DIR" \
  --exclude "node_modules" \
  --exclude "dist" \
  --exclude "build"

cd "$OUTPUT_DIR"

# Remove internal-only directories (if present)
rm -rf internal private notes ai-context chat-history prompt-history .private || true

# Remove secret-like files
find . -type f \( \
  -name ".env" -o \
  -name ".env.*" -o \
  -name "*.pem" -o \
  -name "*.key" -o \
  -name "*.crt" \
\) -print -delete 2>/dev/null || true

# Strip internal markers and redact obvious secret assignments in text files
while IFS= read -r -d '' file; do
  sed -i \
    -e '/AI:/d' \
    -e '/INTERNAL:/d' \
    -e '/CONFIDENTIAL/d' \
    -e '/PRIVATE PROMPT/d' \
    -e '/prompt-history/d' \
    -e '/# SANITIZE/d' \
    -e '/\/\/ SANITIZE/d' \
    -e 's/\(SECRET_KEY[[:space:]]*[:=][[:space:]]*\).*/\1"<REDACTED>"/I' \
    -e 's/\(API_KEY[[:space:]]*[:=][[:space:]]*\).*/\1"<REDACTED>"/I' \
    -e 's/\(TOKEN[[:space:]]*[:=][[:space:]]*\).*/\1"<REDACTED>"/I' \
    "$file"
done < <(find . -type f \( \
  -name "*.js" -o -name "*.ts" -o -name "*.jsx" -o -name "*.tsx" -o \
  -name "*.json" -o -name "*.md"  -o -name "*.txt"  -o \
  -name "*.yml"  -o -name "*.yaml" -o -name "*.env" -o \
  -name "*.css" -o -name "*.html" \
\) -print0)

echo ""
echo "Sanitization completed: $OUTPUT_DIR"
echo "Review the export, then copy or push to the target public repo manually."
