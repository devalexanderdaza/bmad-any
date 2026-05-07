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
   - If found, proceed to action execution.
   - If not found (first detection):
     a. Inform the user clearly: "`af` (ai-first-cli) was not found on this system."
     b. Load `./assets/install-guide.md` for reference.
     c. Offer to install immediately: ask the user "Do you want me to install ai-first-cli now via `npm install -g ai-first-cli`?"
     d. If user confirms → run `npm install -g ai-first-cli`, then re-verify with `command -v af`.
     e. If install succeeds → continue with normal flow.
     f. If user declines install → present manual install guide and stop.
5. Execute mapped action:
   - `diagnose`: run `<ai_first_bin> doctor --ci` to check repository quality gates and AI readiness.
   - `generate`: run `<ai_first_bin> init --root <ai_first_default_root>` to generate ai-context artifacts.
   - `verify`: run `<ai_first_bin> verify ai-context --json --root <ai_first_default_root>` to audit context trust score (0-100).
   - `context`: run `<ai_first_bin> context --task "<user-task>" --format markdown --root <ai_first_default_root>` for task-specific context.
   - `understand`: run `<ai_first_bin> understand "<user-topic>" --format markdown --root <ai_first_default_root>` to understand a topic/flow.
   - `mcp-doctor`: run `<ai_first_bin> mcp doctor --json --root <ai_first_default_root>` to diagnose MCP setup.
   - `run`: run `<ai_first_bin> <user-args>` (user args required; passed through to af CLI).
6. Summarize outcome:
   - Confirm command used, output location, and next suggested command.

## Capability Actions

- `install-cli`:
  - Triggered when `af` binary is not found.
  - Offers to install `ai-first-cli` via npm immediately: `npm install -g ai-first-cli`.
  - If accepted, runs install and re-verifies binary availability.
- `platform-setup`:
  - Interactive: presents list of available MCP platforms (`opencode`, `codex`, `claude-code`, `cursor`).
  - Allows user to select one, many, or all.
  - For each selected, runs: `af install --platform <platform>`.
  - Finalizes with `af mcp doctor --json` to verify readiness.
- `configure`:
  - Triggered by setup/configure/install intent.
  - Runs module registration flow in `./assets/module-setup.md`.
- `diagnose`:
  - Run quality gates and AI readiness checks: `af doctor --ci`.
  - Summarizes repository quality, test coverage, build config, security and CI setup.
- `generate`:
  - Generate `ai-context/` folder with architecture, symbols, entrypoints, dependencies, and AI rules.
  - Runs `af init` to produce 20+ machine-readable and human-readable artifacts.
- `verify`:
  - Audit generated `ai-context/` and return trust score (0-100).
  - Checks manifest freshness, required files, stack evidence, and confidence.
- `context`:
  - Get task-specific context: run `af context --task "<description>" --format markdown`.
  - Combines symbols, tests, modules, risks, and git activity for the given task.
- `understand`:
  - Understand a topic or auth flow: run `af understand "<topic>" --format markdown`.
  - Gathers code, tests, architecture, git and risk context for the specified topic.
- `mcp-doctor`:
  - Diagnose local MCP setup: run `af mcp doctor --json`.
  - Checks platform config, server readiness, and compatibility issues.
- `run`:
  - Execute AI-First CLI with explicit user-provided args.
  - Useful for advanced commands or new af CLI features not yet mapped as dedicated actions.

## Notes

- Keep this integration non-destructive by default.
- `install-cli` and `platform-setup` require explicit user confirmation before running any install command.
- Do not auto-install `ai-first-cli` or mutate MCP client profile files without user consent.
- AI-First v1.5+ is required. Check [ai-first-cli](https://www.npmjs.com/package/ai-first-cli) on npm.
- All commands support `--root` to target a different repository. Defaults to `{project-root}`.
- Output format defaults to markdown for human readability; pass `--json` for machine parsing (except `init`).
