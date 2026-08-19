# Contributor onboarding

Welcome to **iSystem Development**. This guide gets you productive in one session.

---

## 1. Access

| Need | Action |
|------|--------|
| GitHub org membership | Request from [@Dr-Diodac](https://github.com/Dr-Diodac) |
| Private repos | Granted per project; default is least privilege |
| VPS / deploy | Private `isystem-codebase` monorepo (org members); SSH keys via lead only |

---

## 2. Read first (30 min)

1. [ENGINEERING_PRINCIPLES.md](ENGINEERING_PRINCIPLES.md) — how we work  
2. [WORKFLOW.md](WORKFLOW.md) — branches, review, deploy  
3. [AI_ORCHESTRATION.md](AI_ORCHESTRATION.md) — AI-assisted sessions  
4. Live products on [isystem.app](https://isystem.app) — web/PWA standards in private monorepo `docs/` (if touching `*.isystem.app`)

---

## 3. Repo map

| Repo | Role |
|------|------|
| Private monorepo | Platform, products, `scripts/scp-*.ps1` (org members) |
| [.github](https://github.com/iSystemDevelopment/.github) | Org profile, templates, this docs folder |
| [deep-clean-pro](https://github.com/iSystemDevelopment/deep-clean-pro) | Open-source Windows tools (MIT) |
| [Wordpress](https://github.com/iSystemDevelopment/Wordpress) | WP plugins & theme (MIT) |
| [diodac_audio](https://github.com/iSystemDevelopment/diodac_audio) | Web DAW MIDI bridge |

Product-specific READMEs live in each repository.

---

## 4. First contribution

1. Clone the target repo; create branch `feature/short-description`.
2. Follow [templates/CONTRIBUTING.md](../templates/CONTRIBUTING.md).
3. Log non-trivial AI-assisted work in the project’s activity log (template: [AI_ACTIVITY_LOG.md](AI_ACTIVITY_LOG.md)).
4. Open PR; request review from project lead.

---

## 5. Security reminders

- Never commit `.env`, credentials, client data, or live API keys.
- Use `// SANITIZE` markers in code destined for public mirrors.
- Report issues via [templates/SECURITY.md](../templates/SECURITY.md).

---

## 6. Help

- [FAQ.md](FAQ.md) · [HELP.md](HELP.md)  
- Email: [diodac.electronics@gmail.com](mailto:diodac.electronics@gmail.com) · [info@isystem.app](mailto:info@isystem.app)  
- [Org wiki](https://github.com/iSystemDevelopment/.github/wiki) — mirror of key pages (see [wiki/README.md](../wiki/README.md))

---

## Checklist

- [ ] GitHub org access confirmed  
- [ ] Read ENGINEERING_PRINCIPLES + WORKFLOW  
- [ ] Know which repo is SSOT for your task  
- [ ] SECURITY.md reviewed  
- [ ] First branch pushed
