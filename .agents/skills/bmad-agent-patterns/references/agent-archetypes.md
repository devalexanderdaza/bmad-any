# Agent Archetypes

Three structural archetypes for BMAD agents, determined at build time.

## Contents

1. [Archetype Comparison](#archetype-comparison)
2. [Stateless Agent](#stateless-agent)
3. [Memory Agent](#memory-agent)
4. [Autonomous Agent](#autonomous-agent)
5. [File Structure by Archetype](#file-structure-by-archetype)

## Archetype Comparison

| Archetype | `agent_type` | Memory | Between-Session | Required Files |
|-----------|-------------|--------|-----------------|----------------|
| Stateless | `stateless` | None | None | SKILL.md + customize.toml |
| Memory | `memory` | Yes | Read-only review | Bootloader SKILL.md + customize.toml + sanctum |
| Autonomous | `autonomous` | Yes | Active operation | Memory agent files + PULSE |

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/SKILL.md:L35-43]`
`[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L24-35]`

---

## Stateless Agent

Everything lives in SKILL.md and customize.toml. No memory, no First Breath.
Use for focused experts handling isolated sessions.

**Required files:**
```
{skill-name}/
├── SKILL.md         # full 8-step activation + capabilities
└── customize.toml   # metadata block + override surface
```

**SKILL.md structure:** Full stateless layout with Overview, Conventions, On Activation (8 steps),
and optionally Capabilities. See SKILL-template.md for the canonical template.

**customize.toml:** Contains both metadata block (required) and override surface (opt-in).

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/assets/SKILL-template.md:L1-91]`
`[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L1-74]`

---

## Memory Agent

Lean bootloader SKILL.md + sanctum (6 standard files + First Breath).
Use for agents that build understanding over time.

**Required files:**
```
{skill-name}/
├── SKILL.md         # lean bootloader — detect intent → load config → First Breath
└── customize.toml   # metadata block (override surface usually empty)

Sanctum (at {project-root}/_bmad/memory/{skill-name}/):
├── PERSONA.md       # personality DNA, expands over time
├── CREED.md         # values, standing orders, philosophy, boundaries
├── BOND.md          # owner discovery sections
├── CAPABILITIES.md  # registered capabilities (+ Learned section if evolvable)
├── MEMORY.md        # index of memory sidecar
└── First Breath     # onboarding script (calibration or configuration style)
```

**SKILL.md structure:** Lean bootloader — 3-part activation: detect intent / headless flag →
load config → route to First Breath or existing session.

**Memory / autonomous agents prefer sanctum over customize.toml override surface.** The sanctum is
calibrated at First Breath and evolves through owner edits. Use `[agent]` override surface only for
org-mandated pre-sanctum compliance steps.

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/references/standard-fields.md:L24-35]`
`[SRC:.agents/skills/bmad-agent-builder/assets/SKILL-template-bootloader.md:L1]`

---

## Autonomous Agent

Memory agent + PULSE for between-session operation.
Use for agents that operate on their own between sessions — checking in, maintaining things,
creating value when no one is watching.

**Additional file:**
```
Sanctum/
└── PULSE.md         # autonomous operation schedule and triggers
```

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/SKILL.md:L41-43]`

---

## File Structure by Archetype

### Pure-role stateless agent (analyst, architect, dev, pm, tech-writer)

```
{skill-name}/
├── SKILL.md
└── customize.toml
```

All 5 pure-role agents follow this exact structure.

**Provenance:** `[SRC:.agents/skills/bmad-agent-analyst/SKILL.md:L1]`
`[SRC:.agents/skills/bmad-agent-analyst/customize.toml:L1]`

### Extended-capability stateless agent (tech-writer)

```
{skill-name}/
├── SKILL.md
├── customize.toml
├── explain-concept.md       # capability loaded via menu dispatch
├── mermaid-gen.md           # capability loaded via menu dispatch
├── validate-doc.md          # capability loaded via menu dispatch
└── write-document.md        # capability loaded via menu dispatch
```

Extra capability files are loaded lazily via menu dispatch — not on activation.

**Provenance:** `[SRC:.agents/skills/bmad-agent-tech-writer/SKILL.md:L1]`

### Meta-agent / workflow agent (builder)

```
{skill-name}/
├── SKILL.md
├── customize.toml
├── assets/                  # templates (lazy-loaded by capabilities)
│   ├── SKILL-template.md
│   ├── customize-template.toml
│   └── ...
├── references/              # guidance docs (lazy-loaded by capabilities)
│   ├── build-process.md
│   ├── quality-analysis.md
│   └── ...
└── scripts/                 # Python scripts (invoked by capabilities)
    ├── prepass-structure-capabilities.py
    └── ...
```

Different activation pattern: detect intent → load config → route by intent (no 8-step persona).
Capabilities section routes to `./references/{capability}.md`.

**Provenance:** `[SRC:.agents/skills/bmad-agent-builder/SKILL.md:L19-69]`
