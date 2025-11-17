# Security Response Guide

## Responding to Credential Exposure Alerts

If you receive an alert about exposed credentials, follow these steps immediately:

### 1. **Verify the Exposure** ⚠️

First, confirm whether credentials are actually exposed:

```bash
# Check for common credential patterns
grep -rE "AKIA[0-9A-Z]{16}" .
grep -rE "ghp_[0-9a-zA-Z]{36}" .
grep -rE "sk_live_[0-9a-zA-Z]{24,}" .

# Check for sensitive files
find . -name ".env" -o -name "*.pem" -o -name "*.key"
```

### 2. **Immediate Actions** 🚨

If credentials are confirmed to be exposed:

#### A. **Revoke Compromised Credentials**

- **AWS Keys**: Delete the access key immediately via AWS IAM Console
- **GitHub Tokens**: Revoke the token at https://github.com/settings/tokens
- **API Keys**: Revoke via the service provider's dashboard
- **Database Credentials**: Reset passwords immediately
- **SSH Keys**: Remove from authorized_keys and regenerate

#### B. **Rotate Secrets**

1. Generate new credentials in the service provider
2. Update all systems and services using the old credentials
3. Test that services work with new credentials
4. Document the rotation in your security log

#### C. **Review Commit History**

```bash
# Search entire git history for credentials
git log -p -S "AKIA" --all
git log -p -S "ghp_" --all

# Check all branches
git branch -a | while read branch; do
  git grep -E "AKIA[0-9A-Z]{16}" $branch || true
done
```

#### D. **Clean Git History** (if needed)

If credentials are in git history:

```bash
# Using BFG Repo-Cleaner (recommended)
bfg --replace-text passwords.txt repo.git

# Or using git filter-repo
git filter-repo --invert-paths --path credentials.txt

# Force push (WARNING: This rewrites history)
git push origin --force --all
```

⚠️ **Note**: Rewriting history affects all collaborators. Coordinate with your team.

### 3. **Prevention Measures** 🛡️

#### A. **Use Environment Variables**

Never hardcode credentials:

```javascript
// ❌ BAD
const apiKey = "sk_live_1234567890abcdef";

// ✅ GOOD
const apiKey = process.env.API_KEY;
```

```python
# ❌ BAD
password = "mySecretPassword123"

# ✅ GOOD
import os
password = os.getenv("DATABASE_PASSWORD")
```

#### B. **Use Secret Management Tools**

- **GitHub Secrets**: For CI/CD workflows
- **AWS Secrets Manager**: For AWS applications
- **HashiCorp Vault**: For enterprise secret management
- **Azure Key Vault**: For Azure applications
- **Google Secret Manager**: For GCP applications

#### C. **Configure .gitignore**

Ensure your `.gitignore` includes:

```
# Credentials and secrets
.env
.env.*
*.pem
*.key
*.crt
credentials.json
secrets.yml

# Private directories
private/
internal/
confidential/
```

#### D. **Enable Pre-commit Hooks**

Install and configure pre-commit hooks:

```bash
# Install pre-commit
pip install pre-commit

# Install hooks in your repo
pre-commit install

# Run manually
pre-commit run --all-files
```

#### E. **Enable GitHub Secret Scanning**

1. Go to repository Settings
2. Navigate to "Security & analysis"
3. Enable "Secret scanning"
4. Enable "Push protection" to prevent commits with secrets

### 4. **Verification** ✅

After remediation:

```bash
# Run secret scanning workflow
gh workflow run secret-scanning.yml

# Check for sensitive files
find . -type f \( -name ".env" -o -name "*.pem" -o -name "*.key" \)

# Verify .gitignore is working
git status --ignored
```

### 5. **Documentation** 📝

Document the incident:

- Date and time of detection
- Credentials that were exposed
- Actions taken (revocation, rotation, etc.)
- Team members notified
- Prevention measures implemented
- Lessons learned

### 6. **Team Communication** 👥

Notify relevant stakeholders:

- Development team
- Security team
- System administrators
- Management (for severe exposures)

## False Positives

Sometimes alerts are false positives:

- **Example credentials** in documentation (mark with comments)
- **Already sanitized** files (verify with git history)
- **Test data** that looks like credentials (use obvious fake values)

### Handling False Positives

If you determine an alert is a false positive:

1. **Document why it's a false positive**
2. **Update scanning rules** to prevent future false alerts
3. **Mark as resolved** in your issue tracker
4. **Add to allowlist** if appropriate

Example of clearly fake credentials in docs:

```yaml
# Example configuration (not real credentials)
api_key: "YOUR_API_KEY_HERE"  # Replace with your actual API key
secret: "example-secret-12345"  # This is just an example
```

## Emergency Contacts

- **Security Team**: security@yourdomain.com
- **On-call Engineer**: Check PagerDuty/on-call schedule
- **AWS Support**: https://console.aws.amazon.com/support/
- **GitHub Support**: https://support.github.com/

## Additional Resources

- [GitHub Secret Scanning](https://docs.github.com/en/code-security/secret-scanning)
- [OWASP Secrets Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
- [AWS Secrets Manager Best Practices](https://docs.aws.amazon.com/secretsmanager/latest/userguide/best-practices.html)
- [Pre-commit Framework](https://pre-commit.com/)

## Workflow Integration

This repository includes automated security workflows:

- **`secret-scanning.yml`**: Scans for hardcoded credentials on every push/PR
- **`private-content-protection.yml`**: Prevents private content in public repos
- **`security-scan.yml`**: Regular dependency security audits

Ensure all workflows are enabled in your repository.
