# Organization Security and Community Health Files

This repository contains default community health files and security configurations for the iSystemDevelopment organization. These files are automatically used across all repositories in the organization unless overridden by repository-specific configurations.

## 🔒 Security Configuration

### Security Policy (SECURITY.md)
Defines our organization's security vulnerability disclosure policy and reporting procedures.

### Dependabot (`.github/dependabot.yml`)
Automated dependency updates for multiple package ecosystems:
- npm (JavaScript/Node.js)
- pip (Python)
- Maven & Gradle (Java)
- NuGet (.NET)
- Go modules
- Cargo (Rust)
- Composer (PHP)
- Docker
- GitHub Actions

**Schedule**: Weekly updates every Monday at 09:00 UTC

### Security Workflows

#### CodeQL Analysis (`.github/workflows/codeql-analysis.yml`)
Automated code security scanning supporting:
- JavaScript/TypeScript
- Python
- Java
- C#
- Go
- Ruby
- C/C++

**Triggers**: Push to main branches, pull requests, and weekly scheduled scans

#### Dependency Review (`.github/workflows/dependency-review.yml`)
Reviews pull requests for:
- Vulnerable dependencies
- License compliance
- Security advisories

**Severity Thresholds**:
- Fails on: High and Critical vulnerabilities
- Warns on: Moderate and Low vulnerabilities

#### Secret Scanning Alerts (`.github/workflows/secret-scanning-alert.yml`)
Automatically creates issues when secrets are detected in the codebase.

#### Smart Credential Sanitizer (`.github/workflows/smart-sanitizer.yml`)
Advanced credential protection for public repositories:
- **Real-time Detection** - Scans for 10+ credential types
- **Automatic Sanitization** - Replaces credentials with secure placeholders
- **Placeholder Format** - `[REDACTED_<TYPE>_<HASH>]`
- **Zero Storage** - Original credentials never saved
- **Instant Response** - Auto-commits sanitized code
- **Security Alerts** - Creates detailed incident reports

**Detection Capabilities:**
- AWS Keys, GitHub Tokens, API Keys
- Passwords, Private Keys, JWT Tokens
- Slack Tokens, Google API Keys
- Database Connection Strings

**Triggers**: Push, pull requests, daily scans (02:00 UTC), manual

See [SMART_SANITIZER_GUIDE.md](SMART_SANITIZER_GUIDE.md) for complete documentation.

#### Bug Tracker (`.github/workflows/bug-tracker.yml`)
Automated bug tracking and analysis system:
- Automatic severity classification (critical, high, medium, low)
- Category detection (security, performance, UI, API, database)
- Intelligent labeling
- Analysis comments with fix suggestions
- Missing information detection

**Triggers**: New bug reports, labeled issues, reopened bugs

#### Bug Fix Assistant (`.github/workflows/bug-fix-assistant.yml`)
Automated bug fixing capabilities:
- Dependency updates
- Security patches
- Linting auto-fixes
- Code formatting
- Automated PR creation

**Triggers**: Manual workflow dispatch

## 🐛 Bug Tracking and Auto-Fix System

### Bug Tracker Workflow
Automated bug report analysis and tracking:
- **Severity Classification**: Automatically categorizes as critical, high, medium, or low
- **Category Detection**: Identifies security, performance, UI, API, database, or general bugs
- **Smart Labeling**: Applies relevant labels based on content analysis
- **Analysis Comments**: Posts detailed analysis with fix suggestions
- **Quality Checks**: Flags missing reproduction steps or environment info

See [BUG_TRACKING_GUIDE.md](BUG_TRACKING_GUIDE.md) for complete documentation.

### Bug Fix Assistant
Automated fixing for common bug types:
- Dependency updates
- Security patches
- Linting fixes
- Code formatting
- Creates pull requests with fixes

**Usage**: Manually trigger from Actions tab with issue number and fix type.

## 📋 Issue Templates

- **Bug Report**: Structured bug reporting with security considerations
- **Feature Request**: Feature proposal template
- **Config**: Redirects security issues to GitHub Security Advisories

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines and security best practices.

## 📝 Pull Request Template

Our PR template includes security checklists to ensure:
- No security vulnerabilities introduced
- No hardcoded secrets
- Proper input validation
- Dependency security checks

## 🔧 Workflow Templates

### Secure CI/CD Template (`workflow-templates/secure-ci-cd.yml`)
A starter workflow template with security best practices:
- Minimal permissions by default
- Security scanning integration
- Secure credential handling
- Artifact management

## Implementation Status

✅ Security policy documentation  
✅ Dependabot configuration for 10+ ecosystems  
✅ CodeQL security scanning workflow  
✅ Dependency review workflow  
✅ Secret scanning alert automation  
✅ Smart credential sanitizer with placeholder replacement  
✅ Bug tracking and auto-fix system  
✅ Issue templates with security focus  
✅ Pull request template with security checklist  
✅ Contributing guidelines  
✅ Secure CI/CD workflow template  
✅ Comprehensive security documentation  

## Usage

These files are automatically applied to all repositories in the organization. To override any file in a specific repository, create a file with the same name in that repository's `.github` folder or root directory.

## License

These configurations follow GitHub's recommended best practices for organization security and community health.