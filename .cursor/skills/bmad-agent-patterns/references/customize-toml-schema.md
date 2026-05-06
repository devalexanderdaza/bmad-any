# customize.toml Schema and Merge Rules

Full schema reference for BMAD agent customization files.

## Contents

1. [File Overview](#file-overview)
2. [Metadata Block](#metadata-block)
3. [Override Surface](#override-surface)
4. [agent.menu Items](#agentmenu-items)
5. [Merge Rules (detail)](#merge-rules-detail)
6. [Override File Locations](#override-file-locations)
7. [Agent-Specific Scalars](#agent-specific-scalars)

## File Overview

Every agent ships a `customize.toml` alongside `SKILL.md`. The file has two parts:
- **Metadata block** — always emitted, consumed by the installer
- **Override surface** — emitted only when the author opted in during build

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L51-54]`

---

## Metadata Block

Always present. Consumed by `module.yaml:agents[]` and the central config's `[agents.<code>]` section.

```toml
[agent]
code = "{agent-code}"       # stable identifier, matches skill directory basename (no module prefix)
name = "{DisplayName}"      # display name; empty string valid for First-Breath-named agents
title = "{Role Title}"      # role title, always fillable at build time
icon = "{emoji}"            # single emoji
description = "{one-sentence summary}"
agent_type = "{type}"       # enum: stateless | memory | autonomous
```

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `code` | string | yes | Stable identifier; matches skill directory basename |
| `name` | string | optional | Display name; empty string valid for First-Breath-named agents |
| `title` | string | yes | Role title; always fillable at build time |
| `icon` | string | yes | Single emoji |
| `description` | string | yes | One-sentence summary of what the agent does |
| `agent_type` | string | yes | `stateless` \| `memory` \| `autonomous` |

**First-Breath-named agents:** leave `name = ""` at build time. Owner fills it post-activation in
`{project-root}/_bmad/custom/config.toml`:
```toml
[agents.<code>]
name = "..."
```

UIs tolerate empty `name` and fall back to `title`.

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L54-76]`
`[SRC:.agents/skills/bmad-agent-builder/assets/customize-template.toml:L7-16]`

---

## Override Surface

Loaded via `_bmad/scripts/resolve_customization.py` at activation. Skip entirely for agents that
did not opt in to customization.

```toml
# Steps to run before standard activation (persona, config, greet).
# Overrides append. Use for pre-flight loads, compliance checks, etc.
activation_steps_prepend = []

# Steps to run after greet but before presenting the menu.
# Overrides append. Use for context-heavy setup once the user is acknowledged.
activation_steps_append = []

# Persistent facts the agent keeps in mind for the whole session.
# Overrides append.
# Each entry is either:
#   - a literal sentence, e.g. "Our org is AWS-only -- do not propose GCP or Azure."
#   - a file reference prefixed with `file:`, e.g. "file:{project-root}/docs/standards.md"
#     (glob patterns are supported; file contents loaded and treated as facts).
persistent_facts = [
  "file:{project-root}/**/project-context.md",
]

role = ""               # functional role; scalar override wins
identity = ""           # persona reference; scalar override wins
communication_style = "" # style description; scalar override wins

# The agent's value system. Overrides append to defaults.
principles = []
```

| Field | Type | Merge behavior |
|-------|------|----------------|
| `activation_steps_prepend` | array[string] | Append |
| `activation_steps_append` | array[string] | Append |
| `persistent_facts` | array[string] | Append |
| `role` | string | Override wins |
| `identity` | string | Override wins |
| `communication_style` | string | Override wins |
| `principles` | array[string] | Append |

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L14-51]`
`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L78-96]`

---

## [[agent.menu]] Items

```toml
[[agent.menu]]
code = "XX"             # string, required — 2-letter unique code per agent
description = "{human-readable capability description}"
skill = "{registered-skill-name}"   # mutually exclusive with `prompt`
# OR
prompt = "{prompt text to execute directly}"
```

- Each item has exactly one of `skill` (invokes a registered skill) or `prompt` (executes text directly)
- `code` is the merge key: matching codes replace the item in place; new codes append

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L53-90]`
`[SRC:.agents/skills/bmad-agent-architect/customize.toml:L53-66]`

---

## Merge Rules (detail)

Three categories, applied when layering base → team → user:

| Category | Rule | Examples |
|----------|------|---------|
| **Scalars** | Override wins — last written value takes effect | `role`, `identity`, `communication_style`, `icon` |
| **Plain arrays** | Append — all values from all layers are accumulated | `persistent_facts`, `principles`, `activation_steps_prepend`, `activation_steps_append` |
| **Arrays-of-tables** with `code`/`id` key | Replace matching entry in place; append new entries | `[[agent.menu]]` items |

**Practical implication for arrays:** if base has `principles = ["A"]` and team override has
`principles = ["B"]`, the merged result is `["A", "B"]` — not `["B"]`.

**Practical implication for menu items:** if base has `[[agent.menu]] code = "CA"` and team override
has a new item with `code = "CA"`, the team's item replaces the base item at the same position.
A team item with a new code (e.g. `code = "ZZ"`) appends.

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L13-15]`
`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L80-86]`

---

## Override File Locations

```
{skill-root}/customize.toml                        # base defaults (shipped with skill, DO NOT EDIT)
{project-root}/_bmad/custom/{skill-name}.toml      # team overrides (committed to repo)
{project-root}/_bmad/custom/{skill-name}.user.toml # personal overrides (gitignored)
```

Resolution order: base → team → user. Missing files are skipped with no error.

Both override files use the same `[agent]` block shape as `customize.toml`.

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L113-118]`

---

## Agent-Specific Scalars

Named by purpose and suffix. Override wins (scalar merge rule).

| Naming pattern | Use for | Example |
|----------------|---------|---------|
| `{purpose}_template` | File paths for templates the agent loads | `style_guide_template = "resources/style.md"` |
| `{purpose}_output_path` | Writable destinations | `report_output_path = "{project-root}/reports"` |
| `on_{event}` | Prompt or command at a hook point | `on_session_close = ""` |

**Path resolution within scalar values:**
- Bare paths (e.g. `resources/style.md`) resolve from the skill root
- `{project-root}/...` resolves from the project working directory
- Config variables already contain `{project-root}` — do not double-prefix

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L87-101]`
