# Deploying the Whitepapers Site

## Files to deploy

The `papers/` directory contains the complete static site:
- `index.html` — papers listing page
- `style.css` — shared dark theme stylesheet
- `oap/index.html` — OaP paper (HTML)
- `oap/opacity_as_policy.pdf` — OaP paper (PDF download)
- `oap/opacity_as_policy.md` — OaP paper (Markdown source)

## Deploy to Aibox

```bash
# Copy site files (already done via SCP)
scp -r papers/* turtles-claude:/var/www/papers/

# Update main site (removes Gitea link, adds Whitepapers)
scp site/index.html turtles-claude:/var/www/wastelandwares/index.html
```

## Caddy Configuration

Add this block to `/etc/caddy/Caddyfile` on Aibox:

```caddy
papers.wastelandwares.com {
    root * /var/www/papers
    file_server
    encode gzip
    header {
        Cache-Control "public, max-age=3600"
        X-Content-Type-Options "nosniff"
        X-Frame-Options "DENY"
    }
}
```

Then reload Caddy:
```bash
sudo systemctl reload caddy
```

## DNS

Ensure `papers.wastelandwares.com` has an A/CNAME record pointing to Aibox.
