# wasteland-infra

Infrastructure-as-code for wastelandwares.com services.

This repository manages the core infrastructure, CI/CD pipelines, and documentation sites for the WastelandWares ecosystem:

- **Main Site** (`wastelandwares.com`): Project overview and landing page
- **Brand Identity Site**: WastelandWares brand guidelines, visual identity, and design system documentation
- **Whitepapers Site**: Academic papers including Object-as-Property (OaP) research
- **Gitea Instance**: Self-hosted Git and CI/CD at localhost:3003
- **GitHub Mirror**: Real-time synchronization between GitHub and Gitea (both serve as source)

## Gitea Actions

### Workflows

| Workflow | Trigger | Description |
|----------|---------|-------------|
| `claude-review` | PR comments with `@claude`, new issues | Automated code review via Claude |
| `claude-breakdown` | Issue labeled | AI-generated implementation plans |
| `test` | Push to main, PRs | Auto-detect project type and run tests |
| `build` | Push to main, PRs | Auto-detect project type and build |
| `release` | Tag push (`v*`) | Build, generate release notes, create Gitea release with artifacts |

All workflows auto-detect project type (Node.js, Python, Go, Rust) and use appropriate tooling.

### Runners

Two self-hosted runners power the CI/CD:

| Runner | Platform | Labels | Use Case |
|--------|----------|--------|----------|
| **aibox** | Linux amd64 | `self-hosted,linux,amd64,gpu` | Primary CI, GPU workloads |
| **MacBook** | macOS arm64 | `self-hosted,macos,arm64` | macOS builds, iOS testing |

### Runner Setup

#### Prerequisites
- Gitea instance running at `http://localhost:3003`
- Admin access to create runner registration tokens

#### Installation

1. Get a registration token from `http://localhost:3003/-/admin/runners`

2. On each machine, run the setup script:
   ```bash
   # Load the environment for this machine
   source runners/aibox.env    # or macbook.env

   # Install act_runner and generate config
   bash runners/setup-runner.sh

   # Register (paste your token)
   act_runner register \
     --instance "$GITEA_URL" \
     --name "$RUNNER_NAME" \
     --token '<YOUR_TOKEN>' \
     --labels "$RUNNER_LABELS" \
     --config ~/.config/act_runner/config.yaml \
     --no-interactive
   ```

3. Start the runner as a service:

   **Linux (aibox):**
   ```bash
   sudo cp runners/act_runner.service /etc/systemd/system/
   sudo systemctl enable --now act_runner
   ```

   **macOS (MacBook):**
   ```bash
   cp runners/dev.tquick.act-runner.plist ~/Library/LaunchAgents/
   launchctl load ~/Library/LaunchAgents/dev.tquick.act-runner.plist
   ```

### Required Secrets

Configure these in Gitea repo settings → Actions → Secrets:

| Secret | Description |
|--------|-------------|
| `ANTHROPIC_API_KEY` | API key for Claude (claude-review, claude-breakdown) |
| `GITEA_TOKEN` | Gitea API token for posting comments and creating releases |

### Adding Workflows to Other Projects

Copy the workflow files from `.gitea/workflows/` into any Gitea-hosted repo:

```bash
# From target project root
mkdir -p .gitea/workflows
cp /path/to/wasteland-infra/.gitea/workflows/{test,build,release}.yaml .gitea/workflows/
# Also copy claude-review if desired
cp /path/to/wasteland-infra/.gitea/workflows/claude-review.yaml .gitea/workflows/
```

Workflows auto-detect project type, so no per-project configuration is needed.

## GitHub Mirror Workflow

The wasteland-infra repository is mirrored between GitHub and Gitea for dual-host CI/CD support:

- **Primary Host**: GitHub (WastelandWares/wasteland-infra)
- **Mirror Host**: Gitea (localhost:3003)
- **Synchronization**: GitHub Actions workflow pushes main branch changes to Gitea in real-time

This setup allows:
- Local development and testing via Gitea CI/CD runners
- Open-source visibility on GitHub
- Flexible CI/CD execution across both platforms

Both repositories receive updates immediately, enabling development teams to work with their preferred platform.
