# WastelandWares Product Portfolio & Brand Unification Research

> Date: 2026-03-12
> Author: Product Analysis Agent
> Status: Research complete

---

## Task 1: Product Portfolio

### 1. claude-gate

**What it does:** Biometric permission gating for Claude Code. Intercepts AI tool calls, matches them against configurable rules, and gates dangerous operations behind Touch ID or password authentication. Think `sudo` for AI agents.

**Target audience:** Developers using Claude Code who want hardware-level security for agentic workflows. Security-conscious teams running AI coding agents.

**Current stage:** Beta (v0.8). Active development, comprehensive rule set (50+ default rules), deployed and functional with CI/CD pipelines.

**Category:** Dev-tool / Security

**Tech stack:** Swift 5.9+, AppKit, macOS LocalAuthentication, TOML config. macOS-only.

**Key differentiator:** Only biometric gating tool for AI coding agents. Publishes audit logs, supports voice announcements, has an AI security audit feature.

---

### 2. JARLF

**What it does:** A commercial Android biometric authentication product for macOS. Being built entirely on the Claude toolchain.

**Target audience:** Enterprise/commercial users needing cross-platform biometric auth.

**Current stage:** Early development (pre-alpha). Referenced in sponsorship pitches as a "real revenue pipeline."

**Category:** Commercial product / Security

**Note:** No dedicated project directory found in `/Users/tquick/projects/`. May be in early planning or hosted elsewhere. Information sourced from `docs/pitches/anthropic-sponsorship-draft.md`.

---

### 3. dungeon-crawler ("Turtles")

**What it does:** A D&D 3.5e-inspired web dungeon crawler with raycasting renderer, procedural dungeons, hub town, combat system, loot, bounty board, quests, and character progression. Full game with inventory, shop, character sheets.

**Target audience:** Retro gaming enthusiasts, D&D fans, browser game players.

**Current stage:** Beta (v0.7.0). Deployed to production with CI/CD. Has dev and prod environments at `dungeoncrawler.wastelandwares.com`.

**Category:** Game

**Tech stack:** Vanilla JS (zero frameworks), Canvas 2D raycasting with ImageData pixel buffer, Vite 6, Web Audio API, localStorage saves.

**Key differentiator:** Built entirely by AI agents (has an "Agent Scoreboard" page). Retro aesthetic with modern web tech.

---

### 4. meeting-scribe

**What it does:** AI-powered meeting transcription and note-taking. Records audio, runs Whisper STT + pyannote speaker diarization, produces speaker-labeled markdown transcripts. Has a dual-stream architecture: real-time transcription plus an AI assistant that generates meeting minutes, extracts action items, and organizes notes by topic. Integrates with Obsidian via a plugin.

**Target audience:** Knowledge workers, teams that run meetings, Obsidian users.

**Current stage:** Alpha/Beta. Core transcription works (CLI + server). AI assistant integration in Sprint 1 (design approved March 2026). Obsidian plugin exists.

**Category:** AI-productivity

**Tech stack:** Python (faster-whisper, pyannote, sounddevice), WebSocket server, Obsidian plugin (TypeScript), local Ollama models with Claude API escalation.

**Key differentiator:** Fully local-first (runs on Ollama), with optional frontier model escalation. Deep Obsidian integration. "New hire" skill system where the assistant learns over time.

---

### 5. neuroscript-rs (NeuroScript)

**What it does:** A domain-specific programming language for defining neural network architectures through composition. Everything is a neuron -- primitives, layers, attention mechanisms, entire transformers. Compiles `.ns` files to clean PyTorch code. Features shape contracts (compile-time dimension checking), pattern matching, unroll/repeat, and a 100-file standard library.

**Target audience:** ML researchers, neural architecture designers, AI engineers.

**Current stage:** Beta. Has CI, a website (Docusaurus), WASM playground, 100-file stdlib, Python runtime package. Active development.

**Category:** Programming language

**Tech stack:** Rust compiler, Python runtime, PyTorch code generation, WASM for browser playground.

**Key differentiator:** "Neurons all the way down" -- unique compositional approach to neural architecture definition. Compile-time shape checking catches dimension mismatches before training.

---

### 6. wasteland-orchestrator

**What it does:** A Claude Code plugin for multi-agent orchestration. Manages concurrent AI agent workflows with status reporting, transaction logging, team coordination, sprint dispatch, and protocol enforcement. Includes a swarm dispatcher that reads sprint manifests and spawns parallel `claude -p` agents.

**Target audience:** Developers running multi-agent AI workflows, teams using Claude Code at scale.

**Current stage:** Production (actively used to build all other WastelandWares products). Core infrastructure.

**Category:** Infrastructure

**Tech stack:** Python + Bash libraries, Claude Code plugin system, JSON file-based IPC.

**Key differentiator:** Production-tested multi-agent orchestration with named agent personas, dependency DAGs, conflict detection, health monitoring, and automated issue management.

---

### 7. wasteland-hq

**What it does:** A React dashboard for monitoring AI agent activity in real-time. Displays agent states, active transactions, pinboard items, cook mode status, and project health. Reads from status JSON files produced by the orchestrator.

**Target audience:** Thomas (primary), anyone running the wasteland-orchestrator wanting visual oversight of agent swarms.

**Current stage:** Alpha/Beta. Functional React app with Vite, deployed locally.

**Category:** Infrastructure / Dashboard

**Tech stack:** React, Vite, vanilla CSS with CSS custom properties (has a defined color system with `--green`, `--purple`, `--yellow`, `--red`, `--blue`, `--cyan`, `--orange`).

**Key differentiator:** Game-like dashboard aesthetic for monitoring AI agent "teams." Has a tech tree view and daily log.

---

### 8. dnd-tools

**What it does:** A D&D 3.5e reference and tools suite. Contains a comprehensive class/race database (CSV data covering hundreds of entries from sourcebooks), a website frontend, and documentation infrastructure. The website appears to be the same game as dungeon-crawler (shares the "Turtles" title and identical HTML structure).

**Target audience:** D&D 3.5e players and DMs.

**Current stage:** Alpha. Has data files and a website but the README was overwritten with CSV data (corrupted). Database directory exists but is empty.

**Category:** Game / Reference tool

**Note:** This project and `dungeon-crawler` share significant overlap. The `dnd-tools/website/` appears to be a copy of or predecessor to `dungeon-crawler`. May need consolidation or clarification of scope.

---

## Task 2: Product Categorization & Color System

### Proposed Categories

| Category | Products | Current Color | Assessment |
|----------|----------|---------------|------------|
| **Security & Auth** | claude-gate, JARLF | (none assigned) | NEW category needed |
| **Games & TTRPG** | dungeon-crawler, dnd-tools | Green (#00e88f) | Works well |
| **Infrastructure** | wasteland-orchestrator, wasteland-hq | Cyan (#22d3ee) | Works well |
| **AI-Productivity** | meeting-scribe | Purple (#a78bfa) | Works, but "AI" is vague |
| **Languages & Compilers** | neuroscript-rs | Yellow (#ffc857) | "Tools" is too broad |

### Evaluation of Current Color System

The existing 4-color system (Green/Cyan/Yellow/Purple) was designed before the full portfolio crystallized. Issues:

1. **Missing category for Security products.** claude-gate and JARLF are not infrastructure, not dev-tools in the general sense, and not AI-productivity. They are security products. They need their own identity.

2. **"Tools" (Yellow) is too broad.** It conflates a programming language (neuroscript-rs) with what could include meeting-scribe or dnd-tools. A language compiler is fundamentally different from a productivity tool.

3. **"AI" (Purple) is vague.** Almost every WastelandWares product uses AI. The distinction is not "uses AI" but "what job does it do."

### Revised 5-Category Color System

| Category | Color | Hex | Rationale |
|----------|-------|-----|-----------|
| **Security & Auth** | Red/Amber | `#f97316` (orange) | Security = warning/authority. Orange reads as "gatekeeper" without the alarm of pure red. |
| **Games & TTRPG** | Green | `#00e88f` | Keep. Green = life, adventure, XP bars. Well-established. |
| **Infrastructure** | Cyan | `#22d3ee` | Keep. Cyan = systems, networks, pipelines. |
| **AI-Productivity** | Purple | `#a78bfa` | Keep but redefine as "AI-powered productivity" not just "AI." |
| **Languages & Research** | Yellow | `#ffc857` | Redefine from "tools" to "languages & research." Covers neuroscript-rs and future academic/research projects. |

### Product-to-Category Mapping

| Product | Category | Color |
|---------|----------|-------|
| claude-gate | Security & Auth | Orange `#f97316` |
| JARLF | Security & Auth | Orange `#f97316` |
| dungeon-crawler | Games & TTRPG | Green `#00e88f` |
| dnd-tools | Games & TTRPG | Green `#00e88f` |
| wasteland-orchestrator | Infrastructure | Cyan `#22d3ee` |
| wasteland-hq | Infrastructure | Cyan `#22d3ee` |
| meeting-scribe | AI-Productivity | Purple `#a78bfa` |
| neuroscript-rs | Languages & Research | Yellow `#ffc857` |

---

## Task 3: Design System Research

### GitHub Primer

**Source:** [primer.style](https://www.primer.style/), [primer.style/brand](https://primer.style/brand/), [primer.style/design](https://primer.style/design/)

**Documentation structure:**
- Split into two systems: **Primer** (product UI) and **Primer Brand** (marketing). Clear boundary between product design and brand expression.
- Foundations: Color, Typography, Spacing, Layout
- Components: Buttons, Forms, Navigation, etc.
- Patterns: Common UI patterns and best practices
- Color system uses functional tokens (not raw hex) organized by purpose: `fg.default`, `bg.subtle`, `border.muted`, etc.

**Multi-product handling:**
- GitHub is essentially one product, so Primer doesn't face the multi-product challenge directly. However, they solve the **multi-theme** problem (light, dark, dimmed, high-contrast, colorblind modes) which is architecturally similar.
- All color is delivered as design tokens (CSS variables + Figma variables). Theming is a configuration swap, not a redesign.

**What makes it useful:**
- Functional color naming means colors describe *purpose* not *appearance*. This is directly applicable to WastelandWares -- instead of "use green here," it would be "use `--category-primary` here."
- Accessible color system with [documented contrast methodology](https://github.blog/engineering/user-experience/unlocking-inclusive-design-how-primers-color-system-is-making-github-com-more-inclusive/).

**Key takeaway for WastelandWares:** Adopt functional color tokens. Define colors by role (`--product-accent`, `--category-bg`, `--status-success`) not by name (`--green`, `--purple`).

---

### Atlassian Design System

**Source:** [atlassian.design](https://atlassian.design/), [UXPin analysis](https://www.uxpin.com/studio/blog/atlassian-design-system-creating-design-harmony-scale/)

**Documentation structure:**
- Foundations: Color, Typography, Spacing, Elevation, Grid
- Components: Full UI kit
- Patterns: Cross-product interaction patterns
- Content guidelines: Voice, tone, terminology
- Brand: Illustrations, icons, motion

**Multi-product handling:**
- Atlassian is a **branded house** -- Jira, Confluence, Trello, Bitbucket all look recognizably "Atlassian" despite serving very different audiences.
- Uses **"local design systems"** -- product teams create team-specific extensions that inherit from the master system. Marketing has its own brand design system. All inherit core guidance.
- Each product has a distinct **product color** (Jira = blue, Confluence = blue-green, Trello = blue, Bitbucket = blue) but they share the same component library, typography, spacing, and interaction patterns.

**What makes it useful:**
- The "systems of systems" approach is the most relevant model for WastelandWares. A core brand system provides foundations (typography, spacing, dark theme, logo treatment), and each product category adds its own accent layer.
- Content guidelines ensure products "sound" like the same company even when they look different.

**Key takeaway for WastelandWares:** Adopt the "local design system" model. WastelandWares core provides typography, dark theme, spacing, logo. Each product inherits the core and adds its category accent color.

---

### Tailwind Brand

**Source:** [tailwindcss.com/brand](https://tailwindcss.com/brand), [Thinkmill multi-brand article](https://www.thinkmill.com.au/blog/building-a-multi-brand-design-system-with-tailwind-tips-tricks-and-tradeoffs)

**Documentation structure:**
- Extremely minimal brand page: logo, name usage rules, color palette, download assets. That's it.
- No extensive brand bible -- the *product itself* is the brand expression.
- Design tokens in JSON format, CSS custom properties, Tailwind configs.

**Multi-product handling:**
- Tailwind Labs has multiple products (Tailwind CSS, Tailwind UI, Headless UI, Heroicons) that share a visual language through consistent use of the Tailwind site aesthetic: clean, dark backgrounds, code-forward, gradient accents.
- No formal multi-brand system documented. Unity comes from consistent *craft quality* and *design sensibility*, not from a brand guidelines document.

**What makes it useful:**
- Proves that for dev-tool brands, the product experience IS the brand. Documentation quality, site performance, code examples -- these matter more than a logo lockup spec.
- The Tailwind preset system (configs that can accept design tokens) is a practical model for implementing multi-brand theming.

**Key takeaway for WastelandWares:** Don't over-engineer the brand guidelines. Focus on shipping quality and consistency in the actual product experiences. A 2-page brand cheat sheet beats a 50-page brand bible that nobody reads.

---

### Stripe Identity

**Source:** [Brand New analysis](https://www.underconsideration.com/brandnew/archives/new_logo_and_identity_for_stripe_done_inhouse.php), [Stripe accessible color blog](https://stripe.com/blog/accessible-color-systems), [Landscape product logos](https://thisislandscape.com/projects/stripe-product-logos/)

**Documentation structure:**
- Internal design system (not fully public), but observable through product and marketing consistency.
- Key public artifacts: Accessible color system blog post, Elements Appearance API, Stripe Apps design guidelines.
- Product logo system: Each Stripe product (Payments, Billing, Connect, Terminal, Atlas, Radar, Sigma, Issuing) has its own icon that follows strict rules -- converging colors/shapes, consistent angles related to the master "S" logo, subtle lighting effects.

**Multi-product handling:**
- **Master brand with product sub-identities.** "Stripe" is always present. Individual products get unique icons but share: the indigo primary color (`#635BFF`), clean typography, generous whitespace, the gradient language.
- The purple-blue occupies "a space between tech purple and trust blue" -- intentionally positioned to feel both innovative and reliable.
- Product logos are visually distinct but all follow the same geometric language and color gradient system.

**What makes it useful:**
- The product logo system is the gold standard for WastelandWares to study. Stripe proves you can have 10+ visually distinct product icons that all feel like one family through shared geometric rules and color relationships.
- The accessible color system work is rigorous and publicly documented.
- Stripe shows that a strong master brand allows individual products enormous visual freedom.

**Key takeaway for WastelandWares:** Create a shared geometric language for product icons/marks. The WastelandWares "W" or brand mark should have geometric properties that echo through every product icon.

---

## Task 4: Visual Unification Strategy

### The Core Challenge

WastelandWares products span:

| Product | Vibe | Audience |
|---------|------|----------|
| claude-gate | Serious, security, enterprise | Security-conscious devs |
| JARLF | Commercial, enterprise, auth | Enterprise buyers |
| dungeon-crawler | Fun, retro, fantasy pixel-art | Gamers |
| meeting-scribe | Productivity, corporate, clean | Knowledge workers |
| neuroscript-rs | Academic, technical, precise | ML researchers |
| wasteland-orchestrator | DevOps, infrastructure, systems | Platform engineers |
| wasteland-hq | Dashboard, monitoring, ops | Internal tool |
| dnd-tools | Fantasy, reference, tabletop | D&D players |

This is an unusually wide spread. A game and an enterprise auth tool have almost nothing in common visually -- and they shouldn't.

### Approach 1: Endorsed Brand (Recommended)

**Model:** "WastelandWares" is the parent brand. Each product has its own identity but carries the WastelandWares endorsement.

**How it works:**
- **Shared:** WastelandWares logo (small, consistent placement), typography (one font family), dark theme foundation, footer/header treatment, the wasteland.wares domain.
- **Per-product:** Each product gets its own accent color (from the 5-category system), its own icon/mark, and freedom to express its personality (pixel art for games, clean lines for enterprise, code blocks for dev tools).
- **The link:** Every product page has a subtle "A WastelandWares product" badge. The WastelandWares site is the catalog that ties them together.

**Why this works:**
- A dungeon crawler does NOT need to look like an authentication tool. Trying to force visual consistency across these products would dilute both.
- The endorsement provides credibility ("this is from the same person/studio that built X") without constraining expression.
- This is how Atlassian operates -- Jira and Trello look nothing alike, but both are unmistakably Atlassian products.

**Implementation:**
1. Define the WastelandWares master brand: logo, wordmark, dark background color (`#0a0a0a` or similar), one typeface (e.g., Inter for UI, JetBrains Mono for code).
2. Define category accent colors (the 5-color system above).
3. Create a minimal product badge: `[WW] product-name` or a small WastelandWares logo mark.
4. Each product gets a product icon that uses its category color but follows a shared geometric constraint (e.g., all icons fit a consistent grid, all use the same corner radius, all include a subtle "W" negative space).

---

### Approach 2: Branded House with Category Bands

**Model:** Stronger WastelandWares presence. Every product page looks like a WastelandWares page first, a product page second.

**How it works:**
- **Shared:** Full WastelandWares navigation, consistent layout grid, shared component library (buttons, cards, code blocks), dark theme, typography.
- **Per-product:** Category color applied as an accent stripe/band. Product name and description. Product-specific content area.
- **The link:** Consistent top navigation across all product sites: `WastelandWares > Security | Games | Infrastructure | AI | Languages`

**Why this could work:**
- Creates a strong "studio" identity. Visitors browsing one product naturally discover others.
- Reduces design cost -- one template, multiple skins.
- Works well for the wastelandwares.com catalog page.

**Why it might not work:**
- A dungeon crawler inside a corporate navigation frame looks wrong. Games need immersion.
- Enterprise auth buyers might not want to see they're buying from a "game studio."
- Constrains future products that don't fit the template.

**Implementation:**
1. Build a shared site shell (header, footer, nav) with category-colored accent lines.
2. Each product section uses the same card/grid layout.
3. Product-specific landing pages can break out of the shell for immersive experiences (game demo, language playground) but link back.

---

### Approach 3: Constellation Brand (Minimal Shared Identity)

**Model:** Products are independent stars. WastelandWares is the constellation that connects them -- visible only when you know to look.

**How it works:**
- **Shared:** A single visual motif (e.g., a "wasteland glyph" -- a small geometric mark) appears somewhere in every product. Shared domain (`*.wastelandwares.com`). A single catalog page at `wastelandwares.com`.
- **Per-product:** Complete visual freedom. The dungeon crawler looks like a game. The auth tool looks like enterprise software. The language looks like academic tooling.
- **The link:** The catalog page, the shared domain, and a tiny glyph. That's it.

**Why this could work:**
- Maximum authenticity for each product. Each one can look exactly right for its audience.
- Low maintenance. No shared component library to keep in sync.
- The "indie studio" vibe is authentic to WastelandWares' identity.

**Why it might not work:**
- No brand accumulation. Success of one product doesn't boost the others.
- Looks like unrelated projects rather than a cohesive portfolio.
- Harder to tell the "WastelandWares story" when products don't visually connect.

---

### Recommendation

**Approach 1 (Endorsed Brand) is the right choice for WastelandWares**, for these reasons:

1. **The products are too diverse for a branded house.** Forcing a dungeon crawler and an enterprise auth tool into the same visual template serves neither well.

2. **The products are too connected for a constellation.** They share infrastructure (orchestrator, HQ), a creator, and a philosophy (AI-native development). That story deserves to be visible.

3. **The endorsed model scales.** Adding new products (of any type) just means picking a category color and following the minimal brand rules. No redesign needed.

4. **It matches the reference models.** Atlassian (endorsed/branded house hybrid) and Stripe (master brand + product sub-identities) both validate this approach for companies with diverse product lines.

### Concrete Brand Rules (Minimum Viable Brand)

The entire WastelandWares brand system should fit on one page:

| Element | Rule |
|---------|------|
| **Dark foundation** | All products use a dark theme. Base: `#0c0c0c`. Surface: `#1a1a1a`. Border: `#2a2a2a`. |
| **Typography** | Inter (UI text), JetBrains Mono (code). No product may use a third typeface except for game-specific display text. |
| **Category accent** | Each product uses its category color as the primary accent. Secondary accents are free. |
| **Product badge** | Small "WastelandWares" wordmark or "WW" glyph in footer or about section. Not in the main UI. |
| **Product icon** | Must fit a 64x64 grid. Must use category color. Must include a subtle nod to the WW geometric language (TBD -- could be an angular motif, a hexagonal frame, or a shared corner treatment). |
| **Link back** | Every product includes a link to `wastelandwares.com` in its footer or about page. |

---

## Design System References

- [GitHub Primer](https://www.primer.style/) -- [Brand](https://primer.style/brand/) -- [Design](https://primer.style/design/)
- [Primer Color System Blog Post](https://github.blog/engineering/user-experience/unlocking-inclusive-design-how-primers-color-system-is-making-github-com-more-inclusive/)
- [Atlassian Design](https://atlassian.design/)
- [Atlassian Design System Analysis (UXPin)](https://www.uxpin.com/studio/blog/atlassian-design-system-creating-design-harmony-scale/)
- [Atlassian Design System Interview (Reshaped)](https://www.reshaped.so/blog/interviews/atlassian)
- [Tailwind CSS Brand](https://tailwindcss.com/brand)
- [Multi-Brand Design System with Tailwind (Thinkmill)](https://www.thinkmill.com.au/blog/building-a-multi-brand-design-system-with-tailwind-tips-tricks-and-tradeoffs)
- [Stripe Identity Analysis (Brand New)](https://www.underconsideration.com/brandnew/archives/new_logo_and_identity_for_stripe_done_inhouse.php)
- [Stripe Accessible Color Systems](https://stripe.com/blog/accessible-color-systems)
- [Stripe Product Logos (Landscape)](https://thisislandscape.com/projects/stripe-product-logos/)
- [Brand Architecture Types (Ebaq)](https://www.ebaqdesign.com/blog/brand-architecture)
- [Branded House vs House of Brands (Huebner)](https://www.huebnermarketing.com/brand-architecture-branded-house-vs-house-of-brands/)
