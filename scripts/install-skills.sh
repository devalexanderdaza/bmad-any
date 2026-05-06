#!/usr/bin/env bash
# install-skills.sh — Install bmad-any skills into any project
#
# Usage:
#   ./install-skills.sh [target-dir] [--skills <list>] [--ide <list>]
#
# Options:
#   target-dir          Target project directory (default: current directory)
#   --skills <list>     Comma-separated skill names (default: all)
#                       Options: bmad-agent-patterns, gentle-ai-integration, graphify-integration
#   --ide <list>        Comma-separated IDE names (default: auto-detect from target)
#                       Options: claude-code, github-copilot, opencode, cursor
#   --force             Overwrite existing skill directories
#   --dry-run           Print what would be installed without making changes
#   --help              Show this help

set -euo pipefail

REPO_URL="https://github.com/devalexanderdaza/bmad-any.git"
BRANCH="main"

ALL_SKILLS="bmad-agent-patterns gentle-ai-integration graphify-integration"

skill_source() {
  case "$1" in
    bmad-agent-patterns)   echo "skills/bmad-agent-patterns/1.0.0/bmad-agent-patterns" ;;
    gentle-ai-integration) echo "skills/gentle-ai-integration" ;;
    graphify-integration)  echo "skills/graphify-integration" ;;
    *) echo "" ;;
  esac
}

ide_dir() {
  case "$1" in
    claude-code)    echo ".claude/skills" ;;
    github-copilot) echo ".agents/skills" ;;
    opencode)       echo ".opencode/skills" ;;
    cursor)         echo ".cursor/skills" ;;
    *) echo "" ;;
  esac
}

ALL_IDES="claude-code github-copilot opencode cursor"

# ── Defaults ──────────────────────────────────────────────────────────────────
TARGET=""
SELECTED_SKILLS=""
SELECTED_IDES=""
FORCE=0
DRY_RUN=0

# ── Arg parsing ───────────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --help|-h)
      sed -n '2,18p' "$0" | sed 's/^# //' | sed 's/^#//'
      exit 0
      ;;
    --skills)
      SELECTED_SKILLS="${2//,/ }"
      shift 2
      ;;
    --ide)
      SELECTED_IDES="${2//,/ }"
      shift 2
      ;;
    --force)
      FORCE=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    -*)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
    *)
      if [[ -z "$TARGET" ]]; then
        TARGET="$1"
      else
        echo "Unexpected argument: $1" >&2
        exit 1
      fi
      shift
      ;;
  esac
done

TARGET="${TARGET:-$(pwd)}"
TARGET="$(cd "$TARGET" 2>/dev/null || { mkdir -p "$TARGET"; cd "$TARGET"; }; pwd)"

# ── Validate skill list ───────────────────────────────────────────────────────
if [[ -z "$SELECTED_SKILLS" ]]; then
  SELECTED_SKILLS="$ALL_SKILLS"
fi

for skill in $SELECTED_SKILLS; do
  if [[ -z "$(skill_source "$skill")" ]]; then
    echo "Unknown skill: $skill. Available: $ALL_SKILLS" >&2
    exit 1
  fi
done

# ── Validate IDE list ─────────────────────────────────────────────────────────
if [[ -z "$SELECTED_IDES" ]]; then
  SELECTED_IDES=""
  for ide in $ALL_IDES; do
    dir="$(ide_dir "$ide")"
    if [[ -d "$TARGET/$dir" ]]; then
      SELECTED_IDES="$SELECTED_IDES $ide"
    fi
  done
  SELECTED_IDES="${SELECTED_IDES# }"

  if [[ -z "$SELECTED_IDES" ]]; then
    echo "No IDE config directories found in $TARGET"
    echo "Create at least one of these first, or pass --ide to specify explicitly:"
    for ide in $ALL_IDES; do
      echo "  $TARGET/$(ide_dir "$ide")  (for $ide)"
    done
    exit 1
  fi

  echo "Auto-detected IDEs: $SELECTED_IDES"
fi

for ide in $SELECTED_IDES; do
  if [[ -z "$(ide_dir "$ide")" ]]; then
    echo "Unknown IDE: $ide. Available: $ALL_IDES" >&2
    exit 1
  fi
done

# ── Clone source repo to temp dir ─────────────────────────────────────────────
TMPDIR_BASE="$(mktemp -d)"
trap 'rm -rf "$TMPDIR_BASE"' EXIT
REPO_DIR="$TMPDIR_BASE/bmad-any"

echo "Fetching skills from $REPO_URL ..."
git clone --quiet --depth=1 --branch="$BRANCH" \
  --filter=blob:none --sparse \
  "$REPO_URL" "$REPO_DIR"

SPARSE_PATHS=""
for skill in $SELECTED_SKILLS; do
  SPARSE_PATHS="$SPARSE_PATHS $(skill_source "$skill")"
done

(
  cd "$REPO_DIR"
  git sparse-checkout set $SPARSE_PATHS
)

# ── Install ───────────────────────────────────────────────────────────────────
INSTALLED=0
SKIPPED=0

for ide in $SELECTED_IDES; do
  dest_base="$TARGET/$(ide_dir "$ide")"

  for skill in $SELECTED_SKILLS; do
    src="$REPO_DIR/$(skill_source "$skill")"
    dest="$dest_base/$skill"

    if [[ ! -d "$src" ]]; then
      echo "  WARN: source not found for $skill ($src)" >&2
      continue
    fi

    if [[ -d "$dest" ]] && [[ $FORCE -eq 0 ]]; then
      echo "  SKIP $ide/$skill (already exists — use --force to overwrite)"
      SKIPPED=$((SKIPPED + 1))
      continue
    fi

    if [[ $DRY_RUN -eq 1 ]]; then
      echo "  DRY  $skill → $dest"
    else
      mkdir -p "$dest_base"
      rm -rf "$dest"
      cp -r "$src" "$dest"
      echo "  OK   $ide/$skill"
    fi
    INSTALLED=$((INSTALLED + 1))
  done
done

# ── Summary ───────────────────────────────────────────────────────────────────
echo ""
if [[ $DRY_RUN -eq 1 ]]; then
  echo "Dry run complete. $INSTALLED operation(s) would be performed."
else
  echo "Done. $INSTALLED skill(s) installed, $SKIPPED skipped."
fi
