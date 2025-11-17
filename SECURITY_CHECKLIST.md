# 🔒 Security Checklist for Contributors

Use this checklist before committing code to ensure security best practices are followed.

## Pre-Commit Security Checklist

### Credentials and Secrets
- [ ] No hardcoded passwords, API keys, or tokens in code
- [ ] No `.env` files committed (only `.env.example` is allowed)
- [ ] No private keys, certificates, or SSH keys committed
- [ ] No database connection strings with embedded passwords
- [ ] All secrets use environment variables or GitHub Secrets
- [ ] Pre-commit hooks installed and passing (`pre-commit run --all-files`)

### Configuration Files
- [ ] No AWS credentials in configuration files
- [ ] No cloud provider service account keys
- [ ] No OAuth tokens or refresh tokens
- [ ] Sensitive configuration uses placeholders (e.g., `<YOUR-API-KEY>`)

### Code Review
- [ ] No sensitive data in log statements
- [ ] No debugging code that exposes internal information
- [ ] Input validation implemented for user-provided data
- [ ] Output sanitization for data displayed to users
- [ ] Error messages don't reveal sensitive system information

### Files and Directories
- [ ] `.gitignore` includes all sensitive file patterns
- [ ] No `internal/`, `private/`, or `notes/` directories in public repos
- [ ] No proprietary or confidential documentation
- [ ] All committed files are intended for the repository

### Dependencies and Third-Party Code
- [ ] Dependencies are from trusted sources
- [ ] No known vulnerabilities in dependencies (`npm audit`, `pip check`, etc.)
- [ ] License compliance checked for all dependencies

### Workflow and CI/CD
- [ ] GitHub Actions workflows use secrets properly
- [ ] No secrets in workflow logs or outputs
- [ ] Workflow permissions follow least privilege principle

## Post-Commit Actions

### If You Accidentally Commit Secrets
1. **STOP** - Do not push if you haven't already
2. **Revoke** the exposed credential immediately
3. **Remove** from git history:
   ```bash
   # For the last commit
   git reset --soft HEAD~1
   # Edit files to remove secrets
   git add .
   git commit -m "Remove accidentally committed secrets"
   ```
4. **If already pushed**:
   - Revoke credentials immediately
   - Contact [security@isystem.app](mailto:security@isystem.app)
   - Follow the credential rotation process in SECURITY.md

### Regular Security Practices
- [ ] Review code changes with `git diff` before committing
- [ ] Run security scans locally before pushing
- [ ] Keep dependencies updated regularly
- [ ] Monitor security advisories for used packages
- [ ] Participate in security training and updates

## Automated Security Tools

### Pre-Commit Hooks
Install pre-commit hooks to automatically scan for secrets:
```bash
pip install pre-commit
pre-commit install
```

### Secret Scanning Tools
The repository uses multiple tools for secret detection:
- **Gitleaks**: Detects hardcoded secrets in code
- **TruffleHog**: Searches for high entropy strings and secrets
- **Custom patterns**: Organization-specific secret patterns

### Running Scans Locally
```bash
# Run all pre-commit hooks
pre-commit run --all-files

# Run specific security checks
gitleaks detect --source . --verbose

# Check for AWS credentials
grep -r "AKIA[0-9A-Z]{16}" .
```

## Resources

- [SECURITY.md](SECURITY.md) - Full security policy
- [GitHub Secret Scanning](https://docs.github.com/en/code-security/secret-scanning)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Git Secrets Management](https://git-secret.io/)

## Questions?

Contact the security team: [security@isystem.app](mailto:security@isystem.app)
