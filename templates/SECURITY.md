# Security policy — org template

Copy or link from product repos. Report issues to the maintainer — do not open public issues for active credential leaks.

---

## Reporting

Email **diodac.electronics@gmail.com** with:

- Repository and branch (if applicable)
- Description of the issue
- Steps to reproduce (for vulnerabilities)

Do **not** paste live secrets into GitHub issues, PRs, or email subject lines.

---

## What we never commit

- `.env`, API keys, tokens, private keys (`.pem`, `.key`, `.crt`)
- Client PII, production database dumps, or contract documents
- VPS root passwords or Cloudflare API tokens

Secrets belong in **GitHub Actions secrets**, **VPS env**, or **password manager** — not in git history.

---

## If credentials were exposed

1. **Rotate immediately** — treat as compromised.
2. **Revoke** old keys in the provider console (GitHub, Cloudflare, Google, etc.).
3. **Scrub history** if the secret reached a public branch (`git filter-repo` or GitHub support).
4. **Log** the incident in [docs/AI_ACTIVITY_LOG.md](../docs/AI_ACTIVITY_LOG.md) (private note — no secret values).

---

## Automated checks

Repos that copy org workflows should run:

- `private-content-protection.yml` — blocks secret files and internal markers on public repos
- `security-scan.yml` — optional `npm audit` where `package.json` exists

Manual export from private backups: [scripts/sanitize-sync.sh](../scripts/sanitize-sync.sh) (Linux/bash).

---

## Related

- [docs/WORKFLOW.md](../docs/WORKFLOW.md)
- [docs/ACCESS_CONTROL.md](../docs/ACCESS_CONTROL.md)

*Last updated: 2026-07-06*
