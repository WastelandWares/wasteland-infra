# WastelandWares Brand Execution Plan

**Issue:** wasteland-infra #18
**Date:** 2026-03-12
**Author:** Dev Team Lead (synthesis of 3 research agents)
**Status:** Ready for execution

---

## Research Synthesis

Three parallel research agents produced findings on brand landscape, product portfolio, and site technology. Key insights:

### Brand Direction: "Post-Apocalyptic Precision Engineering"

The wasteland theme is a genuine differentiator in dev tool branding. Every competitor (Vercel, Linear, Stripe, Railway) uses abstract geometric minimalism. WastelandWares' thematic identity is memorable *if* executed with discipline.

**The aesthetic:** Not chaos — discipline. The bunker workshop. The terminal glow. Infrastructure that survives. Precision engineering after the old systems have fallen.

**The lesson from top brands:** Trust comes from restraint. Stripe uses 3 colors. Linear uses 1 accent. The best brands do less, better. Apply this to the wasteland theme: atmosphere, not costume.

### Multi-Product Strategy: Endorsed Brand

The portfolio (auth tool + dungeon game + AI scribe + programming language + orchestrator) is too diverse for a single visual template but too connected for fully independent identities.

**Model:** WastelandWares is the parent brand. Products carry the endorsement but have their own personality. Shared: typography, dark theme, logo, domain. Per-product: accent color, icon, immersive freedom.

### Tech Stack: Astro

Astro is the clear winner for a multi-page brand site. Zero JS by default, HTML-first components, content collections for product data, Vite-powered dev. Outputs pure static files for rsync to Caddy.

---

## Brand Direction Options

### Option A: "Terminal" — Full Monospace Identity (Recommended)

Lean completely into the monospace/terminal aesthetic. JetBrains Mono for *everything*. The entire site feels like a beautifully designed terminal interface. This is what makes WastelandWares unique — no other dev tool brand goes full monospace.

**Colors:**
- Background: `#0a0a0f` (very slightly blue-tinted near-black)
- Surface: `#12121a`
- Border: `#1e1e2e`
- Text primary: `#e8e8f0`
- Text secondary: `#7a7a90`
- Text dim: `#4a4a5e`
- Signature gradient: `#22d3ee` → `#00e88f` (cyan to green)
- Category accents: Green `#00e88f`, Cyan `#22d3ee`, Yellow `#ffc857`, Purple `#a78bfa`, Orange `#f97316`

**Typography:** JetBrains Mono only. Weights: 300 (body), 400 (normal), 600 (emphasis), 800 (headings).

**Visual elements:**
- Grid background (current, refined)
- Hexagonal W logo (current, refined with tighter geometry)
- Subtle scan-line texture on hover states
- Corner markers on featured cards (terminal-inspired `┌─` frames)
- Category color-coded left borders (current, keep)
- One signature gradient moment per page (hero text, not everywhere)

**Voice:** Direct. Competent. Occasionally wry. Short sentences. No exclamation marks. "Building things in the wasteland."

**Why this option:** It's the natural evolution of what exists. The current site already *is* this — it just needs to be more intentional and consistent about it. Full monospace is a bold choice that every research finding supports as a differentiator.

---

### Option B: "Dual Type" — Monospace + Sans Serif

JetBrains Mono for headings, UI chrome, and code. Inter or Space Grotesk for body text. This improves long-form readability while keeping the terminal identity.

**Same colors and visual language as Option A**, but with:
- **Space Grotesk** (already loaded in wasteland-hq) for body paragraphs, product descriptions, long text
- **JetBrains Mono** for headlines, navigation, labels, code blocks
- The type contrast creates visual hierarchy

**Why this option:** Better for pages with lots of text (about, brand guidelines, blog). The current homepage imports Space Grotesk but doesn't use it — this would activate it.

**Risk:** Dilutes the "terminal" identity. Two typefaces instead of one means the brand is less distinctive.

---

### Option C: "Refined Current" — Minimal Changes

Keep everything as-is but expand to multi-page. Same single HTML approach but with a shared header/footer via includes or Astro.

**Why this option:** Lowest effort, least risk.

**Risk:** Doesn't evolve the brand. Misses the opportunity to establish a real design system.

---

## Recommendation: Option A with Option B Fallback

Start with Option A (full monospace). If readability suffers on text-heavy pages, selectively introduce Space Grotesk for body text on those specific pages (Option B). This preserves the distinctive identity as the default and only compromises where necessary.

---

## Execution Plan

### Phase 1: Foundation (Astro scaffold + brand tokens)

**Goal:** Get the build system working and establish design tokens.

1. **Scaffold Astro project** in the worktree at `site/`
   - `npm create astro@latest site/`
   - Configure for static output
   - Set up project structure per site-tech.md recommendation

2. **Create global.css** with all design tokens
   - Full color palette (backgrounds, text, accents, category colors)
   - Typography (self-hosted JetBrains Mono woff2)
   - Spacing scale (4px base)
   - Border radius, shadow, transition standards
   - Grid background pattern
   - Gradient text utility

3. **Create BaseLayout.astro**
   - HTML shell with meta tags, font loading
   - Grid background
   - Nav component slot
   - Footer component slot
   - Open Graph tags for social sharing

4. **Create Nav.astro**
   - Small logo + "WastelandWares" wordmark
   - Page links: Home, Products, About, Brand
   - Mobile hamburger menu
   - Subtle, doesn't compete with content

5. **Create Footer.astro**
   - Status pulse dot + "Systems operational"
   - Links: GitHub, Whitepapers
   - Copyright

### Phase 2: Pages (content implementation)

6. **Index/Hero page (index.astro)**
   - Evolve current landing page design
   - Large animated W logo
   - "Wasteland Wares" gradient heading
   - "Building things in the wasteland" tagline
   - Product grid preview (top 4-5 products)
   - CTA to Products page

7. **Products page (products.astro)**
   - Full product catalog
   - ProductCard.astro component with:
     - Category color dot + left border
     - Product name + one-line description
     - Category label
     - Link to product (external site or docs)
   - Category filter/grouping
   - Content sourced from markdown files in `content/products/`

8. **About page (about.astro)**
   - "Building in the wasteland" philosophy
   - Solo developer studio story
   - AI-native development methodology
   - Technical stack overview
   - Links to GitHub org

9. **Brand Guidelines page (brand.astro)**
   - Public-facing version of the brand guidelines
   - Color palette with swatches
   - Typography specimens
   - Logo usage rules
   - Voice and tone guide
   - Product category system

### Phase 3: Brand Guidelines Document

10. **Create docs/brand-guidelines.md**
    - The canonical reference document
    - Full color palette with hex values and usage rules
    - Typography system
    - Logo (SVG, usage rules, clear space)
    - Voice and tone guide
    - Product category color system
    - Dark theme requirements
    - Do's and don'ts
    - Minimum viable rules (the one-page cheat sheet)

### Phase 4: Polish + Deploy

11. **Responsive design pass**
    - Test at 375px (mobile), 768px (tablet), 1024px+
    - Ensure nav works on mobile

12. **Performance audit**
    - Lighthouse score check
    - Font loading optimization
    - Image optimization (if any)

13. **Deploy**
    - Build with `astro build`
    - Deploy to wastelandwares.com via rsync

14. **PR + Review**
    - Create PR targeting `_dev`
    - Link to tracking issue #18
    - Include before/after screenshots

---

## Product Content Data

For the products page, each product entry needs:

```yaml
# Example: content/products/claude-gate.md
---
name: claude-gate
tagline: "Biometric permission gating for AI agents"
category: security
color: orange
url: https://github.com/WastelandWares/claude-gate
status: beta
description: "Touch ID-gated sudo for Claude Code. Intercepts dangerous AI tool calls and gates them behind hardware biometric authentication."
---
```

Products to include:
1. **claude-gate** — Security & Auth — "Biometric gates for AI agents"
2. **dungeon-crawler** — Games — "D&D 3.5e web dungeon crawler"
3. **meeting-scribe** — AI-Productivity — "AI meeting transcription + notes"
4. **neuroscript-rs** — Languages — "Neural architecture programming language"
5. **wasteland-orchestrator** — Infrastructure — "Multi-agent workflow orchestration"
6. **wasteland-hq** — Infrastructure — "Real-time agent monitoring dashboard"

(JARLF and dnd-tools omitted for now — JARLF is pre-alpha, dnd-tools overlaps with dungeon-crawler)

---

## Success Criteria

- [ ] Astro site builds and produces static output
- [ ] All 4 pages render correctly
- [ ] Design tokens match brand direction
- [ ] Products page shows full portfolio with category colors
- [ ] Brand guidelines page documents the full system
- [ ] docs/brand-guidelines.md is the canonical reference
- [ ] Mobile responsive
- [ ] Lighthouse performance > 90
- [ ] Deployed to wastelandwares.com
- [ ] PR created, reviewed, merged to _dev

---

## Needs-Human Decision Points

1. **Brand direction:** Option A (full monospace) vs Option B (dual type)? I'm proceeding with A unless Thomas objects.
2. **Product inclusion:** Omitting JARLF and dnd-tools from the public site. Correct?
3. **Tagline:** Keeping "Building things in the wasteland" — change desired?
4. **Logo:** Evolving current hexagonal W, not redesigning from scratch. Agree?
