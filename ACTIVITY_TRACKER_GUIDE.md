# Activity Tracker and Advisory System

## Overview

The Activity Tracker is an intelligent monitoring system that tracks user activities across the repository and provides automated guidance when potential issues or wrongdoings are detected. This system acts as a helpful advisor, offering solutions and best practices recommendations in real-time.

## Purpose

The Activity Tracker helps maintain code quality, security, and collaboration best practices by:

- **Monitoring** all repository activities
- **Detecting** potential issues or problematic patterns
- **Providing** immediate, helpful feedback
- **Recommending** solutions and best practices
- **Educating** team members on proper workflows

## What It Tracks

### Push Events
- Force pushes to shared branches
- Commits with poor or incomplete messages
- Commits referencing sensitive information
- Direct commits to protected branches
- Work-in-progress commits

### Pull Requests
- Oversized pull requests
- Work-in-progress PRs
- Missing or inadequate descriptions
- Changes without proper context

### Branch Operations
- Branch deletions (especially protected branches)
- Branch creation patterns

### Issue Activities
- Issue creation and editing
- Label management
- Issue closure patterns

### Workflow Executions
- Failed workflow runs
- Unusual patterns

## Issue Detection

### Critical Issues (🚨)

**Detected:**
- Main/master branch deletion
- Commits containing "password", "secret", "key" in messages
- Force pushes to main branches

**Response:**
- Immediate tracking issue created
- Detailed advisory posted
- Urgent label applied

**Example Advisory:**
```
🚨 Critical Activity Alert

Issue: Main branch deletion attempted
Details: Branch: main

Recommended Solution:
- Never delete main branches
- Restore the branch immediately
- Enable branch protection rules
```

### High Priority Issues (⚠️)

**Detected:**
- Force pushes to any branch
- Security-related commit messages

**Response:**
- Advisory comment posted
- Recommendations provided

**Example Advisory:**
```
⚠️ High Priority Issue

Issue: Force push detected
Details: Force pushed to feature/user-auth

Recommended Solution:
- Avoid force pushing to shared branches
- Use revert commits instead
- Create new branch and PR if major changes needed
```

### Medium Priority Issues (⚡)

**Detected:**
- Work-in-progress commits
- Large pull requests (>500 lines)
- Direct commits to main branch

**Response:**
- Helpful suggestions provided
- Best practices recommended

**Example Advisory:**
```
⚡ Medium Priority Issue

Issue: Large pull request
Details: 847 lines changed in 23 files

Recommended Solution:
- Break large changes into smaller, focused PRs
- Split this PR into multiple smaller PRs
- Each PR should address a specific concern
```

### Low Priority Issues (ℹ️)

**Detected:**
- Poor commit messages
- Work-in-progress PR titles
- Missing PR descriptions

**Response:**
- Educational guidance
- Improvement suggestions

**Example Advisory:**
```
ℹ️ Low Priority Issue

Issue: Non-descriptive commit message
Details: Commit: "update"

Recommended Solution:
- Write clear, descriptive commit messages
- Follow format: "type: brief description"
- Example: "fix: resolve login timeout issue"
```

## Advisory Reports

When issues are detected, the system generates comprehensive reports:

### Report Structure

```markdown
## 🚨 Activity Advisory Report

**User:** @username
**Event:** push
**Timestamp:** 2025-11-15T18:45:00Z
**Severity:** HIGH

### 🔍 Issues Detected (2)

#### ⚠️ High Priority Issues

- **Force push detected**
  - Force pushed to feature/auth-system

#### ℹ️ Low Priority Issues

- **Non-descriptive commit message**
  - Commit: "fix"

### 💡 Recommended Solutions

1. **Force Push**
   - Solution: Avoid force pushing to shared branches
   - Action: Use revert commits instead

2. **Poor Commit Message**
   - Solution: Write clear, descriptive commit messages
   - Action: Follow format: "type: brief description"

### 📚 Best Practices

- ✅ Write clear, descriptive commit messages
- ✅ Use feature branches and pull requests
- ✅ Keep PRs small and focused
- ✅ Never commit sensitive information

### 🔗 Resources

- [Git Best Practices](../CONTRIBUTING.md)
- [Security Policy](../SECURITY.md)
```

## How It Works

### 1. Activity Detection
```
User Action → Workflow Trigger → Data Collection
```

### 2. Analysis
```
Collected Data → Pattern Matching → Issue Identification
```

### 3. Advisory Generation
```
Issues Found → Solution Mapping → Report Creation
```

### 4. Response
```
Report → Posted as Comment / Issue → User Notified
```

## Detected Patterns

### Commit Message Analysis

**Bad Examples:**
- ❌ "update"
- ❌ "fix"
- ❌ "changes"
- ❌ "WIP: working on it"
- ❌ "added password for production"

**Good Examples:**
- ✅ "fix: resolve authentication timeout issue"
- ✅ "feat: add user profile editing feature"
- ✅ "docs: update API documentation"
- ✅ "refactor: improve database query performance"

### Pull Request Size

| Lines Changed | Status | Recommendation |
|--------------|--------|----------------|
| < 100 | ✅ Good | Easy to review |
| 100-300 | ✅ Acceptable | Reasonable size |
| 300-500 | ⚠️ Large | Consider splitting |
| > 500 | 🚨 Too Large | Must split into smaller PRs |

### Branch Operations

| Action | Protected Branch | Regular Branch | Advisory |
|--------|-----------------|----------------|----------|
| Delete | 🚨 Critical | ℹ️ Info | Restore immediately / Confirm intentional |
| Force Push | 🚨 Critical | ⚠️ High | Never do this / Avoid on shared branches |
| Direct Commit | ⚡ Medium | ✅ OK | Use PRs / Normal workflow |

## Recommendations by Issue Type

### Force Push
**Solution:** Avoid force pushing to shared branches  
**Action:** Use revert commits or create a new branch  
**Prevention:** Enable branch protection rules

### Poor Commit Messages
**Solution:** Write descriptive messages  
**Action:** Follow conventional commit format  
**Prevention:** Use commit message templates

### Large PRs
**Solution:** Break into smaller, focused PRs  
**Action:** Split by feature/concern  
**Prevention:** Plan changes before coding

### Direct Main Commits
**Solution:** Use pull request workflow  
**Action:** Enable branch protection  
**Prevention:** Set up pre-push hooks

### WIP Commits
**Solution:** Complete work before committing  
**Action:** Use feature branches  
**Prevention:** Use draft PRs for incomplete work

### Sensitive Info in Messages
**Solution:** Never reference credentials  
**Action:** Review commit for exposure  
**Prevention:** Use generic descriptions

## Configuration

### Severity Thresholds

Customize in workflow file:

```yaml
# Critical: Creates tracking issue
severity: critical
triggers:
  - main_branch_deletion
  - sensitive_commit_message
  - force_push_to_main

# High: Posts advisory
severity: high
triggers:
  - force_push
  - security_reference

# Medium: Provides guidance
severity: medium
triggers:
  - large_pr
  - wip_commit
  - direct_main_commit

# Low: Educational tips
severity: low
triggers:
  - poor_commit_message
  - missing_pr_description
```

### Excluded Users

Add to workflow to exclude specific users from tracking:

```yaml
if: github.actor != 'dependabot[bot]' && github.actor != 'github-actions[bot]'
```

## Benefits

### For Individual Contributors

- **Immediate Feedback** - Learn best practices in real-time
- **Mistake Prevention** - Catch issues before they become problems
- **Skill Development** - Improve Git and collaboration skills
- **Guidance** - Clear solutions for common mistakes

### For Team Leads

- **Quality Assurance** - Maintain high code quality standards
- **Consistency** - Enforce consistent practices across team
- **Visibility** - Track problematic patterns
- **Education** - Automate training on best practices

### For Organizations

- **Risk Reduction** - Prevent security and quality issues
- **Compliance** - Enforce policies automatically
- **Efficiency** - Reduce manual code review time
- **Standards** - Maintain consistent quality

## Privacy and Respect

The Activity Tracker is designed to be:

- **Helpful, not punitive** - Focuses on education and improvement
- **Transparent** - All tracking is visible and documented
- **Constructive** - Provides solutions, not just criticism
- **Fair** - Applies same rules to everyone
- **Privacy-conscious** - Only tracks repository activities

## Best Practices

### For All Users

1. **Review Advisories** - Read and understand feedback
2. **Apply Recommendations** - Implement suggested solutions
3. **Ask Questions** - Seek clarification when needed
4. **Learn Continuously** - Use feedback to improve
5. **Follow Guidelines** - Adopt best practices proactively

### Commit Message Format

```
<type>: <brief description>

<optional detailed description>

<optional footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Test changes
- `chore`: Maintenance tasks

### Pull Request Guidelines

- Keep changes under 500 lines when possible
- Provide detailed descriptions
- Reference related issues
- Use draft PRs for work in progress
- Request reviews from appropriate team members

### Branch Management

- Create feature branches from main
- Use descriptive branch names
- Delete branches after merge
- Never delete main/master branches
- Avoid force pushing to shared branches

## Troubleshooting

### False Positives

If you receive an advisory you believe is incorrect:

1. Review the specific issue identified
2. Check if it matches the detected pattern
3. Contact repository administrators if needed
4. Provide feedback for pattern improvement

### Advisory Not Posted

Possible reasons:
- Event type not monitored
- User excluded from tracking
- Workflow permissions issue
- Check Actions tab for workflow status

### Too Many Advisories

If receiving excessive advisories:
- Review your workflow practices
- Consult [CONTRIBUTING.md](CONTRIBUTING.md)
- Ask for team guidance
- Take time to understand best practices

## Metrics and Reporting

The tracker logs:
- Total activities monitored
- Issues detected by severity
- User-specific patterns
- Common issue types
- Resolution rates

Access logs in Actions tab under workflow runs.

## Future Enhancements

Planned improvements:
- Machine learning for pattern detection
- Personalized recommendations
- Trend analysis and dashboards
- Integration with project management
- Custom rule configuration
- Team-specific guidance

## Support

For help with the Activity Tracker:

1. Review this documentation
2. Check workflow logs in Actions tab
3. Consult [CONTRIBUTING.md](CONTRIBUTING.md)
4. Contact repository administrators
5. Submit feedback via issues

## Feedback

We welcome feedback on the Activity Tracker:

- Suggest new patterns to detect
- Recommend better solutions
- Report false positives
- Request new features

Submit feedback via repository issues with label `activity-tracker`.

---

**Philosophy:** The Activity Tracker is a mentor, not a monitor. Its purpose is to help everyone write better code, maintain security, and collaborate effectively.

**Remember:** Everyone makes mistakes. The tracker helps us learn from them and continuously improve.

**Last Updated:** 2025-11-15  
**Version:** 1.0.0  
**Maintained by:** Organization Development Team
