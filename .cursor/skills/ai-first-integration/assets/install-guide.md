# AI-First Install Guide

AI-First (`af`) is required for this integration to work. If it is not detected, the agent will offer to install it automatically.

> **Package**: [`ai-first-cli`](https://www.npmjs.com/package/ai-first-cli) by [@julianperezpesce](https://github.com/julianperezpesce)
> Ignore file: `.ai-first-ignore` (one pattern per line, no `**` glob support)

## Automatic install (via agent)

When `af` is not found, the agent asks:

> "Do you want me to install ai-first-cli now via `npm install -g ai-first-cli`?"

If you confirm, it runs the install and re-verifies. If the install succeeds, it immediately moves to platform selection.

## Manual install

```bash
npm install -g ai-first-cli
```

**Requirements:**
- Node.js 18+
- Git (recommended for freshness/change analysis)

**Verify:**

```bash
af --version
af doctor context
```

## Platform / MCP setup

After installing, the agent asks which platforms you want to configure. Available options for this version:

| Platform | Command |
|----------|---------|
| opencode | `af install --platform opencode` |
| codex | `af install --platform codex` |
| claude-code | `af install --platform claude-code` |
| cursor | `af install --platform cursor` |

You can list all supported platforms at any time:

```bash
af install --list
```

After platform installs, run MCP doctor to confirm readiness:

```bash
af mcp doctor --json
```
