#!/usr/bin/env bash
# Setup script for Gitea Actions runner (act_runner)
# Works on both Linux (aibox) and macOS (MacBook)
set -euo pipefail

GITEA_URL="${GITEA_URL:-http://localhost:3003}"
RUNNER_NAME="${RUNNER_NAME:-$(hostname)}"
RUNNER_LABELS="${RUNNER_LABELS:-}"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"

# Detect platform
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"
case "$ARCH" in
  x86_64)  ARCH="amd64" ;;
  aarch64|arm64) ARCH="arm64" ;;
esac

echo "==> Platform: ${OS}/${ARCH}"
echo "==> Runner name: ${RUNNER_NAME}"
echo "==> Gitea URL: ${GITEA_URL}"

# Download act_runner if not present
if ! command -v act_runner &>/dev/null; then
  echo "==> Downloading act_runner..."
  VERSION="${ACT_RUNNER_VERSION:-0.2.11}"
  DOWNLOAD_URL="https://gitea.com/gitea/act_runner/releases/download/v${VERSION}/act_runner-${VERSION}-${OS}-${ARCH}"

  if [ "$OS" = "darwin" ]; then
    curl -fSL "$DOWNLOAD_URL" -o /tmp/act_runner
    chmod +x /tmp/act_runner
    sudo mv /tmp/act_runner "$INSTALL_DIR/act_runner"
  else
    curl -fSL "$DOWNLOAD_URL" -o /tmp/act_runner
    chmod +x /tmp/act_runner
    sudo mv /tmp/act_runner "$INSTALL_DIR/act_runner"
  fi
  echo "==> act_runner installed to ${INSTALL_DIR}/act_runner"
else
  echo "==> act_runner already installed: $(command -v act_runner)"
fi

# Generate default config if not present
CONFIG_DIR="${HOME}/.config/act_runner"
mkdir -p "$CONFIG_DIR"
if [ ! -f "$CONFIG_DIR/config.yaml" ]; then
  echo "==> Generating default config..."
  act_runner generate-config > "$CONFIG_DIR/config.yaml"
fi

# Register the runner
echo ""
echo "==> To register the runner, get a registration token from:"
echo "    ${GITEA_URL}/-/admin/runners"
echo ""
echo "    Then run:"
echo "    act_runner register \\"
echo "      --instance '${GITEA_URL}' \\"
echo "      --name '${RUNNER_NAME}' \\"
echo "      --token '<YOUR_REGISTRATION_TOKEN>' \\"
if [ -n "$RUNNER_LABELS" ]; then
  echo "      --labels '${RUNNER_LABELS}' \\"
fi
echo "      --config '${CONFIG_DIR}/config.yaml' \\"
echo "      --no-interactive"
echo ""
echo "==> After registration, start the runner with:"
echo "    act_runner daemon --config '${CONFIG_DIR}/config.yaml'"
