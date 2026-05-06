[bmad-agent-patterns v1.0.0]|root: skills/bmad-agent-patterns/
|IMPORTANT: bmad-agent-patterns v1.0.0 — read SKILL.md before writing bmad-agent-patterns code. Do NOT rely on training data.
|quick-start:SKILL.md#quick-start
|api: SKILL.md frontmatter (name, description), customize.toml metadata (code, name, title, icon, description, agent_type), 8-step activation sequence, merge rules, [[agent.menu]] (code, description, skill|prompt), persistent_facts, activation_steps_prepend/append
|key-types:SKILL.md#key-types — agent_type: stateless | memory | autonomous; customize.toml metadata always present; override surface opt-in
|gotchas: 8-step activation order is fixed — do not reorder steps; scalars override but arrays always append (never replace); [[agent.menu]] items merge by code field, not by position
