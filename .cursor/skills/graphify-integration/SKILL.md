---
name: graphify-integration
description: Registers and runs Graphify CLI as a BMAD-invocable workflow. Use when the user asks to run graphify, build/update the graph report, or configure graphify integration.
---

# Graphify Integration

## Overview

Simple workflow wrapper around the external `graphify` CLI.

This skill supports two modes:

- `setup` / `configure` / `install`: register this module into project `_bmad` config and help menu.
- default `run` mode: validate Graphify availability and execute the requested Graphify command.

## Invocation Contract

**Triggers:** User mentions "graphify", "run graph", "build graph report", "update graph", "configure graphify", "install graphify", "setup graphify", or `/graphify`.

**Arguments (optional):**
- `--setup` / `configure` / `install` → runs the `configure` capability action
- Any other args → passed through to the Graphify CLI as `<user-args>`

**Returns:** Confirmation of command run, output location, and next step suggestion.

## On Activation

1. Parse user intent and optional arguments.
2. Check setup state:
   - If user asked for `setup`, `configure`, or `install`, load `./assets/module-setup.md` and complete registration.
   - Otherwise, check whether `{project-root}/_bmad/config.yaml` contains module section `gfi`. If missing, load `./assets/module-setup.md` first.
3. Load runtime config (with fallbacks):
   - From `{project-root}/_bmad/config.yaml` and `{project-root}/_bmad/config.user.yaml`, read `gfi.graphify_bin`, `gfi.graphify_default_args`, and `gfi.graphify_output_dir`.
   - Fallbacks: `graphify_bin=graphify`, `graphify_default_args=""`, `graphify_output_dir={project-root}/graphify-out`.
4. Verify Graphify executable:
   - Run `command -v <graphify_bin>`.
   - If not found, guide/install using:
      - `uv tool install graphify`
      - ensure PATH includes `export PATH="$HOME/.local/bin:$PATH"`
   - Re-check executable after install guidance.
5. Execute Graphify command:
   - If user provided explicit args, run `<graphify_bin> <user-args>`.
   - Otherwise run `<graphify_bin> <graphify_default_args>` (or plain `<graphify_bin>` if defaults are empty).
6. Summarize outcome:
   - Confirm command used, output location, and any next step (for example opening `graphify-out/GRAPH_REPORT.md`).

## Capability Actions

- `configure`:
  - Triggered by setup/configure/install intent.
  - Runs module registration flow in `./assets/module-setup.md`.
- `run`:
  - Execute Graphify CLI and surface key results.

## Notes

- Prefer non-interactive Graphify invocations when possible.
- Keep command echo explicit so users can reproduce locally.
- If Graphify fails, return the actionable stderr summary and a concrete retry command.
