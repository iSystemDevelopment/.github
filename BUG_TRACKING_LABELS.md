# Bug Tracking Labels Guide

This document describes the labels used by the automated bug tracking system.

## Severity Labels

These labels indicate the severity level of a bug:

- `severity: critical` - Critical bugs that cause crashes, data loss, or security issues
- `severity: high` - High priority bugs that break functionality
- `severity: medium` - Medium priority bugs with incorrect or unexpected behavior
- `severity: low` - Low priority bugs like UI issues or typos

## Category Labels

These labels categorize the type of bug:

- `category: security` - Security-related issues
- `category: performance` - Performance and optimization issues
- `category: ui` - User interface bugs
- `category: api` - API endpoint issues
- `category: database` - Database-related bugs
- `category: general` - General bugs not fitting other categories

## Status Labels

These labels indicate the current status:

- `bug` - Confirmed bug report
- `needs-triage` - Needs review and prioritization
- `needs-reproduction-steps` - Missing steps to reproduce
- `needs-environment-info` - Missing environment details
- `in-progress` - Fix is being worked on
- `ready-for-review` - Fix ready for code review
- `fixed` - Bug has been fixed

## Creating Labels

To create these labels in your repository, run:

```bash
# Severity labels
gh label create "severity: critical" --color "d73a4a" --description "Critical priority bug"
gh label create "severity: high" --color "ff6b6b" --description "High priority bug"
gh label create "severity: medium" --color "fbca04" --description "Medium priority bug"
gh label create "severity: low" --color "0e8a16" --description "Low priority bug"

# Category labels
gh label create "category: security" --color "b60205" --description "Security-related issue"
gh label create "category: performance" --color "1d76db" --description "Performance issue"
gh label create "category: ui" --color "c5def5" --description "UI/UX issue"
gh label create "category: api" --color "5319e7" --description "API-related issue"
gh label create "category: database" --color "006b75" --description "Database issue"
gh label create "category: general" --color "d4c5f9" --description "General bug"

# Status labels
gh label create "needs-reproduction-steps" --color "fef2c0" --description "Missing reproduction steps"
gh label create "needs-environment-info" --color "fef2c0" --description "Missing environment information"
gh label create "in-progress" --color "0052cc" --description "Work in progress"
gh label create "ready-for-review" --color "0e8a16" --description "Ready for code review"
gh label create "fixed" --color "2ea043" --description "Bug has been fixed"
```

## Automated Label Application

The bug tracker workflow automatically applies labels based on:

1. **Keywords in title and description** - Scans for severity indicators
2. **Bug category detection** - Identifies the type of issue
3. **Content analysis** - Checks for reproduction steps and environment info

Labels are applied immediately when a bug report is created or reopened.
