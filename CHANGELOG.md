# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Test workflow: auto-detects project type (Node.js, Python, Go, Rust) and runs tests on push/PR
- Build workflow: auto-detects project type and builds artifacts on push/PR
- Release workflow: tag-triggered pipeline that builds, generates release notes from CHANGELOG.md, creates Gitea release with artifact uploads
- Runner setup script (`runners/setup-runner.sh`) for installing and registering act_runner
- Environment configs for aibox (Linux/GPU) and MacBook (macOS/arm64) runners
- systemd service file for Linux runner persistence
- macOS LaunchAgent plist for MacBook runner persistence
- Comprehensive README with setup instructions and workflow documentation

### Changed
- `claude-breakdown.yaml`: Filter on `needs-breakdown` label instead of firing on all label events
- `claude-breakdown.yaml`: Improved prompt template with sub-issues, dependency ordering, and acceptance criteria
- `claude-breakdown.yaml`: Auto-remove `needs-breakdown` label after successful breakdown
