#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_NAME="tacit-knowledge-polanyi"

usage() {
  cat <<'EOF'
Usage:
  ./install.sh [--target codex|openclaw|claude-code|hermes|all] [--dest PATH]

Examples:
  ./install.sh
  ./install.sh --target openclaw
  ./install.sh --target claude-code
  ./install.sh --target hermes --dest ~/.hermes/skills
  ./install.sh --target all

Rules:
  - Default target is codex
  - --dest is only valid when installing a single target
  - Existing target skill directories are replaced
EOF
}

TARGET="codex"
DEST_OVERRIDE=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET="${2:-}"
      shift 2
      ;;
    --dest)
      DEST_OVERRIDE="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

copy_skill() {
  local src_dir="$1"
  local base_dest="$2"
  local final_dest="${base_dest}/${SKILL_NAME}"

  mkdir -p "$base_dest"
  rm -rf "$final_dest"
  cp -R "$src_dir" "$final_dest"
  echo "Installed ${SKILL_NAME} -> ${final_dest}"
}

install_codex() {
  local dest="${DEST_OVERRIDE:-$HOME/.codex/skills}"
  copy_skill "${ROOT_DIR}/${SKILL_NAME}" "$dest"
}

install_openclaw() {
  local dest="${DEST_OVERRIDE:-$HOME/.openclaw/skills}"
  copy_skill "${ROOT_DIR}/platforms/openclaw/${SKILL_NAME}" "$dest"
}

install_claude_code() {
  local dest="${DEST_OVERRIDE:-$HOME/.claude/skills}"
  copy_skill "${ROOT_DIR}/platforms/claude-code/${SKILL_NAME}" "$dest"
}

install_hermes() {
  local dest="${DEST_OVERRIDE:-$HOME/.hermes/skills}"
  copy_skill "${ROOT_DIR}/platforms/hermes/${SKILL_NAME}" "$dest"
  echo "Hermes note: verify that ${dest} matches your local Hermes skill directory."
}

case "$TARGET" in
  codex)
    install_codex
    ;;
  openclaw)
    install_openclaw
    ;;
  claude-code)
    install_claude_code
    ;;
  hermes)
    install_hermes
    ;;
  all)
    if [[ -n "$DEST_OVERRIDE" ]]; then
      echo "--dest cannot be used with --target all" >&2
      exit 1
    fi
    install_codex
    install_openclaw
    install_claude_code
    install_hermes
    ;;
  *)
    echo "Unsupported target: $TARGET" >&2
    usage
    exit 1
    ;;
esac

echo "Restart the target agent after installation."
