# bmad-any

Skill authoring repository for the [Agent Skills](https://agentskills.io) format.
Contains reusable skills compatible with Claude Code, GitHub Copilot, OpenCode, and Cursor.

## Available Skills

| Skill | Version | Description |
|-------|---------|-------------|
| [bmad-agent-patterns](skills/bmad-agent-patterns/1.0.0/bmad-agent-patterns/SKILL.md) | 1.0.0 | Structural patterns for authoring BMAD agents — archetypes, activation sequence, customize.toml schema, override layering |
| [gentle-ai-integration](skills/gentle-ai-integration/SKILL.md) | 0.1.0 | Registers and integrates the `gentle-ai` CLI with BMAD as an optional workflow |
| [graphify-integration](skills/graphify-integration/SKILL.md) | 0.1.0 | Registers and runs Graphify CLI as a BMAD-invocable workflow |

## Installation

### One-liner (recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/devalexanderdaza/bmad-any/main/scripts/install-skills.sh | bash
```

This installs all skills into the current directory, targeting every IDE config folder found.

### With options

```bash
# Install into a specific project directory
bash <(curl -fsSL https://raw.githubusercontent.com/devalexanderdaza/bmad-any/main/scripts/install-skills.sh) /path/to/project

# Install specific skills only
bash <(curl -fsSL https://raw.githubusercontent.com/devalexanderdaza/bmad-any/main/scripts/install-skills.sh) --skills bmad-agent-patterns,graphify-integration

# Install for a specific IDE only
bash <(curl -fsSL https://raw.githubusercontent.com/devalexanderdaza/bmad-any/main/scripts/install-skills.sh) --ide claude-code

# Install into a project dir with options
bash <(curl -fsSL https://raw.githubusercontent.com/devalexanderdaza/bmad-any/main/scripts/install-skills.sh) /path/to/project --skills bmad-agent-patterns --ide claude-code,cursor
```

Or download the script first:

```bash
curl -fsSLo install-skills.sh https://raw.githubusercontent.com/devalexanderdaza/bmad-any/main/scripts/install-skills.sh
chmod +x install-skills.sh
./install-skills.sh [target-dir] [options]
```

### Manual installation

1. Clone or download this repository:

   ```bash
   git clone --depth=1 https://github.com/devalexanderdaza/bmad-any.git
   ```

2. Copy the skill folder(s) to the appropriate directory in your project:

   | IDE | Skills directory |
   |-----|-----------------|
   | Claude Code | `.claude/skills/` |
   | GitHub Copilot | `.agents/skills/` |
   | OpenCode | `.opencode/skills/` |
   | Cursor | `.cursor/skills/` |

   ```bash
   # Claude Code example
   cp -r bmad-any/skills/bmad-agent-patterns/1.0.0/bmad-agent-patterns  your-project/.claude/skills/
   cp -r bmad-any/skills/gentle-ai-integration                           your-project/.claude/skills/
   cp -r bmad-any/skills/graphify-integration                            your-project/.claude/skills/
   ```

## Prerequisites

- `git` (for cloning during install)
- `bash` 3.2+ or `zsh`

## IDE compatibility

| IDE | Config dir | Status |
|-----|-----------|--------|
| Claude Code | `.claude/skills/` | ✓ Supported |
| GitHub Copilot | `.agents/skills/` | ✓ Supported |
| OpenCode | `.opencode/skills/` | ✓ Supported |
| Cursor | `.cursor/skills/` | ✓ Supported |

## Authoring new skills

Skills in this repo are authored using the [SKF (Skill Forge)](https://github.com/devalexanderdaza/bmad-any) toolkit.
See [CLAUDE.md](CLAUDE.md) for configuration and the `_bmad/skf/` directory for the full SKF workflow.

## License

MIT
