# .github

This is the default community health files repository for iSystem Development organization.

## License

All repositories under iSystem Development organization are licensed under the [MIT License](LICENSE) unless otherwise specified in the individual repository.

## About

This special `.github` repository provides default community health files that will be used for any public repository in the organization that doesn't have its own file of that type.

### Default Files

- **LICENSE**: MIT License - Default license for all repositories in the organization
- **SECURITY.md**: Security policy and vulnerability reporting guidelines
- **SECURITY_CHECKLIST.md**: Pre-commit security checklist for contributors
- **CONTRIBUTING.md**: Contribution guidelines
- **PULL_REQUEST_TEMPLATE.md**: Pull request template

## Security

🔒 Security is a top priority for iSystem Development. This repository includes:

- **Automated Secret Scanning**: GitHub Actions workflows scan for exposed credentials
- **Pre-commit Hooks**: Local scanning before commits (see `.pre-commit-config.yaml`)
- **Security Policies**: Comprehensive guidelines in [SECURITY.md](SECURITY.md)
- **Security Checklist**: Pre-commit checklist in [SECURITY_CHECKLIST.md](SECURITY_CHECKLIST.md)

### Quick Start - Security Setup

1. **Install pre-commit hooks** (prevents accidental credential commits):
   ```bash
   pip install pre-commit
   pre-commit install
   ```

2. **Review security policies**: Read [SECURITY.md](SECURITY.md) for credential management

3. **Use secrets properly**:
   - Store in environment variables
   - Use GitHub Secrets for workflows
   - Never hardcode credentials

### Reporting Security Issues

**Do NOT** open public issues for security vulnerabilities. Instead:
- Use [GitHub Security Advisories](https://github.com/iSystemDevelopment/.github/security/advisories)
- Email: [security@isystem.app](mailto:security@isystem.app)