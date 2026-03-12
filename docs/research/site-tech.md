# WastelandWares Brand Site — Technology Research

> Date: 2026-03-12
> Author: Research Agent
> Status: Draft recommendation

---

## 1. Current Site Analysis

### Source
`/Users/tquick/projects/wasteland-hq/homepage/index.html` — single HTML file, no build tools.

### Design Tokens (CSS Custom Properties)

```css
--bg:             #08080c      /* Primary background — near-black with blue tint */
--bg-surface:     #0e0e14      /* Card/surface background */
--text:           #e8e8f0      /* Primary text — soft white */
--text-dim:       #4a4a5e      /* Dimmed text (footer, labels) */
--text-secondary: #7a7a90      /* Secondary text (category labels) */
--green:          #00e88f      /* Primary accent — mint green */
--green-glow:     #00e88f40    /* Green with 25% alpha for glow effects */
--cyan:           #22d3ee      /* Secondary accent — cyan */
--blue:           #4ea8ff      /* Tertiary accent — blue */
--yellow:         #ffc857      /* Category: tools */
--purple:         #a78bfa      /* Category: AI */
--border:         #1e1e2e      /* Subtle border color */
```

### SVG Logo Structure
- Outer hexagon (shield shape): cyan stroke, 0.3 opacity
- Inner hexagon: green stroke, 0.2 opacity — creates a layered depth effect
- "W" monogram: 42px JetBrains Mono bold, filled with a linear gradient (white -> cyan -> green at 135deg)
- Gradient defined as `linearGradient#grad` with three stops

The hexagons are defined as 6-point paths (not `<polygon>`), giving precise control over the elongated vertical shape. This is a clean, portable SVG that can be extracted as a standalone asset.

### Responsive Breakpoints
- Single breakpoint at `max-width: 600px`:
  - Brand name shrinks from 3.5rem to 2.2rem
  - Project links stack vertically instead of flex-wrap

This is minimal — a multi-page site will need breakpoints at ~768px and ~1024px as well.

### Animation Patterns
- `float`: 6s ease-in-out infinite translateY oscillation (logo)
- `pulse`: 2s ease-in-out infinite opacity oscillation (status dot)
- Hover transitions: 0.2s ease on cards (translateY -2px + box-shadow)

### What Works Well (Preserve)
1. **Color palette** — the dark theme with cyan/green accents is distinctive and cohesive
2. **JetBrains Mono** — gives a developer/hacker identity, consistent with the "wasteland workshop" brand
3. **Category color-coding** — green (game), cyan (infra), yellow (tools), purple (AI) is a strong visual system
4. **Card design** — the left-border accent + dot + label pattern is elegant and scalable
5. **Grid background** — subtle depth without distraction
6. **SVG logo** — clean vector, easily reusable
7. **Minimalism** — every element earns its place

### What Limits the Current Approach
1. **No shared layout** — adding pages means duplicating the entire `<head>`, styles, nav, footer
2. **No component reuse** — the project card pattern is inline; adding 6-8 product cards means copy-paste
3. **No navigation** — single-page means no header/nav structure
4. **Inline CSS** — works for one page, becomes unmaintainable across 5+
5. **No asset pipeline** — no image optimization, no font subsetting
6. **No content/markup separation** — changing a product description means editing HTML

---

## 2. Static Site Generator Evaluation

### Option A: Pure HTML/CSS (current approach, add pages)

| Aspect | Assessment |
|--------|------------|
| Learning curve | None — already working |
| Build speed | Instant (no build) |
| Dark theme | Already implemented |
| Component reuse | None — must copy/paste shared elements |
| Deploy simplicity | Copy files to `/var/www/wastelandwares` |

**When it stops working:** At 3-4 pages. The moment you have a shared nav/footer, you're maintaining the same HTML in every file. One nav link change = edit every page. For 5+ pages with shared layout, this is a maintenance trap.

**Verdict:** Fine for a landing page. Not viable for a 5-7 page site with shared chrome.

### Option B: Astro

| Aspect | Assessment |
|--------|------------|
| Learning curve | Low-moderate. JSX-like component syntax. Familiar if you know React/HTML. |
| Build speed | Fast. Uses Vite under the hood. Sub-second HMR, <5s full build for small sites. |
| Dark theme | Full control — just CSS. No framework opinions on theming. |
| Component reuse | Excellent. `.astro` components with slots, props, and layouts. |
| Deploy simplicity | `astro build` -> `dist/` directory -> copy to server |

**Key strengths for this project:**
- Zero JS by default — outputs pure HTML/CSS unless you opt into islands
- Component model is HTML-first (`.astro` files are basically enhanced HTML)
- Built-in Markdown/MDX support for blog/changelog content
- Content Collections API for structured product data
- Image optimization built-in (`astro:assets`)
- Can colocate CSS with components or use global stylesheets
- Active ecosystem, strong docs, large community

**Key risks:**
- Node.js dependency (need npm/pnpm on build machine or CI)
- Another tool in the stack to maintain/update

### Option C: Eleventy (11ty)

| Aspect | Assessment |
|--------|------------|
| Learning curve | Low. Nunjucks/Liquid templates are simple. Data cascade is powerful but has learning curve. |
| Build speed | Very fast. <1s for small sites. |
| Dark theme | Full control — just CSS. |
| Component reuse | Good via includes/macros, but less ergonomic than Astro components. |
| Deploy simplicity | `npx @11ty/eleventy` -> `_site/` directory -> copy to server |

**Key strengths:**
- Minimal abstraction — feels close to writing plain HTML
- Data cascade lets you define product data in JSON/YAML
- No JS shipped to client by default
- Mature, stable, 1.0+ for years

**Key weaknesses vs. Astro:**
- Template languages (Nunjucks) feel dated compared to component syntax
- No built-in image optimization
- Weaker TypeScript story
- Smaller component ecosystem

### Option D: Hugo

| Aspect | Assessment |
|--------|------------|
| Learning curve | Moderate. Go template syntax is idiosyncratic. |
| Build speed | Fastest of all — sub-100ms for small sites. |
| Dark theme | Full control — just CSS. |
| Component reuse | Partials and shortcodes. Less flexible than Astro/11ty. |
| Deploy simplicity | Single binary. `hugo` -> `public/` -> copy to server |

**Key strengths:**
- Single binary, no Node.js needed. Could install directly on Aibox.
- Blazing fast builds
- Good for content-heavy sites (blog, docs)

**Key weaknesses:**
- Go template syntax has a steep learning curve and poor error messages
- Harder for AI agents to work with (Go templates are less intuitive than HTML-like components)
- Theming system is overly complex for a custom-designed site
- Less flexible layout/component model

### Option E: Vite + Vanilla JS

| Aspect | Assessment |
|--------|------------|
| Learning curve | Low if you know modern JS/CSS. |
| Build speed | Fast (Vite). |
| Dark theme | Full control. |
| Component reuse | Manual — must build your own include/template system. |
| Deploy simplicity | `vite build` -> `dist/` -> copy to server |

**Key strengths:**
- HMR for development
- CSS/JS bundling and minification
- Can use CSS modules or PostCSS
- vite-plugin-handlebars or similar for basic templating

**Key weaknesses:**
- You end up rebuilding what Astro/11ty already provide
- No built-in Markdown processing
- No content collections
- More manual wiring

---

## 3. Component Library Plan

Regardless of tech choice, the site needs these components, designed from the existing design tokens:

### Core Layout
- **`BaseLayout`** — `<html>` shell, font loading, CSS variables, grid background, meta tags
- **`Nav`** — Top bar with logo (small), site name, page links, mobile hamburger
- **`Footer`** — Status pulse dot, links (GitHub, Gitea), copyright
- **`PageSection`** — Reusable full-width section with consistent vertical rhythm

### Content Components
- **`ProductCard`** — Expanded version of current project-link: image/icon, name, tagline, category dot/color, link. Should support a "featured" variant with larger layout.
- **`FeatureGrid`** — 2-3 column grid of feature items (icon + title + description)
- **`HeroSection`** — Logo, brand name, tagline, CTA button(s). Based on current landing page.
- **`CodeBlock`** — Styled `<pre><code>` for showing CLI commands or config snippets
- **`BrandColor`** — Swatch display for brand guidelines page (color + name + hex)

### Utility
- **`GradientText`** — Reusable gradient text treatment (white -> cyan -> green)
- **`CategoryDot`** — Color-coded status dot with optional glow
- **`ExternalLink`** — Link with subtle arrow/icon indicator

### Estimated Component Count: 12-15
This is well within the sweet spot for Astro or 11ty. Not enough to justify a full design system like Storybook, but enough that copy-paste HTML is untenable.

---

## 4. Hosting & Deployment

### Current Setup
- **Server:** Aibox at `154.36.228.38`
- **Web server:** Caddy with automatic HTTPS
- **Document root:** `/var/www/wastelandwares`
- **DNS:** Wildcard `*.wastelandwares.com` A record; no DNS changes needed
- **Caddyfile:** Simple `file_server` with gzip — no changes needed for static output

### Recommended Deploy Process

**Option 1: rsync from local/CI (recommended)**
```bash
# Build locally or in CI
npm run build   # outputs to dist/

# Deploy
rsync -avz --delete dist/ aibox:/var/www/wastelandwares/
```
- Fast, incremental transfers
- `--delete` removes stale files
- Can be wrapped in a `Makefile` or npm script
- Works from any machine with SSH access

**Option 2: Git-based deploy on server**
```bash
# On Aibox
cd /opt/wasteland-site && git pull && npm run build
cp -r dist/* /var/www/wastelandwares/
```
- Requires Node.js on Aibox (already has it for Gitea)
- More steps but creates audit trail

**Recommended:** Option 1. Build locally (or via GitHub Actions), rsync to server. Simple, fast, no server-side build dependencies.

### Asset Optimization
- **Fonts:** Self-host JetBrains Mono (subset to used weights: 300, 400, 600, 800) with `woff2` format. Eliminates Google Fonts dependency and speeds up first paint.
- **Images:** If product images are added, use Astro's built-in `<Image>` component or `sharp` for WebP/AVIF conversion and responsive sizes.
- **SVG:** The logo SVG is already inline and tiny (~500 bytes). Keep it inline.
- **CSS:** Astro/Vite will bundle and minify automatically.

### CDN Considerations
- **Not needed yet.** Caddy with gzip on a single server handles a brand showcase site easily. The site is static HTML/CSS with minimal assets.
- **If needed later:** Cloudflare free tier in front of Caddy. Just change DNS to Cloudflare proxy. Zero code changes.

---

## 5. Recommendation

### Use Astro

**The stack:**
- **Astro** for static site generation
- **Plain CSS** with the existing custom properties (no Tailwind, no CSS-in-JS)
- **Markdown** for blog/changelog content (if/when added)
- **rsync** for deployment
- **Self-hosted JetBrains Mono** (woff2 subset)

**Why Astro over the alternatives:**

1. **HTML-first component model.** The existing site is pure HTML/CSS. Astro components are the closest thing to "HTML with includes." An `.astro` file looks almost identical to the current `index.html` — the team doesn't need to learn React or any framework.

2. **Zero client JS by default.** The current site ships zero JavaScript. Astro preserves this. Hugo and 11ty also achieve this, but Astro's component syntax is more intuitive for AI agents and rapid iteration.

3. **Content Collections.** Product data (name, tagline, category, color, URL, description) can live in Markdown or YAML files. Adding a product means adding a file, not editing HTML templates. This is the key scaling advantage over pure HTML.

4. **Built-in asset optimization.** Image processing, CSS bundling, and font handling are built in. No need to bolt on separate tools.

5. **AI-agent friendly.** `.astro` files are essentially HTML with frontmatter. Claude and other LLMs can read and write them fluently. Go templates (Hugo) and Nunjucks (11ty) are harder for agents to reason about correctly.

6. **Vite-powered dev experience.** Hot module replacement means instant feedback during development. Same DX as the Wasteland HQ dashboard (which already uses Vite).

7. **Simple output.** `astro build` produces a `dist/` folder of static HTML, CSS, and assets. Copy to `/var/www/wastelandwares` and it works with the existing Caddy config. No runtime, no server-side rendering, no database.

**Why NOT the others:**
- **Pure HTML:** Doesn't scale past 3 pages with shared layout. Already at that limit.
- **11ty:** Would work, but template syntax is less ergonomic and image optimization requires plugins.
- **Hugo:** Go templates are a maintenance burden and harder for AI agents. Overkill for a small site.
- **Vite + vanilla:** Would require rebuilding what Astro provides out of the box.

### Proposed Project Structure

```
wasteland-site/
  src/
    components/
      Nav.astro
      Footer.astro
      ProductCard.astro
      HeroSection.astro
      FeatureGrid.astro
      CodeBlock.astro
      BrandColor.astro
    layouts/
      BaseLayout.astro       # Shared HTML shell, nav, footer
    pages/
      index.astro            # Landing/hero page
      products.astro         # Product showcase grid
      about.astro            # Team/philosophy
      brand.astro            # Brand guidelines
    content/
      products/
        dungeon-crawler.md
        orchestrator.md
        ...
    styles/
      global.css             # Design tokens, grid background, base styles
      components.css         # Shared component styles (if not colocated)
    assets/
      fonts/
        JetBrainsMono-*.woff2
      logo.svg
  public/
    favicon.ico
  astro.config.mjs
  package.json
```

### Migration Path
1. Extract CSS variables and global styles from `index.html` into `global.css`
2. Extract the SVG logo into `logo.svg`
3. Create `BaseLayout.astro` with the shared HTML shell
4. Recreate the landing page as `index.astro` using the layout
5. Build out `ProductCard.astro` and the products page
6. Add remaining pages incrementally

### Estimated Timeline
- **Day 1:** Scaffold Astro project, migrate landing page, verify deploy
- **Day 2:** Product cards, products page, navigation
- **Day 3:** About page, brand guidelines page, polish
- **Day 4:** Blog/changelog structure (if desired), final QA

---

## Summary Table

| Criterion | Pure HTML | Astro | 11ty | Hugo | Vite+JS |
|-----------|-----------|-------|------|------|---------|
| Learning curve | None | Low | Low | Medium | Low |
| Component reuse | Poor | Excellent | Good | Fair | Poor |
| Build speed | N/A | Fast | Fast | Fastest | Fast |
| AI-agent friendly | Good | Excellent | Good | Fair | Good |
| Content management | Poor | Excellent | Good | Good | Poor |
| Asset optimization | None | Built-in | Plugin | Built-in | Manual |
| Deploy complexity | Trivial | Simple | Simple | Simple | Simple |
| Client JS | None | None* | None | None | Varies |
| **Overall fit** | **C** | **A** | **B+** | **B** | **C+** |

*Astro ships zero JS unless you explicitly add interactive islands.
