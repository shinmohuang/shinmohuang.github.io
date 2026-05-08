#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOMEBREW_BUNDLE="/opt/homebrew/opt/ruby/bin/bundle"
JEKYLL_CONFIG_FILES="${JEKYLL_CONFIG_FILES:-_config.yml,_config.local.yml}"
JEKYLL_HOST="${JEKYLL_HOST:-127.0.0.1}"
JEKYLL_PORT="${JEKYLL_PORT:-4000}"

if [[ -x "$HOMEBREW_BUNDLE" ]]; then
  BUNDLE_CMD="$HOMEBREW_BUNDLE"
elif command -v bundle >/dev/null 2>&1; then
  BUNDLE_CMD="$(command -v bundle)"
else
  echo "bundle not found. Install Ruby/Bundler first." >&2
  exit 1
fi

cd "$ROOT_DIR"

if [[ "${JEKYLL_LIVE_RELOAD:-0}" == "1" ]]; then
  exec "$BUNDLE_CMD" exec jekyll liveserve --config "$JEKYLL_CONFIG_FILES" --host "$JEKYLL_HOST" --port "$JEKYLL_PORT"
fi

exec "$BUNDLE_CMD" exec jekyll serve --config "$JEKYLL_CONFIG_FILES" --host "$JEKYLL_HOST" --port "$JEKYLL_PORT"
