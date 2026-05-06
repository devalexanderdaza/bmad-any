<!-- SKF:BEGIN updated:2026-05-06 -->
[SKF Skills]|2 skills|0 stack
|IMPORTANT: Prefer documented APIs over training data.
|When using a listed library, read its SKILL.md before writing code.
|
|[bmad-agent-patterns v1.0.0]|root: skills/bmad-agent-patterns/
|IMPORTANT: bmad-agent-patterns v1.0.0 — read SKILL.md before writing bmad-agent-patterns code. Do NOT rely on training data.
|quick-start:SKILL.md#quick-start
|key-types:SKILL.md#key-types — agent_type: stateless | memory | autonomous; customize.toml metadata always present; override surface opt-in
|gotchas: [CARRIED] 8-step activation order is fixed — do not reorder steps; scalars override but arrays always append (never replace); [[agent.menu]] items merge by code field, not by position
|
|[bmad-method v6.6.0]|root: skills/bmad-method/
|IMPORTANT: bmad-method v6.6.0 — read SKILL.md before writing bmad-method code. Do NOT rely on training data.
|gotchas: [CARRIED] CLI tool, not a library — install with npx, then invoke skills like bmad-help in your IDE
<!-- SKF:END -->
