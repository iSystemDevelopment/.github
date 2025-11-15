# Smart Credential Sanitizer

## Overview

The Smart Credential Sanitizer is an automated security tool that monitors public repositories for exposed credentials and automatically replaces them with secure placeholders. This prevents sensitive information from being publicly accessible while maintaining code functionality for review purposes.

## How It Works

### 1. Automated Scanning

The sanitizer continuously monitors repositories for exposed credentials using:

- **detect-secrets** - Industry-standard secret detection
- **TruffleHog** - Deep credential scanning
- **Custom Pattern Matching** - Organization-specific credential patterns

### 2. Intelligent Detection

Detects the following credential types:

| Type | Pattern Example | Sanitized Placeholder |
|------|----------------|----------------------|
| AWS Access Key | `AKIA...` | `[REDACTED_AWS_ACCESS_KEY_a1b2c3d4]` |
| AWS Secret Key | `aws_secret_access_key = ...` | `[REDACTED_AWS_SECRET_KEY_a1b2c3d4]` |
| GitHub Token | `ghp_...` | `[REDACTED_GITHUB_TOKEN_a1b2c3d4]` |
| API Keys | `api_key = "..."` | `[REDACTED_API_KEY_a1b2c3d4]` |
| Passwords | `password = "..."` | `[REDACTED_PASSWORD_a1b2c3d4]` |
| Private Keys | `-----BEGIN PRIVATE KEY-----` | `[REDACTED_PRIVATE_KEY_a1b2c3d4]` |
| JWT Tokens | `eyJ...` | `[REDACTED_JWT_TOKEN_a1b2c3d4]` |
| Slack Tokens | `xoxb-...` | `[REDACTED_SLACK_TOKEN_a1b2c3d4]` |
| Google API Keys | `AIza...` | `[REDACTED_GOOGLE_API_KEY_a1b2c3d4]` |
| Database Connections | `postgres://user:pass@host` | `[REDACTED_DATABASE_CONNECTION_STRING_a1b2c3d4]` |

### 3. Smart Sanitization

When credentials are detected:

1. **Immediate Replacement** - Credentials are replaced with placeholders
2. **Hash Generation** - Each credential gets a unique 8-character hash
3. **Contextual Placeholders** - Placeholders indicate the credential type
4. **No Storage** - Original credential values are NEVER stored
5. **Automatic Commit** - Changes are committed automatically

### 4. Placeholder Format

```
[REDACTED_<TYPE>_<HASH>]
```

**Example:**
```javascript
// Before sanitization
const apiKey = "sk_live_a1b2c3d4e5f6g7h8i9j0";

// After sanitization
const apiKey = "[REDACTED_API_KEY_4f8a2c1b]";
```

**Benefits:**
- ✅ Maintains code structure for review
- ✅ Indicates what type of credential was removed
- ✅ Unique hash allows tracking specific credentials
- ✅ Completely obscures the actual value
- ✅ Easy to identify sanitized sections

## Workflow Triggers

The sanitizer runs automatically:

- **On Push** - Every code push to any branch
- **On Pull Request** - All pull requests
- **Daily Scheduled** - 02:00 UTC daily scan
- **Manual Trigger** - Via Actions tab

## Automatic Actions

When credentials are found:

### 1. File Sanitization
- Replaces credentials with placeholders
- Preserves file structure and formatting
- Maintains code readability

### 2. Automatic Commit
```
🔒 Security: Auto-sanitize exposed credentials

Detected and sanitized X credential(s) in Y file(s).

Credentials have been replaced with secure placeholders:
[REDACTED_<TYPE>_<HASH>]

⚠️ URGENT: Revoke all exposed credentials immediately!
```

### 3. Security Issue Creation
Creates a detailed security issue with:
- Sanitization summary
- List of affected files
- Credential types found
- Remediation steps
- Prevention guidelines

### 4. Detailed Report Generation
Generates JSON report with:
- Total files sanitized
- Total credentials found
- Finding details by type
- File locations and line numbers

## Security Features

### ✅ Safe Operation
- **No Credential Storage** - Original values are never saved
- **Read-Only Scanning** - Only reads files during detection
- **Secure Placeholders** - Impossible to reverse-engineer
- **Audit Trail** - All actions logged

### 🔒 Privacy Protection
- **Public Repository Safe** - Sanitized code can be public
- **No Leakage** - Credentials never appear in logs
- **Secure Hashing** - SHA-256 hashing for unique IDs
- **Immediate Action** - Sanitization happens before push completion

### ⚡ Automated Response
- **Zero Manual Intervention** - Fully automated
- **Real-Time Protection** - Immediate sanitization
- **Continuous Monitoring** - Daily scans
- **Alert Creation** - Automatic security issue filing

## Excluded Files and Directories

The sanitizer automatically skips:

- `.git/` - Git internals
- `node_modules/` - Node.js dependencies
- `__pycache__/` - Python cache
- `venv/`, `env/` - Virtual environments
- `dist/`, `build/` - Build outputs
- `.next/` - Next.js build
- `vendor/` - Vendor directories
- `target/`, `bin/`, `obj/` - Compiled outputs

And binary files:
- `.exe`, `.dll`, `.so`, `.dylib`
- `.jpg`, `.png`, `.gif`, `.pdf`
- `.zip`, `.tar`, `.gz`

## Sanitization Report

After each scan, a detailed report is generated:

```json
{
  "total_files_sanitized": 3,
  "total_credentials_found": 5,
  "sanitized_files": [
    "src/config/database.js",
    "api/auth.py",
    ".env.example"
  ],
  "findings": [
    {
      "type": "AWS Access Key",
      "file": "src/config/aws.js",
      "hash": "4f8a2c1b",
      "line": 12
    },
    {
      "type": "API Key",
      "file": "api/auth.py",
      "hash": "9d3e5a7c",
      "line": 45
    }
  ]
}
```

## Response Workflow

### When Credentials Are Found:

1. **Immediate Sanitization** ⚡
   - Credentials replaced with placeholders
   - Changes committed automatically

2. **Security Alert** 🚨
   - Security issue created
   - Team notified

3. **Required Actions** ⚠️
   - **REVOKE** all exposed credentials immediately
   - **ROTATE** secrets and update all systems
   - **REVIEW** commit history for additional exposures
   - **IMPLEMENT** proper secret management

4. **Follow-Up** 📋
   - Review security practices
   - Update CI/CD pipelines
   - Train team on secure coding

## Prevention Best Practices

### Use Environment Variables
```javascript
// ❌ DON'T
const apiKey = "sk_live_a1b2c3d4e5f6g7h8i9j0";

// ✅ DO
const apiKey = process.env.API_KEY;
```

### Use GitHub Secrets
```yaml
# .github/workflows/deploy.yml
- name: Deploy
  env:
    API_KEY: ${{ secrets.API_KEY }}
```

### Use .gitignore
```
# .gitignore
.env
.env.local
*.key
*.pem
secrets/
config/credentials.json
```

### Use Pre-Commit Hooks
```bash
# Install detect-secrets pre-commit hook
pip install detect-secrets
detect-secrets scan --baseline .secrets.baseline
```

### Use Secret Management Tools
- **HashiCorp Vault**
- **AWS Secrets Manager**
- **Azure Key Vault**
- **Google Secret Manager**
- **1Password Secrets Automation**

## Manual Trigger

To manually run the sanitizer:

1. Go to **Actions** tab
2. Select **Smart Credential Sanitizer**
3. Click **Run workflow**
4. Select branch
5. Click **Run workflow** button

## Limitations

The sanitizer:
- ✅ Detects common credential patterns
- ✅ Sanitizes known credential formats
- ⚠️ May not detect custom/proprietary credential formats
- ⚠️ Cannot detect credentials in binary files
- ⚠️ Cannot undo exposure that has already occurred

**Important:** Even with sanitization, exposed credentials must be revoked and rotated immediately.

## Configuration

### Adding Custom Patterns

To add organization-specific credential patterns, edit the sanitization script:

```python
CREDENTIAL_PATTERNS = {
    'custom_token': {
        'pattern': r'CUSTOM_[A-Z0-9]{32}',
        'placeholder': 'CUSTOM_XXXX_REDACTED_XXXX',
        'type': 'Custom Token'
    }
}
```

### Adjusting Scan Schedule

Edit the workflow schedule in `.github/workflows/smart-sanitizer.yml`:

```yaml
schedule:
  - cron: '0 2 * * *'  # Daily at 02:00 UTC
```

## Monitoring and Alerts

### Workflow Status
- Check Actions tab for scan results
- Review workflow logs for details

### Security Issues
- Monitor issues with `credentials-exposure` label
- Review sanitization reports

### Email Notifications
- Configure GitHub notifications
- Set up security alert emails

## Compliance and Audit

The sanitizer helps with:
- **PCI DSS** - Prevents storage of payment credentials
- **GDPR** - Protects sensitive personal data
- **SOC 2** - Demonstrates security controls
- **HIPAA** - Safeguards protected health information

## Support and Troubleshooting

### Common Issues

**Q: Sanitizer creates too many false positives**
A: Adjust pattern sensitivity or add file exclusions

**Q: Legitimate tokens being sanitized**
A: Use environment variables for all credentials

**Q: Need to test with real credentials**
A: Use development/test credentials that are safe to expose

### Getting Help

1. Review workflow logs in Actions tab
2. Check generated security issues
3. Consult security team
4. Review documentation

## Version History

- **v1.0.0** (2025-11-15) - Initial release
  - Multi-pattern credential detection
  - Automatic sanitization with placeholders
  - Security issue creation
  - Detailed reporting

---

**Security Notice:** This tool helps prevent credential exposure but does not replace proper secret management practices. Always use environment variables, secret management tools, and follow security best practices.

**Maintained by:** Organization Security Team  
**Last Updated:** 2025-11-15
