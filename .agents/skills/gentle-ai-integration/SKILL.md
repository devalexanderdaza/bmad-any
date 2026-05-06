---
name: gentle-ai-integration
description: Registers and integrates the gentle-ai CLI with BMAD as an optional workflow. Use when the user asks to integrate, diagnose, or run gentle-ai.
---

# Gentle AI Integration

## Overview

Optional integration wrapper around the external `gentle-ai` CLI.

This skill supports four modes:

- `setup` / `configure` / `install`: register this module into project `_bmad` config and help menu.
- `diagnose`: detect gentle-ai, show compatibility notes, and recommend next steps.
- `sync`: run `gentle-ai sync` (or user-provided args) to align configs.
- `run`: run any gentle-ai command explicitly provided by the user.

## On Activation

1. Parse user intent and optional arguments.
2. Check setup state:
   - If user asked for `setup`, `configure`, or `install`, load `./assets/module-setup.md` and complete registration.
   - Otherwise, check whether `{project-root}/_bmad/config.yaml` contains module section `gai`. If missing, load `./assets/module-setup.md` first.
3. Resolve runtime config (with fallbacks):
   - From `{project-root}/_bmad/config.yaml` and `{project-root}/_bmad/config.user.yaml`, read `gai.gentle_ai_bin` and `gai.gentle_ai_default_args`.
   - Fallbacks: `gentle_ai_bin=gentle-ai`, `gentle_ai_default_args=""`.
4. Detect gentle-ai:
   - Run `command -v <gentle_ai_bin>`.
   - If found, also run `<gentle_ai_bin> --version` to surface the version.
   - If not found, show installation options and stop (do not attempt to install automatically).
   - Load `./assets/install-guide.md` and present the commands verbatim.
5. Diagnostics (always show after detection):
   - Detection status and version.
   - Compatibility note: gentle-ai supports Claude Code, OpenCode, Cursor, VS Code Copilot, Gemini CLI, Windsurf, Codex, Kiro IDE, Kimi Code, Qwen Code, Kilo Code, Antigravity.
   - Recommended next steps (non-destructive):
     - `gentle-ai sync`
     - `skill-registry`
     - `/sdd-init` (if the agent supports it)
6. Execute the requested action:
   - `diagnose`: no further action.
   - `sync`: run `<gentle_ai_bin> sync` or `<gentle_ai_bin> <user-args>` if provided.
   - `run`: run `<gentle_ai_bin> <user-args>` (required).
7. Summarize outcome:
   - Confirm command used and any output paths mentioned by the CLI.

## Capability Actions

- `configure`:
  - Triggered by setup/configure/install intent.
  - Runs module registration flow in `./assets/module-setup.md`.
- `diagnose`:
  - Detect gentle-ai and show compatibility notes with next steps.
- `sync`:
  - Run gentle-ai sync, or pass through user-provided args.
- `run`:
  - Execute gentle-ai with explicit user-provided args.

## Notes

- This integration is optional and non-destructive by default.
- Do not edit IDE or agent configs unless the user explicitly requests a setup or sync action.
