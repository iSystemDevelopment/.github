# Security Policy

## Supported Versions

We release patches for security vulnerabilities. Which versions are eligible for receiving such patches depends on the CVSS v3.0 Rating:

| Version | Supported          |
| ------- | ------------------ |
| latest  | :white_check_mark: |

## Reporting a Vulnerability

Please report (suspected) security vulnerabilities to the repository maintainers. You will receive a response from us within 48 hours. If the issue is confirmed, we will release a patch as soon as possible depending on complexity but historically within a few days.

### Reporting Process

1. **Do not** open a public issue for security vulnerabilities
2. Use GitHub's Security Advisory feature (if available) or contact maintainers directly
3. Provide detailed information including:
   - Type of vulnerability
   - Full paths of source files related to the vulnerability
   - Location of the affected source code (tag/branch/commit or direct URL)
   - Step-by-step instructions to reproduce the issue
   - Proof-of-concept or exploit code (if possible)
   - Impact of the issue, including how an attacker might exploit it

### What to Expect

- Acknowledgment of your report within 48 hours
- Regular updates on the progress of fixing the vulnerability
- Credit in the security advisory (unless you prefer to remain anonymous)

## Security Best Practices for Contributors

When contributing to our repositories:

1. **Keep dependencies up to date** - Review and update dependencies regularly
2. **Follow secure coding practices** - Validate inputs, use parameterized queries, avoid hardcoded secrets
3. **Review security alerts** - Address Dependabot and code scanning alerts promptly
4. **Use secret scanning** - Never commit secrets, API keys, or credentials
5. **Enable two-factor authentication** - Protect your GitHub account with 2FA
6. **Review permissions** - Request minimal permissions necessary for your code

## Automated Security

This organization uses:

- **Dependabot** - Automated dependency updates and vulnerability alerts
- **Code Scanning** - Automated code security analysis
- **Secret Scanning** - Detection of accidentally committed secrets

## Disclosure Policy

When we receive a security bug report, we will:

1. Confirm the problem and determine affected versions
2. Audit code to find any similar problems
3. Prepare fixes for all supported releases
4. Release patches as soon as possible

Thank you for helping keep our projects secure!
