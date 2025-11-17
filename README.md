# .github

This is the default community health files repository for iSystem Development organization.

## License

All repositories under iSystem Development organization are licensed under the [MIT License](LICENSE) unless otherwise specified in the individual repository.

## About

This special `.github` repository provides default community health files that will be used for any public repository in the organization that doesn't have its own file of that type.

### Default Files

- **LICENSE**: MIT License - Default license for all repositories in the organization
- **SECURITY.md**: Security policy and vulnerability reporting guidelines
- **CREDENTIAL_SECURITY.md**: Comprehensive guide for handling credentials and preventing exposure
- **PULL_REQUEST_TEMPLATE.md**: Standard PR template with security checklist
- **CONTRIBUTING.md**: Contribution guidelines

### Security

This repository implements comprehensive security measures:

- **Automated Secret Scanning**: Runs on every push and pull request
- **Pre-commit Hooks**: Local credential detection before commits (see `.pre-commit-config.yaml`)
- **Sanitization Workflows**: Automatic credential sanitization for public repositories
- **Security Guidelines**: See [CREDENTIAL_SECURITY.md](CREDENTIAL_SECURITY.md) for detailed instructions

⚠️ **Never commit credentials, API keys, or sensitive data.** See [CREDENTIAL_SECURITY.md](CREDENTIAL_SECURITY.md) for prevention and remediation steps.