# Security Policy

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability, please follow these steps:

1. **Do not** open a public issue
2. Email the security team with details of the vulnerability
3. Include steps to reproduce the issue if possible
4. Allow time for us to address the issue before public disclosure

## Supported Versions

We provide security updates for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| Latest  | :white_check_mark: |
| Older   | :x:                |

## Security Best Practices

When contributing to our projects:

- Never commit secrets, API keys, passwords, or other sensitive data
- Use environment variables for configuration
- Keep dependencies up to date
- Follow secure coding practices
- Validate and sanitize all inputs
- Use prepared statements for database queries
- Implement proper authentication and authorization

## Dependency Security

- Regularly update dependencies to address known vulnerabilities
- Review security advisories for used packages
- Use tools like Dependabot to automate dependency updates
- Run security scans as part of CI/CD pipelines

## Code Review

- All code changes require review before merging
- Security-sensitive changes require additional scrutiny
- Automated security checks run on all pull requests

Thank you for helping keep our projects secure!
