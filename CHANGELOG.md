# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Changed
- `claude-breakdown.yaml`: Filter on `needs-breakdown` label instead of firing on all label events
- `claude-breakdown.yaml`: Improved prompt template with sub-issues, dependency ordering, and acceptance criteria
- `claude-breakdown.yaml`: Auto-remove `needs-breakdown` label after successful breakdown
