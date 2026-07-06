# SEO Rocket (education)

Public summary of how iSystem ships **complete** web product metadata — for good practice, not proprietary deploy paths.

Live examples: [imeter.isystem.app](https://imeter.isystem.app) · [isystem.app](https://isystem.app)

---

## What SEO Rocket means

A **full launch bundle** before you share a URL:

| Layer | Includes |
|-------|----------|
| **Search** | Title, description, canonical, `robots.txt`, `sitemap.xml` |
| **Social** | Open Graph + Twitter cards, **1200×630** hero image, alt text |
| **PWA** | `manifest.webmanifest`, icons 192+512, `theme-color` |
| **Structured data** | JSON-LD (`Product` or `WebApplication` + Organization) |
| **Privacy** | Consent-gated analytics (Consent Mode v2) — no GA until accept |
| **Brand** | Dark-first imagery, professional copy, link to [isystem.app](https://isystem.app) |

---

## Social copy workflow

Write copy **first** in a small table:

- Page title (≤60 chars)
- Meta description (≤155)
- OG title + description (slightly richer)
- Twitter description
- PWA `short_name` + `description`

Then paste into HTML `<head>` — do not improvise in markup.

---

## Image checklist

| Asset | Size |
|-------|------|
| OG / share image | **1200×630** JPG or PNG |
| PWA icons | 192 and 512 PNG |
| Hero (on-page) | SVG or 16:9 raster, dark brand |

After deploy, validate share preview: [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)

---

## Anti-patterns we avoid

- Missing `og:image` (random social crop)
- Relative OG URLs (must be absolute `https://…`)
- White form controls on dark UI
- Analytics without cookie consent
- Shipping HTML without sitemap/robots

---

## More

- Engineering bar: [ENGINEERING_PRINCIPLES.md](ENGINEERING_PRINCIPLES.md)
- Contribution flow: [WORKFLOW.md](WORKFLOW.md)
- Live products: [isystem.app](https://isystem.app)

*DIODAC ELECTRONICS / iSystem Development*
