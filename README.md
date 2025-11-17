# .github

This is the default community health files repository for iSystem Development organization.

## License

All repositories under iSystem Development organization are licensed under the [MIT License](LICENSE) unless otherwise specified in the individual repository.

## About

This special `.github` repository provides default community health files that will be used for any public repository in the organization that doesn't have its own file of that type.

### Default Files

- **LICENSE**: MIT License - Default license for all repositories in the organization
- **SECURITY.md**: Security policy and vulnerability reporting
- **CONTRIBUTING.md**: Contribution guidelines
- **PULL_REQUEST_TEMPLATE.md**: PR checklist template

## Security

This repository includes comprehensive security measures to protect against credential exposure:

### 🛡️ Security Features

1. **Secret Scanning Workflow** (`workflows/secret-scanning.yml`)
   - Automatically scans for 15+ types of hardcoded credentials
   - Runs on every push and pull request
   - Detects AWS keys, GitHub tokens, API keys, private keys, and more

2. **Pre-commit Hooks** (`.pre-commit-config.yaml`)
   - Local development protection using gitleaks and detect-secrets
   - Install with: `pip install pre-commit && pre-commit install`

3. **Comprehensive .gitignore**
   - Prevents accidental commit of sensitive files
   - Includes credentials, keys, private directories, and more

4. **Security Response Guide** (`SECURITY_RESPONSE_GUIDE.md`)
   - Complete guide for responding to credential exposure alerts
   - Step-by-step remediation procedures
   - Prevention best practices

### 📋 Quick Start

To enable all security features in your development environment:

```bash
# Install pre-commit hooks
pip install pre-commit
pre-commit install

# Run security scan manually
pre-commit run --all-files
```

### 🚨 If You Receive a Credential Alert

See [SECURITY_RESPONSE_GUIDE.md](SECURITY_RESPONSE_GUIDE.md) for complete instructions on:
- Verifying the exposure
- Revoking and rotating credentials
- Cleaning git history
- Prevention measures

For security vulnerabilities, see [SECURITY.md](SECURITY.md).