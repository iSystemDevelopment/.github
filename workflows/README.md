# GitHub Actions — org `.github` repo

Workflows in this folder run on **iSystemDevelopment/.github** itself. Copy to product repos as needed.

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `ci.yml` | push, PR | Node lint/test/build **when `package.json` exists** |
| `security-scan.yml` | daily, manual | `npm audit` when `package.json` exists |
| `private-content-protection.yml` | push, PR | Block secret files; scan public repos for internal markers |

## Removed

| Workflow | Reason |
|----------|--------|
| `sanitize-and-sync.yml` | Legacy private→public sync for deleted inventory-builder repos |

Manual sanitization: [scripts/sanitize-sync.sh](../scripts/sanitize-sync.sh)

## Secrets

No org secrets required for these workflows. Product repos that deploy to VPS need their own secrets.
