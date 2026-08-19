# GitHub Wiki — sync from repo

The **source of truth** is [`docs/`](../docs/) in this repository.  
The [org wiki](https://github.com/iSystemDevelopment/.github/wiki) is a **read-friendly mirror** for contributors who prefer the Wiki UI.

---

## One-time setup

```bash
git clone https://github.com/iSystemDevelopment/.github.wiki.git
```

If the wiki repo does not exist yet: on GitHub → **iSystemDevelopment/.github** → **Wiki** → **Create the first page** (creates the wiki git repo).

---

## Sync (after editing `wiki/*.md` here)

```powershell
cd path\to\.github.wiki
# Copy from this repo:
Copy-Item "..\iSystemDevelopment.github\.github\wiki\*.md" . -Force
git add .
git commit -m "Sync wiki from .github/wiki"
git push
```

Wiki filenames map to page titles:

| File | Wiki page |
|------|-----------|
| `Home.md` | Home |
| `Onboarding.md` | Onboarding |
| `AI-Orchestration.md` | AI-Orchestration |
| `FAQ.md` | FAQ |

---

## Editing policy

1. Edit **`docs/`** first (full detail).  
2. Update matching **`wiki/`** summary if the wiki is in use.  
3. Push wiki git separately from main `.github` repo.

---

## Disable wiki?

If you prefer docs-only, remove wiki links from [profile/README.md](../profile/README.md) and use:

`https://github.com/iSystemDevelopment/.github/tree/main/docs`
