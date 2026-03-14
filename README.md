# wasteland-infra

Infrastructure-as-code for wastelandwares.com services.

This repository manages the core infrastructure, CI/CD pipelines, and documentation sites for the WastelandWares ecosystem:

- **Main Site** (`wastelandwares.com`): Project overview and landing page
- **Brand Identity Site**: WastelandWares brand guidelines, visual identity, and design system documentation
- **Whitepapers Site**: Academic papers including Object-as-Property (OaP) research

## GitHub Actions

Workflows are defined in `.github/workflows/` and run on GitHub's infrastructure.

## Project Structure

```
wasteland-infra/
  site/                    # Astro site (Node.js)
  docs/                    # Documentation, plans, research
  benchmarks/              # Research and model evaluations
  caddy/                   # Caddy configuration
  papers/                  # Whitepapers site
```
