# 🔐 Credential Security Guide

## Overview

This guide provides comprehensive instructions for handling credentials and preventing accidental exposure in all iSystem Development repositories.

## 🚨 What Happened

A credential exposure incident was detected where sensitive information was found in:
- Documentation files
- Example configurations
- Workflow files

**All exposed credentials have been automatically sanitized and replaced with placeholders.**

## ⚠️ Immediate Actions Required

If you received a credential exposure alert:

1. **Revoke all exposed credentials immediately**
   - AWS Access Keys: Revoke in IAM console
   - API Keys: Regenerate in the service provider's dashboard
   - GitHub Tokens: Revoke in Settings → Developer settings → Personal access tokens
   - Database passwords: Rotate immediately

2. **Rotate secrets and update all systems**
   - Update all applications and services using the old credentials
   - Test that new credentials work before removing old ones
   - Document where credentials were updated

3. **Review commit history**
   - Check if credentials exist in older commits
   - Consider using `git filter-repo` or BFG Repo-Cleaner for sensitive data
   - Contact GitHub Support if credentials are in public commit history

4. **Audit access logs**
   - Check for unauthorized access using the exposed credentials
   - Monitor for suspicious activity in the following days

## 🛡️ Prevention Best Practices

### Never Commit Credentials

**NEVER hardcode these in source code:**
- API keys
- Access tokens
- Passwords
- Private keys
- Database connection strings
- OAuth client secrets
- Encryption keys
- SSH private keys

### Use Environment Variables

**Good:**
```javascript
const apiKey = process.env.API_KEY;
const dbPassword = process.env.DB_PASSWORD;
```

**Bad:**
```javascript
const apiKey = "sk-1234567890abcdef"; // ❌ NEVER DO THIS
const dbPassword = "myP@ssw0rd123"; // ❌ NEVER DO THIS
```

### Use Secret Management Services

- **GitHub Actions**: Use [GitHub Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
- **AWS**: Use [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/) or Parameter Store
- **Azure**: Use [Azure Key Vault](https://azure.microsoft.com/en-us/services/key-vault/)
- **Google Cloud**: Use [Secret Manager](https://cloud.google.com/secret-manager)
- **HashiCorp Vault**: For on-premise or multi-cloud setups

### Secure .env Files

1. **Always add .env to .gitignore:**
```gitignore
.env
.env.*
!.env.example
```

2. **Provide .env.example templates:**
```bash
# .env.example
API_KEY=your-api-key-here
DB_PASSWORD=your-database-password-here
```

3. **Never commit actual .env files**

### Use Pre-commit Hooks

Install [gitleaks](https://github.com/gitleaks/gitleaks) or similar tools:

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/gitleaks/gitleaks
    rev: v8.18.1
    hooks:
      - id: gitleaks
```

Install hooks:
```bash
pip install pre-commit
pre-commit install
```

## 🔍 Detection Tools

### GitHub Secret Scanning

Enable in repository settings:
1. Go to Settings → Code security and analysis
2. Enable "Secret scanning"
3. Enable "Push protection" to prevent accidental commits

### Automated Scanning

This repository includes automated secret scanning in CI/CD:
- Daily security scans
- Pre-merge validation
- Commit-time detection

### Manual Scanning

Use [gitleaks](https://github.com/gitleaks/gitleaks):
```bash
# Scan current repository
gitleaks detect --source . --verbose

# Scan entire history
gitleaks detect --source . --log-opts="--all"
```

Use [TruffleHog](https://github.com/trufflesecurity/trufflehog):
```bash
trufflehog filesystem --directory=.
```

## 📝 Credential Patterns to Avoid

### AWS Access Keys
```
❌ AKIAIOSFODNN7EXAMPLE
✅ Use AWS IAM roles or environment variables
```

### Private Keys
```
❌ -----BEGIN RSA PRIVATE KEY-----
✅ Store in secure key management system
```

### API Keys
```
❌ sk-1234567890abcdefghijklmnopqrstuvwxyz
✅ Use environment variables or secret manager
```

### Database Connection Strings
```
❌ mongodb://user:password@host:27017/database
✅ mongodb://user:${DB_PASSWORD}@host:27017/database
```

### Generic Secrets
```
❌ password = "MySecretP@ss"
❌ token = 'ghp_1234567890abcdefghijklmnopqrstu'
✅ password = process.env.PASSWORD
✅ token = os.getenv('GITHUB_TOKEN')
```

## 🔧 Repository Configuration

### Required Files

1. **.gitignore** - Exclude sensitive files
2. **.env.example** - Template for environment variables
3. **README.md** - Document environment setup
4. **SECURITY.md** - Security policy and reporting

### GitHub Settings

1. **Enable Secret Scanning**
   - Settings → Code security and analysis
   - Enable "Secret scanning"
   - Enable "Push protection"

2. **Enable Dependabot**
   - Automatically update dependencies with security fixes

3. **Require Reviews**
   - Require at least one review for sensitive changes
   - Enable CODEOWNERS for critical files

### Workflow Security

**Good GitHub Actions workflow:**
```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy
        env:
          API_KEY: ${{ secrets.API_KEY }}
        run: ./deploy.sh
```

**Bad GitHub Actions workflow:**
```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy
        run: |
          export API_KEY="sk-1234567890" # ❌ NEVER DO THIS
          ./deploy.sh
```

## 📚 Examples and Templates

### .env.example Template
```bash
# Application Settings
APP_NAME=MyApp
APP_ENV=development
APP_DEBUG=true

# Database Configuration
DB_HOST=localhost
DB_PORT=5432
DB_NAME=myapp_db
DB_USER=your-db-username
DB_PASSWORD=your-db-password

# API Keys (obtain from service providers)
STRIPE_API_KEY=your-stripe-key
SENDGRID_API_KEY=your-sendgrid-key
AWS_ACCESS_KEY_ID=your-aws-access-key
AWS_SECRET_ACCESS_KEY=your-aws-secret-key

# OAuth Configuration
GITHUB_CLIENT_ID=your-github-client-id
GITHUB_CLIENT_SECRET=your-github-client-secret

# JWT Secret
JWT_SECRET=your-jwt-secret-key
```

### Placeholder Format

When sanitizing credentials in documentation, use this format:
```
[REDACTED_<TYPE>_<HASH>]
```

Examples:
- `[REDACTED_AWS_ACCESS_KEY_bf838ec2]`
- `[REDACTED_API_KEY_6d993efc]`
- `[REDACTED_PRIVATE_KEY_3021d90e]`
- `[REDACTED_PASSWORD_f150389f]`

## 🆘 Incident Response

### If You Accidentally Commit a Secret

1. **Do NOT just delete the file and commit again** - the secret is still in history
2. **Immediately revoke/rotate the credential**
3. **Remove from git history:**

   Using git-filter-repo (recommended):
   ```bash
   pip install git-filter-repo
   git filter-repo --path path/to/file --invert-paths
   ```

   Or using BFG Repo-Cleaner:
   ```bash
   bfg --delete-files secret-file.txt
   git reflog expire --expire=now --all
   git gc --prune=now --aggressive
   ```

4. **Force push (if you have permission):**
   ```bash
   git push --force
   ```

5. **Contact repository admins** if it's a public repository
6. **Monitor for unauthorized access** using the exposed credential

## ✅ Security Checklist

Before committing code, verify:

- [ ] No hardcoded credentials in code
- [ ] .env files are in .gitignore
- [ ] Sensitive files are in .gitignore
- [ ] Example files use placeholders, not real values
- [ ] Documentation uses `[REDACTED_TYPE_HASH]` format
- [ ] GitHub Secrets are used for CI/CD credentials
- [ ] Pre-commit hooks are installed and passing
- [ ] Secret scanning is enabled in repository settings

## 📞 Support

If you have questions or need to report a security issue:

- **Security Issues**: [security@isystem.app](mailto:security@isystem.app)
- **General Questions**: Open a discussion in the repository

## 📖 Additional Resources

- [GitHub Secret Scanning Documentation](https://docs.github.com/en/code-security/secret-scanning)
- [OWASP Secrets Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
- [Gitleaks Documentation](https://github.com/gitleaks/gitleaks)
- [Git Filter-Repo Documentation](https://github.com/newren/git-filter-repo)

---

**Last Updated:** 2025-11-17
**Version:** 1.0
