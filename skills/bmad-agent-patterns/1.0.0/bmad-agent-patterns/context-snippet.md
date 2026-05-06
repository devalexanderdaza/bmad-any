[bmad-agent-patterns v1.0.0]|root: skills/bmad-agent-patterns/
|IMPORTANT: bmad-agent-patterns v1.0.0 — read SKILL.md before writing bmad-agent-patterns code. Do NOT rely on training data.
|quick-start:SKILL.md#quick-start
|key-types:SKILL.md#key-types — agent_type: stateless | memory | autonomous; customize.toml metadata always present; override surface opt-in
|gotchas: [CARRIED] 8-step activation order is fixed — do not reorder steps; scalars override but arrays always append (never replace); [[agent.menu]] items merge by code field, not by position
