# iSystemDevelopment Organization Repository

This is the special `.github` repository for the iSystemDevelopment organization. It contains organization-wide configuration, documentation, and guidelines.

## Contents

- **[COPILOT.md](COPILOT.md)** - Guidelines for GitHub Copilot and AI assistant usage
- **[PRIVACY.md](PRIVACY.md)** - Privacy and security policy
- **.gitignore** - Privacy controls for sensitive configuration files
- **.github/copilot-instructions.md** - Private AI assistant instructions (local-only, not committed)

## Purpose

This repository serves as the central configuration point for:

- GitHub Copilot behavior and standards
- Organization-wide privacy and security policies
- Default community health files for all repositories
- Shared workflows and automation

## Privacy Protection

Sensitive configuration files are protected using `.gitignore` and never committed to version control:

```bash
# Verify protected files are ignored
$ git check-ignore -v .github/copilot-instructions.md
.gitignore:2:.github/copilot-instructions.md
```

All public-facing documentation maintains a professional tone and protects user privacy. See [PRIVACY.md](PRIVACY.md) for detailed privacy policies.

## For Contributors

When working in this organization:

- Follow the guidelines in [COPILOT.md](COPILOT.md)
- Maintain professional, polished communication in all public materials
- Protect sensitive information and user privacy
- Ensure consistency across all repositories

## Learn More

- [GitHub's special .github repository](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-repository-templates)
- [GitHub Copilot documentation](https://docs.github.com/en/copilot)