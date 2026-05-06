---
name: ai-first-integration
description: Registers and runs AI-First CLI as a BMAD-invocable workflow. Use when the user asks to generate or verify ai-context, get task context, run MCP doctor, or configure AI-First integration.
---

# AI-First Integration

## Overview

Simple workflow wrapper around the external `af` (AI-First) CLI.

This skill supports two modes:

- `setup` / `configure` / `install`: register this module into project `_bmad` config and help menu.
- default `run` mode: validate AI-First availability and execute the requested AI-First action.

## Invocation Contract

**Triggers:** User mentions "ai-first", "af", "generate ai-context", "verify ai-context", "context for task", "understand topic", "mcp doctor", "configure ai-first", "install ai-first", or "setup ai-first".

**Arguments (optional):**
- `--setup` / `configure` / `install` -> runs the `configure` capability action
- intent keywords route to specific actions:
  - `diagnose`
  - `generate`
  - `verify`
  - `context`
  - `understand`
  - `mcp-doctor`
- any other args -> passed through to `af` as `<user-args>` via `run`

**Returns:** Confirmation of command run, output location, and next step suggestion.

## On Activation

1. Parse user intent and optional arguments.
2. Check setup state:
   - If user asked for `setup`, `configure`, or `install`, load `./assets/module-setup.md` and complete registration.
   - Otherwise, check whether `{project-root}/_bmad/config.yaml` contains module section `afi`. If missing, load `./assets/module-setup.md` first.
3. Load runtime config (with fallbacks):
   - From `{project-root}/_bmad/config.yaml` and `{project-root}/_bmad/config.user.yaml`, read:
     - `afi.ai_first_bin`
     - `afi.ai_first_default_args`
     - `afi.ai_first_output_dir`
     - `afi.ai_first_default_root`
   - Fallbacks:
     - `ai_first_bin=af`
     - `ai_first_default_args=""`
     - `ai_first_output_dir={project-root}/ai-context`
     - `ai_first_default_root={project-root}`
4. Verify AI-First executable:
   - Run `command -v <ai_first_bin>`.
   - If found, run `<ai_first_bin> --version`.
   - If not found (first detection):
     a. Inform the user clearly: "`af` (ai-first-cli) was not found on this system."
     b. Load `./assets/install-guide.md` for reference.
     c. Offer to install immediately: ask the user "Do you want me to install ai-first-cli now via `npm install -g ai-first-cli`?"
     d. If user confirms → run `npm install -g ai-first-cli`, then re-verify with `command -v af && af --version`.
     e. If install succeeds → continue with normal flow; proceed to platform selection (step 4f).
     f. **Platform selection (interactive)**:
        - Ask the user which MCP platforms they want to configure. Present available options:
          - `opencode`
          - `codex`
          - `claude-code`
          - `cursor`
          - All of the above
          - None / skip
        - For each selected platform, run: `af install --platform <platform>`.
        - After all installs, run `af mcp doctor --json` and summarize results.
     g. If user declines install → present manual install guide and stop.
5. Execute mapped action:
   - `diagnose`: run detection-only summary (`<ai_first_bin> --version` and suggested next commands).
   - `generate`: run `<ai_first_bin> init --root <ai_first_default_root>`.
   - `verify`: run `<ai_first_bin> verify ai-context --json --root <ai_first_default_root>`.
   - `context`: run `<ai_first_bin> context --task "<user-task>" --format markdown --root <ai_first_default_root>`.
   - `understand`: run `<ai_first_bin> understand "<user-topic>" --format markdown --root <ai_first_default_root>`.
   - `mcp-doctor`: run `<ai_first_bin> mcp doctor --json --root <ai_first_default_root>`.
   - `run`: run `<ai_first_bin> <user-args>` (user args required).
6. Summarize outcome:
   - Confirm command used, output location, and next suggested command.

## Capability Actions

- `install-cli`:
  - Triggered when `af` binary is not found.
  - Offers to install `ai-first-cli` via npm immediately.
  - If accepted, runs install and re-verifies.
  - Then runs interactive platform selection.
- `platform-setup`:
  - Interactive: presents list of available MCP platforms (`opencode`, `codex`, `claude-code`, `cursor`).
  - Allows user to select one, many, or all.
  - Runs `af install --platform <platform>` for each selected.
  - Finalizes with `af mcp doctor --json` to confirm readiness.
- `configure`:
  - Triggered by setup/configure/install intent.
  - Runs module registration flow in `./assets/module-setup.md`.
- `diagnose`:
  - Detect AI-First and show version plus recommended commands.
- `generate`:
  - Generate `ai-context/` for the target repository.
- `verify`:
  - Verify generated ai-context trust score.
- `context`:
  - Get task-specific context via `af context --task ...`.
- `understand`:
  - Get topic/flow understanding via `af understand ...`.
- `mcp-doctor`:
  - Diagnose local MCP readiness with `af mcp doctor`.
- `run`:
  - Execute AI-First CLI with explicit user-provided args.

## Notes

- Keep this integration non-destructive by default.
- `install-cli` and `platform-setup` require explicit user confirmation before running any install command.
- Do not auto-install `ai-first-cli` or mutate MCP client profile files without user consent.
- Platform list is sourced from `af install --list`; the documented platforms for this version are: `opencode`, `codex`, `claude-code`, `cursor`.
