# GitHub Actions

| Workflow | Purpose |
|----------|---------|
| `ci.yml` | Lint/test when `package.json` exists |
| `security-scan.yml` | Scheduled `npm audit` when applicable |

No org secrets required. VPS deploy secrets live per product repo / server config.
