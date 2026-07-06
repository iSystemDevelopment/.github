# Access control — org template

Least privilege for repos, VPS, and client data. Customize per project.

---

## Hierarchy

| Level | Who | Can |
|-------|-----|-----|
| **Owner** | Dr. Diodac | Org settings, billing, all repos, production deploy |
| **Maintainer** | Named leads | Merge, release, VPS deploy for assigned products |
| **Contributor** | Invited devs | Push branches, open PRs on granted repos |
| **Read** | Auditors / CI | Clone, no write |

---

## Repository classes

| Class | Examples | Rules |
|-------|----------|-------|
| **Public OSS** | deep-clean-pro, Wordpress | No secrets ever; MIT license |
| **Public proprietary** | Some product sites via deploy package | Sanitized only |
| **Private SSOT** | Client projects, firmware source | No public fork; sanitize pipeline for excerpts |

---

## Production systems

| System | Access |
|--------|--------|
| VPS `74.208.44.132` | SSH root — lead + documented break-glass only |
| Cloudflare | Org admin — DNS + cache rules |
| Google Cloud / API | Service accounts; no keys in git |

---

## Escalation

| Topic | Decision maker |
|-------|----------------|
| Architecture / scope | Dr. Diodac |
| Security incident | Dr. Diodac + follow [SECURITY.md](../templates/SECURITY.md) |
| Client data handling | Project lead + client agreement |
| License change | Owner only |

---

## AI session access

AI agents inherit **your** repo access via IDE — treat agent context as sensitive:

- Do not paste production credentials into chats  
- Redact client names in public issue threads when required  

---

## Related

- [ONBOARDING.md](ONBOARDING.md)  
- [AI_ORCHESTRATION.md](AI_ORCHESTRATION.md)  
- [templates/SECURITY.md](../templates/SECURITY.md)
