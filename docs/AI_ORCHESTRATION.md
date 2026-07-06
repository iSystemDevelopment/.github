# AI orchestration — org standard

How we use AI assistants **without** replacing human judgment. Copy and adapt per project repo.

---

## Roles

| Role | Owner | Responsibility |
|------|--------|----------------|
| **Lead / architect** | Dr. Diodac | Scope, architecture, merge approval, client comms |
| **Implementer** | Developer + AI agent | Code, tests, focused diffs |
| **Reviewer** | Human (+ optional AI review) | Correctness, security, style |
| **Documenter** | Developer + AI | README, SSOT, changelogs |

AI tools (Cursor, Claude, ChatGPT, Copilot, etc.) are **interchangeable implementers** — assign by task, not by brand loyalty.

---

## Session workflow

```
1. Define outcome   — user story or bug repro in writing
2. Plan             — human confirms approach (Plan mode / design note)
3. Implement        — small commits; match repo conventions
4. Verify           — run tests, manual QA at 390 / 768 / 1400 px for web
5. Document         — changelog, activity log if significant
6. Review & merge   — human approves PR
```

---

## Handoff rules

When switching agents or humans mid-task:

1. Leave a short status block: **done / blocked / next step**.
2. List files touched and commands run.
3. Note deploy or env steps still required.

For private repos, log in project `AI_ACTIVITY_LOG.md` (optional for tiny fixes).

---

## What AI may do

- Generate boilerplate, tests, docs, refactors under human direction  
- Search and explain codebase  
- Draft nginx, CSS view modes, deploy scripts from SSOT  

## What AI must not do alone

- Merge to `main` or deploy to production  
- Add secrets or commit credentials  
- Force-push or rewrite published history  
- Change license headers without lead approval  

---

## Commit & PR conventions

- Commits: imperative mood, scoped message (`fix(data-console): table layout on mobile`).
- AI-assisted work: optional trailer `Co-authored-by: Cursor <cursor@cursor.com>` or note in PR body.
- PRs: fill template; link issue; include test plan.

---

## Product-specific standards

Web work **must** follow [isystem-deploy docs](https://github.com/iSystemDevelopment/isystem-deploy/tree/main/docs):

- Layout view modes (`web-layout-standard.md`)  
- PWA + iOS (`pwa-standard.md`)  
- Asset versioning + Cloudflare (`cloudflare-cache-standard.md`)  

---

## Related

- [WORKFLOW.md](WORKFLOW.md)  
- [ACCESS_CONTROL.md](ACCESS_CONTROL.md)  
- [AI_ACTIVITY_LOG.md](AI_ACTIVITY_LOG.md)  
- [ONBOARDING.md](ONBOARDING.md)
