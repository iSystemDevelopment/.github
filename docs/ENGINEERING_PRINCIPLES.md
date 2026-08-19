# Engineering principles

1. **Human-led, AI-accelerated** — lead owns architecture and merge; AI drafts under direction.
2. **Document SSOT** — platform rules in private `isystem-codebase/docs/`; product rules per folder.
3. **Security first** — no secrets in git; report via [SECURITY.md](../templates/SECURITY.md).
4. **Minimal diffs** — solve the stated problem; no speculative abstraction.
5. **No resurrection** — retired hosts, repos, and patterns stay retired (monorepo `RETIRED_REGISTRY.md`).
6. **Always report** — non-trivial AI work ends with: when, files/lines, why, how, risks, verification.

---

## Quality bar

| Good | Rejected ("slop") |
|------|-------------------|
| 5-line fix for root cause | 100-line refactor "while we're here" |
| Matches existing naming/style | New helper for one use |
| Cites deploy-map paths | Guessed VPS paths |
| Change report with line ranges | "Updated some files" |

---

## Promotion path

Private draft → review → public MIT slice or org doc. Never auto-sync private monorepo to public GitHub.

---

*Maintainer: Dr. Diodac*
