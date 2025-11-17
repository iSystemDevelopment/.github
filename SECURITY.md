# 🛡️ Security Policy: iSystem Development

## Principles
- Security-first by design, across all repositories.
- No telemetry/analytics. No hidden data collection.
- All destructive or system-modifying code must support "dry run" or "what if" modes.

## Vulnerability Reporting
- **Do NOT** open public Issues for security bugs.
- Instead, use [GitHub Security Advisories](https://github.com/iSystemDevelopment/deep-clean-pro/security/advisories) or email [security@isystem.app](mailto:security@isystem.app).
- Preferred template and details in each repo's README.

## Secure Coding Rules
- No hardcoded secrets/passwords/tokens.
- Validate inputs, sanitize outputs, follow least privilege.
- Required security testing (linters, static analysis, PSScriptAnalyzer where relevant).
- All logs must exclude sensitive/personal data.

## Credential Management Best Practices

### Never Commit Secrets
- **DO NOT** hardcode credentials, API keys, tokens, or passwords in source code
- **DO NOT** commit `.env` files, private keys, or certificates
- **DO NOT** include sensitive data in configuration files tracked by git

### Use Secure Storage
- **GitHub Secrets**: Use for CI/CD workflows (`${{ secrets.SECRET_NAME }}`)
- **Environment Variables**: Use for local development and runtime configuration
- **Secret Management Tools**: 
  - AWS Secrets Manager
  - Azure Key Vault
  - HashiCorp Vault
  - Google Secret Manager

### Secret Scanning
- **Pre-commit Hooks**: Install and use `.pre-commit-config.yaml` to scan before commits
  ```bash
  pip install pre-commit
  pre-commit install
  ```
- **Automated Scans**: GitHub Actions run Gitleaks and TruffleHog on every push
- **Enable GitHub Secret Scanning**: Go to repository Settings → Security → Secret scanning

### If Credentials Are Exposed
1. **Revoke immediately**: Assume exposed credentials are compromised
2. **Rotate secrets**: Generate new credentials and update all systems
3. **Review commit history**: Use `git log -p` to find all occurrences
4. **Clean history** (if necessary): Use `git filter-repo` or BFG Repo-Cleaner
5. **Force push**: After cleaning, force push to update remote history
6. **Notify security team**: Report incident to [security@isystem.app](mailto:security@isystem.app)

### Protected File Types
The following files should **NEVER** be committed:
- `*.pem`, `*.key`, `*.crt`, `*.p12`, `*.pfx` (certificates and private keys)
- `.env`, `.env.*` (except `.env.example`)
- `*credentials*`, `*secret*` files
- `id_rsa`, `id_dsa`, `id_ecdsa`, `id_ed25519` (SSH keys)
- `service-account*.json` (cloud provider credentials)

### Proper Credential Usage

**❌ WRONG** (example - not real credentials):
```yaml
database_password: "MyS3cr3tP@ssw0rd"  # example only
api_key: "sk-1234567890abcdef"  # example only
```

**✅ CORRECT:**
```yaml
database_password: ${{ secrets.DB_PASSWORD }}
api_key: ${API_KEY}  # From environment variable
```

## Policy Enforcement
- Automated workflows check for secrets, unsafe patterns, and license compliance.
- Human review on all critical infrastructure or security-impacting changes.

## References
- [AI_ORCHESTRATION.md](https://github.com/iSystemDevelopment/deep-clean-pro/blob/main/AI_ORCHESTRATION.md) (full developer & automation rules)
- README in each project repo

Any questions or disclosures: [security@isystem.app](mailto:security@isystem.app)
