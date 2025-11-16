#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(pwd)"
OUTPUT_DIR="${1:-public-export}"

echo "Sanitizing from: $ROOT_DIR"
echo "Output directory: $OUTPUT_DIR"

# Clean output directory
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# 1. Copy everything except git and output dir
rsync -a . "$OUTPUT_DIR"   --exclude ".git"   --exclude "$OUTPUT_DIR"

cd "$OUTPUT_DIR"

# 2. Remove private/internal directories
rm -rf internal private notes ai-context chat-history prompt-history || true

# 3. Remove sensitive files
find . -type f \(   -name ".env" -o   -name ".env.*" -o   -name "*.pem" -o   -name "*.key" -o   -name "*.crt" \) -print -delete || true

# 4. Strip lines containing sensitive markers and sanitize simple secrets
find . -type f \(   -name "*.js" -o -name "*.ts" -o -name "*.jsx" -o -name "*.tsx" -o   -name "*.json" -o -name "*.md"  -o -name "*.txt"  -o   -name "*.yml"  -o -name "*.yaml" -o -name "*.env" -o   -name "*.css" -o -name "*.html" \) | while read -r file; do
  # Remove lines containing internal markers
  sed -i '/AI:/d' "$file"
  sed -i '/INTERNAL:/d' "$file"
  sed -i '/CONFIDENTIAL/d' "$file"
  sed -i '/PRIVATE PROMPT/d' "$file"
  sed -i '/prompt-history/d' "$file"

  # Remove SANITIZE markers and the lines they annotate
  sed -i '/# SANITIZE/d' "$file"
  sed -i '// SANITIZE/d' "$file"

  # Replace secret patterns with placeholders
  sed -i 's/\(SECRET_KEY[[:space:]]*[:=][[:space:]]*\).*/\1"<YOUR-SECRET-HERE>"/I' "$file"
  sed -i 's/\(API_KEY[[:space:]]*[:=][[:space:]]*\).*/\1"<YOUR-API-KEY-HERE>"/I' "$file"
  sed -i 's/\(TOKEN[[:space:]]*[:=][[:space:]]*\).*/\1"<YOUR-TOKEN-HERE>"/I' "$file"
done

echo "Sanitization completed in: $OUTPUT_DIR"
echo "You can now push $OUTPUT_DIR to the public repository."
