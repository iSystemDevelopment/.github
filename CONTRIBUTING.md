# Contributing Guidelines

Thank you for considering contributing to our projects! This document provides guidelines to help keep our repositories consistent, clean, and efficient.

## Code Quality Standards

### Code Structure

- Write clean, efficient, and well-structured code
- Follow the DRY (Don't Repeat Yourself) principle
- Keep functions and methods focused on a single responsibility
- Use meaningful variable and function names
- Ensure proper error handling and edge case coverage

### Code Style

- Follow the language-specific style guides for your project
- Use consistent indentation (typically 2 or 4 spaces)
- Add comments only when necessary to explain complex logic
- Keep line lengths reasonable (typically under 100-120 characters)

## Repository Consistency

### Branch Naming

Use descriptive branch names with prefixes:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `refactor/` - Code refactoring
- `test/` - Test additions or modifications

### Commit Messages

Write clear, concise commit messages:
- Use present tense ("Add feature" not "Added feature")
- Start with a capital letter
- Keep the first line under 50 characters
- Add detailed description if necessary, separated by a blank line

Example:
```
Add user authentication module

Implement JWT-based authentication with refresh tokens.
Includes middleware for protected routes and token validation.
```

### Pull Requests

Before submitting a pull request:
1. Ensure all tests pass
2. Run linters and fix any issues
3. Update documentation if needed
4. Rebase on the latest main/master branch
5. Provide a clear description of changes

## Testing

- Write tests for new features and bug fixes
- Ensure tests are meaningful and cover edge cases
- Maintain or improve code coverage
- Run all tests before submitting a PR

## Documentation

- Update README.md for significant changes
- Document new features and APIs
- Keep documentation in sync with code changes
- Use proper grammar and spelling in all documentation

## Security

- Never commit sensitive information (API keys, passwords, etc.)
- Review dependencies for known vulnerabilities
- Follow security best practices for your language/framework
- Report security issues privately to maintainers

## Getting Help

If you have questions or need clarification:
- Check existing documentation
- Review closed issues and pull requests
- Open a new issue with the `question` label
- Reach out to maintainers

Thank you for helping us maintain high-quality, consistent repositories!
