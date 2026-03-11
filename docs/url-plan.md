# Wasteland Wares — URL Plan & Caddy Route Map

> Last updated: 2026-03-11

## Overview

All `*.wastelandwares.com` subdomains resolve to a single server via A record.
Caddy handles TLS termination, routing, and access control. Private services
are restricted to the Tailscale network using CIDR allowlists.

## DNS

| Record | Type | Value | TTL | Notes |
|--------|------|-------|-----|-------|
| `wastelandwares.com` | A | `154.36.228.38` | 3600 | Root domain |
| `*.wastelandwares.com` | A | `154.36.228.38` | 3600 | Wildcard — all subdomains |

All domains use Caddy's automatic HTTPS (Let's Encrypt / ZeroSSL).

---

## Domain Inventory

| Domain | Service | Backend | Auth | Status |
|--------|---------|---------|------|--------|
| `wastelandwares.com` | Main site | file_server `/var/www/wastelandwares` | Public | ✅ Live |
| `dungeoncrawler.wastelandwares.com` | Dungeon Crawler game | file_server `/var/www/dungeoncrawler` | Public | ✅ Live |
| `git.wastelandwares.com` | Gitea (code forge) | reverse_proxy `localhost:7070` | Tailscale only | ✅ Live |
| `project-management.wastelandwares.com` | PM redirect → Gitea | redirect to `git.wastelandwares.com` | Tailscale only | ✅ Live |
| `vault.wastelandwares.com` | HashiCorp Vault | TBD | Tailscale only (planned) | 📋 Planned |
| `turtles.wastelandwares.com` | Legacy placeholder | — | — | 🪦 Decommissioned |
| HQ Dashboard | Vite dev server | `localhost:5173` | Tailscale IP direct | 🔧 Dev only |

---

## Caddyfile Blocks

### wastelandwares.com — Main Site

```caddyfile
wastelandwares.com {
    root * /var/www/wastelandwares
    encode gzip
    file_server
}
```

### dungeoncrawler.wastelandwares.com — Dungeon Crawler

```caddyfile
dungeoncrawler.wastelandwares.com {
    root * /var/www/dungeoncrawler
    encode gzip
    file_server
}
```

### git.wastelandwares.com — Gitea

```caddyfile
git.wastelandwares.com {
    @blocked not remote_ip 100.64.0.0/10
    respond @blocked "Access denied" 403

    reverse_proxy localhost:7070
}
```

### project-management.wastelandwares.com — Redirect to Gitea

```caddyfile
project-management.wastelandwares.com {
    @blocked not remote_ip 100.64.0.0/10
    respond @blocked "Access denied" 403

    redir https://git.wastelandwares.com{uri} permanent
}
```

### vault.wastelandwares.com — HashiCorp Vault (Planned)

```caddyfile
vault.wastelandwares.com {
    @blocked not remote_ip 100.64.0.0/10
    respond @blocked "Access denied" 403

    reverse_proxy localhost:8200
}
```

> **Status:** Not yet deployed. Port 8200 is the Vault default; adjust when
> provisioning.

### turtles.wastelandwares.com — Decommissioned

Previously served the dungeon-crawler prototype. Domain is no longer routed in
Caddy. DNS record may still exist but should be cleaned up.

### HQ Dashboard — Local Dev Only

The HQ dashboard runs as a Vite dev server on port `5173`. It is **not**
exposed through Caddy and is accessed directly via the server's Tailscale IP:

```
http://100.x.x.x:5173
```

No Caddyfile block is needed. Access is implicitly restricted to the Tailscale
network because the Vite server binds to the Tailscale interface (or
`0.0.0.0` behind the Tailscale firewall).

---

## Tailscale IP Allowlist Pattern

All private services use the same Caddy matcher to restrict access to the
Tailscale CGNAT range:

```caddyfile
@blocked not remote_ip 100.64.0.0/10
respond @blocked "Access denied" 403
```

**How it works:**

- Tailscale assigns IPs in the `100.64.0.0/10` range (CGNAT space)
- The `remote_ip` matcher checks the client's source IP
- Requests from outside the Tailscale network get a `403` response
- This is applied **per-site block**, not globally, so public sites are unaffected

**When to use:** Any service that should only be reachable by team members on
the Tailscale network (Gitea, Vault, internal dashboards, etc.).

---

## Adding a New Subdomain

1. **DNS:** Covered by the wildcard `*.wastelandwares.com` A record — no
   action needed.
2. **Caddyfile:** Add a new site block. Use the Tailscale allowlist pattern
   above if the service is private.
3. **Firewall:** Ensure the backend port is open on `localhost` only (Caddy
   proxies to it).
4. **This doc:** Update the domain inventory table and add the Caddyfile block.
5. **Reload Caddy:** `sudo systemctl reload caddy`
