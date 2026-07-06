# AI activity log — template

Optional but recommended for **private SSOT repos** and multi-session features.  
Public OSS repos: use CHANGELOG + PR history instead.

---

## When to log

- Multi-hour AI-assisted implementation  
- Security-sensitive changes  
- Client deliverables  
- Deploy / infra changes  

Skip for typo fixes and single-line patches.

---

## Entry format

```yaml
- date: 2026-07-06
  author: Dr. Diodac
  assistant: Cursor Agent
  repo: isystem-deploy
  summary: "Data console Test History column + org docs refresh"
  files:
    - web/imeter.../data.html
    - docs/web-layout-standard.md
  deploy: "scp data.html + imeter-theme.css to VPS"
  status: completed
```

Plain markdown bullets are fine if YAML feels heavy.

---

## Activity types

| Type | Example |
|------|---------|
| `plan` | Architecture note, SSOT draft |
| `implement` | Feature or fix merged |
| `review` | Security or code review pass |
| `deploy` | VPS / Cloudflare / nginx |
| `docs` | README, wiki, standards |

---

## Project file location

Create `AI_ACTIVITY_LOG.md` at repo root (private projects) or append to `CHANGELOG.md` (public).

Do **not** log secrets, tokens, or client PII.

---

## Related

- [AI_ORCHESTRATION.md](AI_ORCHESTRATION.md)  
- [WORKFLOW.md](WORKFLOW.md)
