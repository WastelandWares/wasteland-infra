# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Test workflow: auto-detects project type (Node.js, Python, Go, Rust) and runs tests on push/PR
- Build workflow: auto-detects project type and builds artifacts on push/PR
- Comprehensive README with setup instructions and workflow documentation
- WastelandWares brand identity documentation and Astro site with brand guidelines
- Whitepapers site with Object-as-Property (OaP) paper
- Anthropic sponsorship pitch and contact research documentation

### Removed
- Gitea release workflow (tag-triggered build, release notes, artifact uploads)
- Runner setup script and environment configs for aibox and MacBook runners
- systemd service and macOS LaunchAgent for runner persistence
- Gitea mirror/sync workflow and `claude-breakdown.yaml` workflow
- `needs-breakdown` label automation

### Changed
- Main site updated to reference brand identity and whitepapers sites
