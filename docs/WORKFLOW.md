# Development workflow — org template

Adapt in each project repository. Aligns with [AI_ORCHESTRATION.md](AI_ORCHESTRATION.md).

---

## Branching

| Branch | Use |
|--------|-----|
| `main` | Production-ready; protected |
| `feature/*` | New work |
| `fix/*` | Bug fixes |
| `docs/*` | Documentation only |

No direct commits to `main` for shared repos unless emergency hotfix (document in activity log).

---

## Phases

### 1. Plan

- Issue or brief written outcome  
- Touch SSOT docs if architecture changes  
- For web: confirm breakpoints; deploy via `isystem-codebase/scripts/scp-*.ps1`

### 2. Implement

- Smallest correct diff  
- Match existing naming, types, and file layout  
- Version CSS/JS with `?v=` when deploying static sites  

### 3. Review

- Self-review diff  
- Security: no secrets, no broad `chmod 777`  
- Web: check mobile + desktop layouts  

### 4. Deploy

- Static: `scp-*.ps1` from private `isystem-codebase/scripts`  
- Post-deploy: hard refresh / cache bust verify  
- Record in project CHANGELOG if maintained  

### 5. Document

- Update README or SSOT when behaviour changes  
- Org templates stay in `.github/docs/`  

---

## Tooling matrix (guidance)

| Task type | Typical approach |
|-----------|------------------|
| Greenfield feature | Plan doc → AI-assisted implementation → human review |
| Bug fix | Repro → root cause → minimal fix → regression check |
| Deploy / infra | Private `isystem-codebase`, nginx in `platform/nginx/`, Cloudflare rules in `docs/` |
| WordPress plugin | PHP in `Wordpress/plugins/`, test on staging WP |
| Firmware | Product repo SSOT; webhook schema unchanged without version bump |

---

## Security workflow

- Pre-commit: no `.env`, keys, or client PII  
- Public excerpts: run [scripts/sanitize-sync.sh](../scripts/sanitize-sync.sh) locally before publishing from private backups  
- Credentials: VPS / GitHub secrets only  

---

## Related

- [ACCESS_CONTROL.md](ACCESS_CONTROL.md)  
- [AI_ACTIVITY_LOG.md](AI_ACTIVITY_LOG.md)  
- [FAQ.md](FAQ.md)
