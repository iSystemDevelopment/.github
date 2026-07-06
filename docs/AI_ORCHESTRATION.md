# AI orchestration — org standard

How we use AI **without** replacing human judgment.  
**Full policy (private monorepo):** `isystem-codebase/docs/AI_AGENT_POLICY.md` (org members).

---

## Roles

| Role | Owner | Responsibility |
|------|--------|----------------|
| Lead | Dr. Diodac | Scope, architecture, merge, production |
| Implementer | Dev + AI | Focused diffs, tests |
| Reviewer | Human | Correctness, security |

---

## Session workflow

1. Define outcome in writing  
2. Human confirms plan  
3. Implement — small diffs, repo conventions  
4. Verify — tests + web QA (390 / 768 / 1400 px)  
5. **Change report** — files, line ranges, why, risks (see policy)  
6. Human merges PR  

---

## AI must not (alone)

- Merge, deploy production, or force-push  
- Commit secrets or restore **retired** hosts/repos (see org `RETIRED` guidance in monorepo)  
- Add markdown/docs the user did not ask for  

---

## Standards

- Public hub: [isystem.app](https://isystem.app)  
- Private SSOT: `isystem-codebase` (org members)  
- Guards: monorepo `docs/GUARD_RULES.md`  

---

## Related

- [foundation-index.md](foundation-index.md)
- [promotion-workflow.md](promotion-workflow.md)
- [public-export-checklist.md](public-export-checklist.md)
- [WORKFLOW.md](WORKFLOW.md)  
- [ENGINEERING_PRINCIPLES.md](ENGINEERING_PRINCIPLES.md)  
- [ONBOARDING.md](ONBOARDING.md)
