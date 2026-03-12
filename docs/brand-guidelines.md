# WastelandWares Brand Guidelines

> Version 1.0 | 2026-03-12
> The canonical reference for all WastelandWares visual identity decisions.

---

## Brand Essence

**"Post-Apocalyptic Precision Engineering"**

WastelandWares builds things that survive. The brand communicates quiet competence,
resourcefulness, and engineering discipline. The wasteland theme is atmosphere,
not costume — it creates mood through dark backgrounds, terminal typography,
and grid patterns without resorting to grunge textures or apocalyptic imagery.

**Tagline:** Building things in the wasteland.

---

## Logo

The WastelandWares mark is a stylized "W" monogram inside a hexagonal shield.

- **Hexagon:** Engineering structure, molecular/crystalline precision
- **Gradient (cyan → green):** Transition from systems (cyan) to growth (green)
- **W monogram:** JetBrains Mono 800 weight

### Usage Rules

- Minimum clear space: 1x logo width on all sides
- Minimum display size: 32px
- Always display on dark backgrounds (#0a0a0f to #14141e)
- Never rotate, distort, or recolor the gradient
- Never place on busy backgrounds without sufficient contrast
- The logo SVG is the source of truth (see `site/public/favicon.svg`)

### Lockup

The full lockup combines the hexagonal mark with the "Wasteland Wares" wordmark
in JetBrains Mono 800 weight with the signature gradient applied.

---

## Color System

### Core Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `--bg-deep` | `#0a0a0f` | Page background |
| `--bg-base` | `#0e0e14` | Section backgrounds |
| `--bg-surface` | `#14141e` | Elevated surfaces |
| `--bg-card` | `#18182a` | Card backgrounds |
| `--bg-card-hover` | `#1e1e30` | Card hover state |
| `--text-primary` | `#e8e8f0` | Headings, primary content |
| `--text-secondary` | `#7a7a90` | Body text, descriptions |
| `--text-dim` | `#4a4a5e` | Labels, metadata, footers |
| `--border-subtle` | `#1e1e2e` | Default borders |
| `--border-accent` | `#2a2a3e` | Hover/focus borders |

### Signature Gradient

```css
linear-gradient(135deg, #22d3ee, #00e88f)
```

- **Cyan (#22d3ee):** Primary accent. Links, infrastructure references.
- **Green (#00e88f):** Secondary accent. Success states, CTAs, growth.

**Rule:** One gradient moment per page. Use for hero text, primary CTAs, and
the logo. Everything else uses solid colors.

### Category Accent Colors

Each product category has a designated accent color:

| Category | Color | Hex | Products |
|----------|-------|-----|----------|
| Security & Auth | Orange | `#f97316` | claude-gate, JARLF |
| Games & TTRPG | Green | `#00e88f` | dungeon-crawler, dnd-tools |
| Infrastructure | Cyan | `#22d3ee` | wasteland-orchestrator, wasteland-hq |
| AI Productivity | Purple | `#a78bfa` | meeting-scribe |
| Languages & Research | Yellow | `#ffc857` | neuroscript-rs |

### Color Usage Rules

1. All WastelandWares surfaces are dark. No light themes.
2. Category colors are accents only — used for dots, left borders, badges, not backgrounds.
3. The gradient is reserved for brand moments. Do not use it for regular UI elements.
4. Text never uses raw accent colors at full opacity for readability — dim or reduce weight.

---

## Typography

### Typeface: JetBrains Mono

JetBrains Mono is the sole typeface for all WastelandWares properties.
This is a deliberate differentiator — full monospace signals developer credibility
and reinforces the terminal/wasteland aesthetic.

**Weights used:**
- 800: Headings, brand name
- 600: Emphasis, labels, navigation
- 400: Normal text, UI elements
- 300: Body paragraphs, secondary text

### Type Scale

| Element | Size | Weight | Letter Spacing |
|---------|------|--------|---------------|
| h1 | 3rem (48px) | 800 | -0.03em |
| h2 | 2rem (32px) | 800 | -0.03em |
| h3 | 1.25rem (20px) | 800 | -0.03em |
| h4 | 1rem (16px) | 800 | -0.03em |
| Body | 0.875rem (14px) | 300 | normal |
| Small / Labels | 0.75rem (12px) | 400-600 | 0.05-0.15em |
| Taglines | 0.85rem (13.6px) | 300 | 0.2em uppercase |

### Font Loading

Self-host JetBrains Mono in woff2 format, subset to weights 300, 400, 600, 800.
During initial development, Google Fonts CDN is acceptable.

---

## Voice & Tone

### Core Attributes

- **Direct.** Short sentences. No filler words.
- **Competent.** Technical language is expected, not avoided.
- **Wry.** Occasional dry humor. Never forced. The wasteland permits it.
- **Precise.** Say what it does, not what it claims to be.
- **Quiet.** No exclamation marks. No superlatives.

### Do

- Write like documentation, not marketing copy
- Let the work speak for itself
- Use technical terms where appropriate
- Describe functionality, not aspirations
- Allow the wasteland theme in brand contexts (site, README headers)

### Don't

- Use exclamation marks
- Use superlatives (revolutionary, game-changing, cutting-edge, next-generation)
- Write more than necessary. If it needs three paragraphs, simplify.
- Use the wasteland theme in technical documentation or API references
- Be cute where precision is needed
- Add emoji to prose (code/status contexts are fine)

### Examples

| Bad | Good |
|-----|------|
| "We're excited to announce our revolutionary new AI-powered authentication system!" | "claude-gate gates dangerous AI operations behind Touch ID. Think sudo for agents." |
| "Experience the next generation of neural network design!" | "NeuroScript compiles .ns files to PyTorch code. Shape checking catches dimension mismatches at compile time." |
| "Our amazing orchestrator supercharges your workflow!" | "The orchestrator coordinates concurrent Claude agents. Status reporting, transaction logging, team dispatch." |

---

## Product Branding (Endorsed Brand Model)

WastelandWares is the parent brand. Products carry the endorsement but have
their own personality.

### Shared Across All Products

1. Dark theme foundation (background: `#0a0a0f` to `#14141e`)
2. JetBrains Mono typography
3. WastelandWares logo or "WastelandWares" wordmark in footer or about section
4. Link back to wastelandwares.com
5. Category accent color as primary product accent

### Product Freedom

1. Products may use additional colors beyond their category accent
2. Games may use display/pixel fonts alongside JetBrains Mono
3. Product landing pages may break the standard layout for immersion
4. Product icons should follow the hexagonal geometric language

### Product Badge

Every product includes one of:
- Small WastelandWares "W" hexagon mark in footer
- "A WastelandWares product" text in about/footer
- Link to wastelandwares.com

The badge should be present but not dominant. It endorses; it doesn't compete
with the product identity.

---

## Visual Elements

### Grid Background

A subtle CSS grid pattern provides depth on page backgrounds:

```css
background-image:
  linear-gradient(rgba(30, 30, 46, 0.3) 1px, transparent 1px),
  linear-gradient(90deg, rgba(30, 30, 46, 0.3) 1px, transparent 1px);
background-size: 60px 60px;
```

Use on page-level backgrounds only. Not on cards or surfaces.

### Card Design

- Background: `--bg-card` / `--bg-card-hover`
- Border: 1px solid `--border-subtle`
- Left accent: 3px solid category color
- Border radius: 10px (`--radius-md`)
- Hover: translateY(-2px) + box-shadow

### Status Indicators

- Green pulse dot for "operational" status
- Category-colored dots for product identification
- Dot size: 6-10px with optional glow shadow

### Animations

- Gentle, not distracting
- Float: 6s ease-in-out (logo only)
- Pulse: 2s ease-in-out (status dots)
- Hover transitions: 0.15-0.25s ease
- Fade-in-up on page load for content sections

---

## Dark Theme Requirements

All WastelandWares properties must use dark themes. There are no light mode variants.

**Rationale:** The dark theme is core to the brand identity, not a preference toggle.
The wasteland is dark. The terminal is dark. The bunker is dark. Consistency here
is non-negotiable.

**Minimum requirements:**
- Page background: #0a0a0f to #0e0e14
- Text contrast ratio: 4.5:1 minimum (WCAG AA)
- Card surfaces: visually distinct from page background
- Borders: visible but subtle (not high-contrast lines)

---

## Quick Reference (One-Page Cheat Sheet)

| Element | Rule |
|---------|------|
| Background | `#0a0a0f` (dark, slightly blue-tinted) |
| Text | `#e8e8f0` primary, `#7a7a90` secondary |
| Accent | Cyan `#22d3ee` → Green `#00e88f` gradient |
| Font | JetBrains Mono (300, 400, 600, 800) |
| Theme | Dark only. No light mode. |
| Voice | Direct, competent, no exclamation marks |
| Products | Use category color as accent. WW badge in footer. |
| Gradient | One moment per page. CTAs and hero only. |
| Logo | Hexagonal W on dark bg. Don't recolor. |

---

*This document is the source of truth for WastelandWares brand decisions.
All future projects should reference it. Updated by the Documentation Agent
as the brand evolves.*
