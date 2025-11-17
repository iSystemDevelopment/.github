# Contributing Guidelines

## Security

Security is a top priority for our organization. Please review our [Security Policy](SECURITY.md) before contributing.

### Reporting Security Issues

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please follow the process outlined in our [Security Policy](SECURITY.md).

## Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.

## How to Contribute

### Before You Start

1. Check existing issues and pull requests to avoid duplicates
2. For major changes, please open an issue first to discuss what you would like to change
3. Ensure your code follows the project's coding standards
4. Make sure all tests pass before submitting a pull request

### Security Best Practices for Contributors

When contributing code, please ensure:

1. **No Hardcoded Secrets**: Never commit API keys, passwords, tokens, or other secrets
2. **Dependency Security**: Keep dependencies up to date and review security advisories
3. **Input Validation**: Always validate and sanitize user inputs
4. **Secure Coding**: Follow secure coding practices for your programming language
5. **Least Privilege**: Request only the minimum permissions necessary
6. **Code Review**: Be open to security-focused code reviews

### Pull Request Process

1. **Fork** the repository and create your branch from `main`
2. **Commit** your changes with clear, descriptive commit messages
3. **Test** your changes thoroughly
4. **Security Check**: Ensure no security issues are introduced
5. **Documentation**: Update documentation as needed
6. **Submit** your pull request with a clear description of changes

### Commit Message Guidelines

- Use clear, descriptive commit messages
- Reference issue numbers when applicable
- Start with a verb in present tense (e.g., "Add", "Fix", "Update")
- Keep the first line under 72 characters

Example:
```
Add authentication middleware for API endpoints

- Implement JWT token validation
- Add rate limiting
- Update API documentation
- Add tests for authentication flow

Fixes #123
```

### Code Review

All submissions require review. We use GitHub pull requests for this purpose. Reviewers will check for:

- **Functionality**: Does the code work as intended?
- **Security**: Are there any security concerns?
- **Code Quality**: Is the code clean, readable, and maintainable?
- **Tests**: Are there adequate tests?
- **Documentation**: Is the documentation updated?

### Testing

- Write tests for new features
- Ensure all existing tests pass
- Aim for high code coverage
- Test edge cases and error conditions

### Documentation

- Update README.md if needed
- Add inline comments for complex logic
- Update API documentation
- Add examples for new features

## Questions?

Feel free to open an issue for questions about contributing.

Thank you for contributing to our projects! 🎉
# 🤝 Contributing to iSystem Development Projects

Thank you for contributing! We welcome code, docs, bug reports, testing, and ideas.

**Before you contribute:**
- Review and follow all rules in [AI_ORCHESTRATION.md](https://github.com/iSystemDevelopment/deep-clean-pro/blob/main/AI_ORCHESTRATION.md) and [SECURITY.md](https://github.com/iSystemDevelopment/.github/blob/main/SECURITY.md).
- For major changes, open an Issue/Discussion first.
- Do **not** include secrets, internal links, or proprietary info in code or docs.
- Always use feature branches, descriptive commit messages, and PR templates.

**Development/Testing Guidelines:**
- Run all tests and linters before submitting PRs.
- Use the style guides in AI_ORCHESTRATION.md and referenced docs.

**Security/Privacy:**
- Never expose secrets, credentials, or sensitive data.
- Review [SECURITY.md](https://github.com/iSystemDevelopment/.github/blob/main/SECURITY.md) for disclosure and safeguarding protocols.

See full contribution details, PR checklist, and reporting procedures in the repo's README and [AI_ORCHESTRATION.md](https://github.com/iSystemDevelopment/deep-clean-pro/blob/main/AI_ORCHESTRATION.md).
