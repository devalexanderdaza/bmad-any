# AI-First Install Guide (Optional)

AI-First is optional. Install it only if you want BMAD to delegate to its CLI.

## Global npm install

```bash
npm install -g ai-first-cli
```

Requirements:
- Node.js 18+
- Git recommended for freshness/change analysis

## Verify install

```bash
af --version
af doctor context
```

## Optional MCP setup

```bash
af install --list
af install --platform codex
af install --platform claude-code
af mcp doctor --json
```
