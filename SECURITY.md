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
- **No hardcoded secrets/passwords/tokens** - See [CREDENTIAL_SECURITY.md](CREDENTIAL_SECURITY.md) for comprehensive guidance.
- Validate inputs, sanitize outputs, follow least privilege.
- Required security testing (linters, static analysis, PSScriptAnalyzer where relevant).
- All logs must exclude sensitive/personal data.

## Policy Enforcement
- **Automated secret scanning** on every push and pull request (see `.github/workflows/secret-scanning.yml`).
- Automated workflows check for unsafe patterns and license compliance.
- Human review on all critical infrastructure or security-impacting changes.
- Pre-commit hooks recommended for local secret detection.

## References
- [AI_ORCHESTRATION.md](https://github.com/iSystemDevelopment/deep-clean-pro/blob/main/AI_ORCHESTRATION.md) (full developer & automation rules)
- README in each project repo

Any questions or disclosures: [security@isystem.app](mailto:security@isystem.app)
