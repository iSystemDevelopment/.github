# Help & troubleshooting

---

## Access & GitHub

| Problem | Fix |
|---------|-----|
| Cannot see private repo | Request access from [@Dr-Diodac](https://github.com/Dr-Diodac) |
| PR checks failing | Read workflow logs; fix lint/test; re-push |
| Merge conflicts | Rebase on `main`; ask lead if unsure |

---

## Web / deploy (`isystem-deploy`)

| Problem | Fix |
|---------|-----|
| Stale CSS on live site | Bump `?v=` on theme link; see [Cloudflare cache SSOT](https://github.com/iSystemDevelopment/isystem-deploy/blob/main/docs/cloudflare-cache-standard.md) |
| Mobile layout broken | Check view-mode CSS guards — [web-layout-standard](https://github.com/iSystemDevelopment/isystem-deploy/blob/main/docs/web-layout-standard.md) |
| Images 404 on VPS | `chmod 755` on `assets/`; verify nginx root |

Deploy scripts: `isystem-deploy/scripts/scp-*.ps1`

---

## AI sessions

| Problem | Fix |
|---------|-----|
| Agent changed too much | Revert; restate minimal scope; reference SSOT doc |
| Lost context | Paste handoff block per [AI_ORCHESTRATION.md](AI_ORCHESTRATION.md) |

---

## Security

Suspected credential leak: rotate immediately, notify lead, follow [SECURITY.md](../templates/SECURITY.md).

---

## Still stuck?

1. [FAQ.md](FAQ.md)  
2. Email [diodac.electronics@gmail.com](mailto:diodac.electronics@gmail.com)  
3. Org wiki: [Home](https://github.com/iSystemDevelopment/.github/wiki)
