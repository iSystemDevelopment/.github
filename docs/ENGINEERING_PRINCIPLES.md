# Engineering principles

DIODAC ELECTRONICS / iSystem Development — how we build software.

---

## Human-led, AI-accelerated

- **Dr. Diodac (human lead)** owns architecture, product decisions, security sign-off, and client commitments.
- **AI assistants** (IDE agents, chat models) accelerate implementation, review, tests, and documentation.
- We do not brand individual model vendors on public pages; we document *workflow*, not marketing.

---

## Quality bar

1. **Ship working systems** — demos and production paths must be testable.
2. **Document SSOT** — platform rules in `isystem-deploy/docs/`; project rules in each repo.
3. **Security first** — no secrets in git; sanitize before public sync; report via [SECURITY.md](../templates/SECURITY.md).
4. **Responsive & installable web** — public apps follow PWA + layout standards.
5. **Minimal scope** — fix the root cause; avoid drive-by refactors.

---

## Domains

| Domain | Purpose |
|--------|---------|
| [isystem.app](https://isystem.app) | Products & PWAs |
| [diodac.org](https://diodac.org) | Engineering portfolio |
| [isystem.cloud](https://isystem.cloud) | Services & API (roadmap) |

---

## Collaboration

- Significant AI-assisted sessions logged per [AI_ACTIVITY_LOG.md](AI_ACTIVITY_LOG.md).
- Handoffs documented when switching tools or agents mid-task.
- Private client work stays in private repos; public repos are sanitized.

---

## Related

- [ONBOARDING.md](ONBOARDING.md)
- [AI_ORCHESTRATION.md](AI_ORCHESTRATION.md)
- [WORKFLOW.md](WORKFLOW.md)
