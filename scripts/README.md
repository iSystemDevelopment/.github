# Scripts

Optional utilities for org maintainers. **Not run automatically** — no CI workflow is wired to these scripts in `.github`.

## `sanitize-sync.sh`

Creates a **local export folder** safe to review before publishing excerpts from a private backup.

```bash
# From repo root (Linux, WSL, or Git Bash on Windows):
chmod +x scripts/sanitize-sync.sh
./scripts/sanitize-sync.sh public-export
```

**What it does:**

1. `rsync` copy excluding `.git`, `node_modules`, build dirs  
2. Deletes `internal/`, `private/`, `.private/`, etc.  
3. Deletes `.env`, `*.pem`, `*.key`, `*.crt`  
4. Strips lines with `INTERNAL:`, `CONFIDENTIAL`, `SANITIZE` markers  
5. Redacts `SECRET_KEY`, `API_KEY`, `TOKEN` assignments to placeholders  

**After running:** inspect `public-export/`, then commit to the target public repo yourself. Never push private trees directly.

**Platform:** GNU `sed -i` (Linux / GitHub Actions). On macOS use WSL or adjust `sed` flags.

## Removed (2026 cleanup)

- `workflows/sanitize-and-sync.yml` — automated push to `smart-inventory-builder` (repos deleted; backup is local only).
