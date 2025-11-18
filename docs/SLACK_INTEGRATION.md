<!--
╔═══════════════════════════════════════════════════════════════════╗
║        🚀 DREAMTEAM SLACK INTEGRATION — ORG TEMPLATE             ║
╠═══════════════════════════════════════════════════════════════════╣
║ Setup and best practices — copy/adapt per project!               ║
╚═══════════════════════════════════════════════════════════════════╝
-->

# SLACK_INTEGRATION.md — AI-Human Dreamteam (Org Standard)

> Use this guide to connect your project/team Slack channels to Dreamteam workflows and notifications.

---

## Why Slack Integration?

Real-time notifications, handoff visibility, and human/AI chatbots greatly improve Dreamteam communication and productivity.

---

## Standard Setup Steps

1. **Create a Project Channel**
   - Use clear naming: `#smart-inventory-builder`, `#ai-orchestration`, etc.
2. **Invite Team Members & AI Bots**
   - Humans: By email/invite link.
   - AI Bots: via Slack bot integrations (e.g., GitHub App, custom webhook, OpenAI/Claude/Gemini Slack integrations).
3. **Connect GitHub Notifications**
   - Use Slack's GitHub integration for PRs/issues/activity logs.
   - For advanced: Set up webhook for AI_ACTIVITY_LOG.md updates, custom message formatting, or ChatBot answers.

---

## Example: Custom Dreamteam Notifications

```yaml
- When a feature is handed off between AIs → Announce in Slack
- When security alerts occur → Ping #security
- Daily summary from AI_ACTIVITY_LOG.md → Post to #team-standup
```

---

## Helpful Links

- [Slack GitHub Integration Docs](https://slack.github.com/integrations/github)
- [Dreamteam ChatBot Setup](html/index.html) _(In Progress)_

---

## Escalation Path

- Urgent: @Dr-Diodac in Slack
- Security: @Claude (or tag Lead AI in channel)
- Docs/Onboarding: @ChatGPTPro, @GeminiUltra

---

# Document Metadata
version: 1.0.0
last_updated: 2025-11-18
last_updated_by: AI-Human Dreamteam
next_review: 2025-12-01
stability: stable
---
