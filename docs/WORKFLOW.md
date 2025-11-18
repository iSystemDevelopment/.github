<!--
╔═══════════════════════════════════════════════════════════════════╗
║          🚀 DREAMTEAM WORKFLOW — ORG TEMPLATE                    ║
╠═══════════════════════════════════════════════════════════════════╣
║   Use this for all org projects; adapt to repo per deployment.   ║
╚═══════════════════════════════════════════════════════════════════╝
-->

# WORKFLOW.md — Org Standard (adapt in repo)

> _Reference and starting point for project workflow docs. Based on Claude/Copilot brainstorming and transcript.  
> See Smart Inventory Builder repo for tailored project workflow._

---

## 🚀 Development Workflow

### AI-Assisted Development Strategy

| Tool/Person | Primary Responsibilities | When to Use |
|------------|-------------------------|------------|
| **Claude** | Architecture, system design, complex algorithms, security audits, API integration, docs, review, CI/CD config | Planning, security/critical points, integrations |
| **ChatGPT Pro** | Feature ideation, algorithm design, business logic, UX flows, problem decomposition | Early design/featurization |
| **Gemini Ultra** | Google ecosystem architect, Apps Script, Google APIs, backend syncs | Google integrations/automation |
| **Copilot** | Coding assistant, real-time completion, boilerplate, tests | Coding, quick tasks, CRUD |

---

### Development Phases

1. **Planning Phase (Claude/ChatGPT Pro Assisted)**
   - Discuss architecture/design with AIs and human lead
   - Create design doc, review security, prepare integration specs
2. **Implementation Phase**
   - Feature branch per task (`feature/[feature-name]`)
   - Copilot for rapid dev, Claude/Gemini/ChatGPT collaboration
   - AI-assist notation in commits
3. **Review Phase**
   - Security audits (Claude), code quality, handoff accountability, sanitization for public sync
   - Integration testing
4. **Documentation Phase**
   - API endpoints, README, deployment guides
   - Full documentation coverage, activity log updates

---

## 📋 Project Roadmap (Template)

- Phase 1: Initial Deployment  
  - Core system, main integrations, setup
- Phase 2: Integration Enhancements  
- Phase 3: Optimization  
- Phase 4: Advanced Features  

---

## 🔒 Security Workflow

- Private-to-public sync requires sanitization, credential reviews, activity log check
- Sensitive data managed via secrets, .env files, access policies

---

## 🤖 AI Collaboration Success Metrics

- Code quality, test coverage, speedup, handoff effectiveness
- Weekly/monthly reviews, documentation completeness

---

## 🔗 Reference & Related Docs
- [ACCESS_CONTROL.md](ACCESS_CONTROL.md)
- [AI_ORCHESTRATION.md](AI_ORCHESTRATION.md)
- [AI_ACTIVITY_LOG.md](AI_ACTIVITY_LOG.md)
- [FAQ.md](FAQ.md)
- Project repo should reference this doc and apply customizations as needed.

---
# Document Metadata
version: 1.0.0
last_updated: 2025-11-18
last_updated_by: AI-Human Dreamteam
next_review: 2025-12-01
stability: stable
---
