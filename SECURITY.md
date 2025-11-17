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

## Policy Enforcement
- Automated workflows check for secrets, unsafe patterns, and license compliance.
- Human review on all critical infrastructure or security-impacting changes.

## References
- [AI_ORCHESTRATION.md](https://github.com/iSystemDevelopment/deep-clean-pro/blob/main/AI_ORCHESTRATION.md) (full developer & automation rules)
- README in each project repo

Any questions or disclosures: [security@isystem.app](mailto:security@isystem.app)
