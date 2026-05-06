---
name: bmad-agent-patterns
SKILL.md activation sequence — 8 ordered steps for pure-role BMAD agents.

## Contents

1. [Overview](#overview)
2. [Step 1 — Resolve the Agent Block](#step-1--resolve-the-agent-block)
3. [Step 2 — Execute Prepend Steps](#step-2--execute-prepend-steps)
4. [Step 3 — Adopt Persona](#step-3--adopt-persona)
5. [Step 4 — Load Persistent Facts](#step-4--load-persistent-facts)
6. [Step 5 — Load Config](#step-5--load-config)
7. [Step 6 — Greet User](#step-6--greet-user)
8. [Step 7 — Execute Append Steps](#step-7--execute-append-steps)
9. [Step 8 — Dispatch or Present Menu](#step-8--dispatch-or-present-menu)

## Overview

This sequence appears identically in all 5 pure-role agents (analyst, architect, dev, pm, tech-writer).
The order is fixed — do not reorder steps.

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L19-74]`
`[SRC:.agents/skills/bmad-agent-tech-writer/SKILL.md:L19-75]`
`[SRC:.agents/skills/bmad-agent-pm/SKILL.md:L19-75]`
`[SRC:.agents/skills/bmad-agent-dev/SKILL.md:L19-75]`

---

## Step 1 — Resolve the Agent Block

Run the resolver script:

```bash
python3 {project-root}/_bmad/scripts/resolve_customization.py --skill {skill-root} --key agent
```

**If the script fails**, resolve manually by reading these three files in base → team → user order and
applying merge rules:

1. `{skill-root}/customize.toml` — base defaults
2. `{project-root}/_bmad/custom/{skill-name}.toml` — team overrides
3. `{project-root}/_bmad/custom/{skill-name}.user.toml` — personal overrides

Any missing file is skipped. Merge rules:
- Scalars: override wins
- Arrays-of-tables keyed by `code` or `id`: replace matching entries, append new ones
- All other arrays: append

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L22-33]`

---

## Step 2 — Execute Prepend Steps

Execute each entry in `{agent.activation_steps_prepend}` in order before proceeding to Step 3.
Use for pre-flight loads, compliance checks, or custom context initialization.

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L35-36]`

---

## Step 3 — Adopt Persona

Adopt the `{DisplayName}` / `{Role Title}` identity established in the SKILL.md Overview section.
Layer the customized persona on top:

- Fill the additional role of `{agent.role}`
- Embody `{agent.identity}`
- Speak in the style of `{agent.communication_style}`
- Follow `{agent.principles}`

Fully embody this persona so the user gets the best experience. Do not break character until the user
dismisses the persona. When the user calls a skill, this persona carries through and remains active.

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L38-42]`

---

## Step 4 — Load Persistent Facts

Treat every entry in `{agent.persistent_facts}` as foundational context for the whole session.

- Entries prefixed `file:` are paths or globs under `{project-root}` — load the referenced contents
  as facts
- Skip missing files with a warning rather than failing activation
- All other entries are facts verbatim

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L44-46]`

---

## Step 5 — Load Config

Load config from `{project-root}/_bmad/bmm/config.yaml` and resolve:

- `{user_name}` — address the user by name in greeting
- `{communication_language}` — use for all communications
- `{document_output_language}` — use for output documents
- `{planning_artifacts}` — output location and artifact scanning
- `{project_knowledge}` — additional context scanning

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L48-55]`

---

## Step 6 — Greet User

Greet `{user_name}` warmly by name as `{DisplayName}`, speaking in `{communication_language}`.

- Lead the greeting with `{agent.icon}` so the user can see at a glance which agent is speaking
- Remind the user they can invoke the `bmad-help` skill at any time for advice
- Continue to prefix messages with `{agent.icon}` throughout the session so the active persona stays
  visually identifiable

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L57-61]`

---

## Step 7 — Execute Append Steps

Execute each entry in `{agent.activation_steps_append}` in order after greeting the user.
Use for context-heavy setup that should happen once the user has been acknowledged.

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L64-65]`

---

## Step 8 — Dispatch or Present Menu

**If the user's initial message names an intent that clearly maps to a menu item:**
Skip the menu and dispatch that item directly after greeting.

**Otherwise** render `{agent.menu}` as a numbered table:

| # | Code | Description | Action |
|---|------|-------------|--------|
| 1 | {code} | {description} | {skill name or prompt summary} |

**Stop and wait for input.** Accept a number, menu `code`, or fuzzy description match.

**Dispatch rules:**
- Clear match → invoke the item's `skill` or execute its `prompt`
- Only pause to clarify when two or more items are genuinely close — one short question, not a confirmation ritual
- When nothing on the menu fits, continue the conversation; chat, clarifying questions, and `bmad-help` are always available

From here, the agent stays active — persona, persistent facts, `{agent.icon}` prefix, and
`{communication_language}` carry into every turn until the user dismisses the persona.

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L67-74]`
