# Privacy and Security Policy

## Overview

iSystemDevelopment is committed to protecting privacy and maintaining professional standards in all public-facing materials.

## Private Information Protection

### What We Protect

The following types of information are **never** exposed in public repositories:

1. **User's Original Prompts**: Raw, unpolished user requests are not included in PR descriptions or commits
2. **Internal Planning**: Private discussions and planning materials remain confidential
3. **Sensitive Configuration**: AI assistant instructions and internal guidelines are local-only
4. **Personal Information**: User details, preferences, and private communications are protected

### How We Protect It

- **`.gitignore`**: Excludes sensitive files from version control
- **Professional Communication**: All public materials use polished, professional language
- **AI Assistant Guidelines**: Clear instructions prevent exposure of private information
- **Code Review**: All changes are reviewed to ensure privacy standards are maintained

## Public Communication Standards

All public-facing materials (PR descriptions, commit messages, documentation) must:

- Use professional, technical language
- Focus on the solution, not the original request
- Protect user privacy
- Maintain brand consistency
- Provide clear, valuable information

## Verification

You can verify that sensitive files are properly protected:

```bash
# Check that copilot-instructions.md is ignored
git check-ignore -v .github/copilot-instructions.md

# List only committed files (should not include copilot-instructions.md)
git ls-files

# Verify .gitignore is working
git status --ignored
```

## Reporting Issues

If you notice any privacy concerns or exposed sensitive information:

1. **Do not share or publicize the exposure**
2. Contact the repository maintainers immediately
3. If it's a security issue, follow our Security Policy

## For AI Assistants

AI assistants working in this organization must:

- Read and follow `.github/copilot-instructions.md` (local file)
- Never expose user's original prompts in public materials
- Maintain professional communication standards
- Protect all sensitive information
- Follow security best practices

## Questions

For questions about privacy and security practices, please contact the repository maintainers.
