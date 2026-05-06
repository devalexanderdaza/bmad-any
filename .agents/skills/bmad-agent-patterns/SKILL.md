---
name: bmad-agent-patterns
description: >
  Conventions and structural patterns for authoring BMAD agents — roles, triggers, persona rules,
  task boundaries, and output contracts. Covers SKILL.md frontmatter format, 8-step activation
  sequence, customize.toml schema and merge rules, agent archetypes (stateless, memory, autonomous),
  path conventions, menu dispatch, and override layering. Use when creating a new agent, reviewing
  an existing one for compliance, or deciding how to split responsibilities across the agent roster.
  Not for workflow skills (create-*, check-*, edit-*) — those follow different structural rules.
---

# BMAD Agent Patterns

## Overview

Structural patterns for authoring BMAD agent skills in this repository — extracted from 6 representative
agent skill directories covering the full archetype spectrum: 4 pure-role agents (analyst, architect,
dev, pm), 1 extended-capability agent (tech-writer), and 1 meta-agent builder with assets, references,
and scripts.

**Source:** `/Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any` (internal)
**Version:** 1.0.0 | **Commit:** `bfb08ff3` | **Ref:** `main`
**Forge Tier:** Forge (T1-low — YAML/TOML/Markdown source reading)
**Patterns extracted:** 11 | **Confidence:** T1-low across all patterns

## Quick Start

### Create a stateless agent SKILL.md

```markdown
---
name: {module-prefix}agent-{name}
description: {Role description}. Use when the user asks to talk to {displayName} or requests the {title}.
---

# {DisplayName} — {Role Title}

## Overview

You are {DisplayName}, the {Role Title}. {One sentence persona.}

## Conventions

- Bare paths (e.g. `references/guide.md`) resolve from the skill root.
- `{skill-root}` resolves to this skill's installed directory (where `customize.toml` lives).
- `{project-root}`-prefixed paths resolve from the project working directory.
- `{skill-name}` resolves to the skill directory's basename.

## On Activation

### Step 1: Resolve the Agent Block

Run: `python3 {project-root}/_bmad/scripts/resolve_customization.py --skill {skill-root} --key agent`

If the script fails, resolve the `agent` block yourself by reading these three files in base → team → user
order: `{skill-root}/customize.toml`, `{project-root}/_bmad/custom/{skill-name}.toml`,
`{project-root}/_bmad/custom/{skill-name}.user.toml`. Missing files are skipped.

[... continue with Steps 2-8]
```

`[SRC:.agents/skills/bmad-agent-builder/assets/SKILL-template.md:L6-48]`

### Create a customize.toml

```toml
[agent]
name = "{DisplayName}"
title = "{Role Title}"
icon = "{emoji}"
description = "{one-sentence description}"
agent_type = "stateless"

activation_steps_prepend = []
activation_steps_append = []

persistent_facts = [
  "file:{project-root}/**/project-context.md",
]

role = "{functional role}"
identity = "{persona reference}"
communication_style = "{style description}"
principles = [
  "{value 1}",
]

[[agent.menu]]
code = "XX"
description = "{capability description}"
skill = "{skill-name}"
```

`[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L7-90]`
`[SRC:.agents/skills/bmad-agent-builder/assets/customize-template.toml:L7-63]`

<!-- [MANUAL:additional-notes] -->
<!-- Add custom notes here. This section is preserved during skill updates. -->
<!-- [/MANUAL:additional-notes] -->

## Common Workflows

**Add a menu item to an existing agent:**
```toml
[[agent.menu]]
code = "XX"
description = "{capability description}"
skill = "{registered-skill-name}"
```
`[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L57-90]`

**Override persona fields (team or personal TOML):**
Create `{project-root}/_bmad/custom/{skill-name}.toml` with `[agent]` block — scalars override, arrays append.
`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L113-118]`

**Load session-wide persistent facts:**
```toml
persistent_facts = [
  "file:{project-root}/docs/org-rules.md",
  "Our org is AWS-only — do not propose GCP.",
]
```
`[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L38-40]`

**Resolve customization manually (script fallback):**
Read base → team → user: `{skill-root}/customize.toml` → `{project-root}/_bmad/custom/{skill-name}.toml`
→ `{project-root}/_bmad/custom/{skill-name}.user.toml`. Missing files are skipped.
`[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L24-33]`

**Route to a capability reference file (workflow agent):**
```markdown
| Capability     | Route                            |
|----------------|----------------------------------|
| Build Agent    | Load `./references/build-process.md` |
```
`[SRC:.agents/skills/bmad-agent-builder/SKILL.md:L54-68]`

## Key API Summary

| Pattern | Purpose | Key Fields / Steps | Provenance |
|---------|---------|-------------------|------------|
| SKILL.md frontmatter | Agent discovery contract | `name`, `description` | `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L1-4]` |
| Conventions block | Path resolution (verbatim) | `{skill-root}`, `{project-root}`, `{skill-name}` | `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L14-18]` |
| 8-step activation | Pure-role agent init sequence | Steps 1-8 in fixed order | `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L19-74]` |
| Agent Block resolution | Merge base+team+user TOML | script + manual fallback | `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L22-33]` |
| customize.toml metadata | Install-time roster contract | `code`, `name`, `title`, `icon`, `description`, `agent_type` | `[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L54-76]` |
| customize.toml override surface | Runtime behavior customization | `activation_steps_prepend/append`, `persistent_facts`, `role`, `identity`, `communication_style`, `principles` | `[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L14-51]` |
| Merge rules | Override conflict resolution | scalars override, arrays append, arrays-of-tables by `code`/`id` | `[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L13-15]` |
| [[agent.menu]] | Capability dispatch | `code`, `description`, `skill` OR `prompt` | `[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L57-90]` |
| Override file locations | Layered customization paths | base → team → user | `[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L113-118]` |
| Agent archetypes | Three structural types | stateless, memory, autonomous | `[SRC:.agents/skills/bmad-agent-builder/SKILL.md:L35-43]` |
| Workflow agent pattern | Meta-agent init structure | 3-step init, capabilities routing table | `[SRC:.agents/skills/bmad-agent-builder/SKILL.md:L19-69]` |

<!-- [MANUAL:api-notes] -->
<!-- Add custom notes here. This section is preserved during skill updates. -->
<!-- [/MANUAL:api-notes] -->

## Key Types

**agent_type** — determines archetype and required files:

- `stateless` — everything in SKILL.md + customize.toml; no sanctum, no memory
- `memory` — lean bootloader SKILL.md + customize.toml + sanctum (PERSONA.md, CREED.md, BOND.md, CAPABILITIES.md, MEMORY.md, First Breath)
- `autonomous` — memory agent + PULSE for between-session operation

`[SRC:.agents/skills/bmad-agent-builder/SKILL.md:L35-43]`
`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L24-35]`

**customize.toml metadata block** (always present — consumed by installer):

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `code` | string | yes | Stable identifier; matches skill directory basename |
| `name` | string | optional | Display name; empty string valid for First-Breath-named agents |
| `title` | string | yes | Role title |
| `icon` | string | yes | Single emoji |
| `description` | string | yes | One-sentence summary |
| `agent_type` | string | yes | `stateless` \| `memory` \| `autonomous` |

`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L54-76]`

## Architecture at a Glance

**Pure-role agents** (analyst, architect, dev, pm, tech-writer):
- 2 files: SKILL.md (8-step activation) + customize.toml
- Identical Conventions block and step 1-8 structure across all

**Extended-capability agents** (tech-writer):
- Same 2-file base + capability .md files (explain-concept.md, write-document.md, etc.)
- Extra capabilities referenced from menu via `skill` field

**Meta-agent / builder archetype:**
- SKILL.md + customize.toml + `assets/` (templates) + `references/` (guidance docs) + `scripts/` (Python)
- Different activation: detect intent → load config → route by intent (no 8-step persona sequence)

`[SRC:.agents/skills/bmad-agent-builder/SKILL.md:L35-69]`
`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L1-11]`

<!-- [MANUAL:architecture-notes] -->
<!-- Add custom notes here. This section is preserved during skill updates. -->
<!-- [/MANUAL:architecture-notes] -->

## Full API Reference

See `references/activation-sequence.md` for complete 8-step activation detail.
See `references/customize-toml-schema.md` for full customize.toml schema and merge rules.
See `references/agent-archetypes.md` for archetype comparison and file structure.

### Pattern P1 — SKILL.md Frontmatter

**Format:**
```yaml
---
name: {skill-name}
description: {What the agent does}. Use when the user asks to talk to {displayName}, requests the {title}, or {when to use}.
---
```

**Rules:**
- Only `name` and `description` in frontmatter — `version` and `author` go in metadata.json
- `description` MUST use third-person voice
- No angle brackets in description field (use `{placeholder}` form instead)

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L1-4]`
`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L4-11]`

---

### Pattern P2 — Conventions Block (verbatim)

```markdown
## Conventions

- Bare paths (e.g. `references/guide.md`) resolve from the skill root.
- `{skill-root}` resolves to this skill's installed directory (where `customize.toml` lives).
- `{project-root}`-prefixed paths resolve from the project working directory.
- `{skill-name}` resolves to the skill directory's basename.
```

This exact block appears verbatim in all 5 pure-role agent SKILL.md files.

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L14-18]`
`[SRC:.agents/skills/bmad-agent-tech-writer/SKILL.md:L14-18]`
`[SRC:.agents/skills/bmad-agent-dev/SKILL.md:L14-18]`

---

### Pattern P3 — 8-Step Activation Sequence

Full sequence for pure-role agents (analyst, architect, dev, pm, tech-writer).
See `references/activation-sequence.md` for complete detail.

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L19-74]`
`[SRC:.agents/skills/bmad-agent-tech-writer/SKILL.md:L19-75]`
`[SRC:.agents/skills/bmad-agent-pm/SKILL.md:L19-75]`
`[SRC:.agents/skills/bmad-agent-dev/SKILL.md:L19-75]`

---

### Pattern P4 — Agent Block Resolution

**Script invocation:**
```bash
python3 {project-root}/_bmad/scripts/resolve_customization.py --skill {skill-root} --key agent
```

**Manual fallback (when script fails):**
Read in this order:
1. `{skill-root}/customize.toml` — base defaults
2. `{project-root}/_bmad/custom/{skill-name}.toml` — team overrides
3. `{project-root}/_bmad/custom/{skill-name}.user.toml` — personal overrides

Missing files are skipped. Apply merge rules (P7) while reading.

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L22-33]`

---

### Pattern P5 — customize.toml Metadata Block

```toml
[agent]
code = "{agent-code}"           # stable identifier, matches skill dir basename
name = "{DisplayName}"          # empty string valid for First-Breath-named agents
title = "{Role Title}"
icon = "{emoji}"
description = "{one-sentence description}"
agent_type = "{stateless|memory|autonomous}"
```

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L54-76]`
`[SRC:.agents/skills/bmad-agent-builder/assets/customize-template.toml:L7-16]`

---

### Pattern P6 — customize.toml Override Surface

```toml
activation_steps_prepend = []    # array[string] — appends from overrides
activation_steps_append = []     # array[string] — appends from overrides
persistent_facts = [             # array[string] — appends from overrides
  "file:{project-root}/**/project-context.md",
]
role = ""                        # string — scalar override wins
identity = ""                    # string — scalar override wins
communication_style = ""         # string — scalar override wins
principles = []                  # array[string] — appends from overrides
```

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L14-51]`

---

### Pattern P7 — Merge Rules

Three categories apply when layering base → team → user TOML:

| Category | Behavior |
|----------|----------|
| **Scalars** (string, bool, number) | Override wins — last value written takes effect |
| **Plain arrays** (`persistent_facts`, `principles`, `activation_steps_*`) | Append — all values from all layers are kept |
| **Arrays-of-tables** with `code`/`id` key | Replace matching entry in place; append new entries |

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L13-15]`
`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L80-86]`

---

### Pattern P8 — [[agent.menu]] Items

```toml
[[agent.menu]]
code = "XX"             # 2-letter code, unique per agent
description = "{human-readable capability description}"
skill = "{registered-skill-name}"   # mutually exclusive with `prompt`
# OR
prompt = "{prompt text to execute directly}"
```

**Dispatch rules:**
- Clear match → invoke `skill` or execute `prompt` directly
- Ambiguous → ask one short clarifying question, not a confirmation ritual
- No match → continue conversation; chat and `bmad-help` are always available

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L57-90]`
`[SRC:.agents/skills/bmad-agent-architect/customize.toml:L57-66]`

---

### Pattern P9 — Override File Locations

```text
{skill-root}/customize.toml                        # base defaults (shipped with skill)
{project-root}/_bmad/custom/{skill-name}.toml      # team overrides (committed)
{project-root}/_bmad/custom/{skill-name}.user.toml # personal overrides (gitignored)
```

Merge order: base → team → user. Missing files are skipped with no error.

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L113-118]`

---

### Pattern P10 — Agent Archetypes

| Archetype | `agent_type` | Required Files | Memory |
|-----------|-------------|----------------|--------|
| Stateless | `stateless` | SKILL.md + customize.toml | None |
| Memory | `memory` | Bootloader SKILL.md + customize.toml + sanctum (PERSONA.md, CREED.md, BOND.md, CAPABILITIES.md, MEMORY.md, First Breath) | Yes |
| Autonomous | `autonomous` | Memory agent files + PULSE | Yes + between-session |

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/SKILL.md:L35-43]`
`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L24-35]`

---

### Pattern P11 — Workflow / Meta-Agent Pattern (builder variant)

Different from pure-role agents — no 8-step persona sequence.

**On Activation (3 steps):**
1. Detect user intent (check for `--headless` / `-H` flag)
2. Load config from `{project-root}/_bmad/config.yaml` and `{project-root}/_bmad/config.user.yaml`
3. Route by intent using Quick Reference table → load matching `./references/{capability}.md`

**Capabilities section:**
```markdown
## Capabilities

| Capability       | Route                                |
|------------------|--------------------------------------|
| {Capability Name} | Load `./references/{capability}.md` |
```

**File structure (meta-agent builder):**
```text
{skill-name}/
├── SKILL.md
├── customize.toml
├── assets/         # templates (lazy-loaded)
├── references/     # guidance docs (lazy-loaded)
└── scripts/        # Python scripts
```

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/SKILL.md:L19-69]`
`[SRC:.agents/skills/bmad-agent-builder/assets/SKILL-template.md:L84-91]`

---

## Full Type Definitions

### SKILL.md frontmatter schema

| Field | Constraints | Notes |
|-------|------------|-------|
| `name` | 1-64 chars, lowercase alphanumeric + hyphens | Must match parent directory name |
| `description` | 1-1024 chars, third-person voice, no angle brackets | Trigger-optimized for agent matching |

Only `name` and `description` for standard agents. Also permitted by agentskills.io spec: `license`, `compatibility`, `metadata`, `allowed-tools`.

`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L4-11]`

---

### customize.toml full schema

**Metadata block (always present):**
```toml
[agent]
code = ""          # string, required — stable identifier
name = ""          # string, optional — empty valid for First-Breath-named agents
title = ""         # string, required — role title
icon = ""          # string, required — single emoji
description = ""   # string, required — one-sentence summary
agent_type = ""    # enum: stateless | memory | autonomous
```

**Override surface (opt-in):**
```toml
activation_steps_prepend = []    # array[string] — appends from overrides
activation_steps_append = []     # array[string] — appends from overrides
persistent_facts = []            # array[string] — appends from overrides
                                 # entries: literal sentence OR "file:{glob}"
role = ""                        # string — scalar override wins
identity = ""                    # string — scalar override wins
communication_style = ""         # string — scalar override wins
principles = []                  # array[string] — appends from overrides
```

**Menu items (arrays-of-tables):**
```toml
[[agent.menu]]
code = ""           # string, required — 2-letter unique code
description = ""    # string, required — capability description
skill = ""          # string — mutually exclusive with `prompt`
# OR
prompt = ""         # string — mutually exclusive with `skill`
```

`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L54-121]`

---

### Standard content fields (SKILL.md body, not frontmatter)

| Field | Location | Description |
|-------|----------|-------------|
| `displayName` | H1 heading | Friendly name used in greetings |
| `title` | customize.toml | Role title (e.g., "Tech Writer") |
| `icon` | customize.toml | Single emoji prefixed on messages |
| `role` | customize.toml | Functional role description |
| `identity` | customize.toml | Persona reference (e.g., "Channels Martin Fowler's pragmatism") |
| `agent_type` | customize.toml | `stateless` \| `memory` \| `autonomous` |

`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L14-22]`
