# Skill Registry

**Delegador use only.** Any agent that launches sub-agents reads this registry to resolve compact rules, then injects them directly into sub-agent prompts. Sub-agents do NOT read this registry or individual SKILL.md files.

See `_shared/skill-resolver.md` for the full resolution protocol.

## User Skills

| Trigger | Skill | Path |
|---------|-------|------|
| when implementing a change, preparing commits, splitting PRs, or planning chained or stacked PRs | work-unit-commits | /Users/devalexanderdaza/.claude/skills/work-unit-commits/SKILL.md |
| when drafting or posting feedback, review comments, maintainer replies, Slack messages, or GitHub comments | comment-writer | /Users/devalexanderdaza/.claude/skills/comment-writer/SKILL.md |
| when writing guides, READMEs, RFCs, onboarding docs, architecture docs, or review-facing documentation | cognitive-doc-design | /Users/devalexanderdaza/.claude/skills/cognitive-doc-design/SKILL.md |
| when a PR would exceed 400 changed lines, when planning chained PRs, stacked PRs, or reviewable slices | chained-pr | /Users/devalexanderdaza/.claude/skills/chained-pr/SKILL.md |
| When creating a GitHub issue, reporting a bug, or requesting a feature | issue-creation | /Users/devalexanderdaza/.claude/skills/issue-creation/SKILL.md |
| When creating a pull request, opening a PR, or preparing changes for review | branch-pr | /Users/devalexanderdaza/.claude/skills/branch-pr/SKILL.md |
| When user asks to create a new skill, add agent instructions, or document patterns for AI | skill-creator | /Users/devalexanderdaza/.claude/skills/skill-creator/SKILL.md |
| When writing Go tests, using teatest, or adding test coverage | go-testing | /Users/devalexanderdaza/.claude/skills/go-testing/SKILL.md |
| When user says "judgment day", "judgment-day", "review adversarial", "dual review", "doble review", "juzgar", "que lo juzguen" | judgment-day | /Users/devalexanderdaza/.claude/skills/judgment-day/SKILL.md |
| /graphify | graphify | /Users/devalexanderdaza/.claude/skills/graphify/SKILL.md |
| When the user requests to "analyze source for skills" or "discover skill opportunities." | skf-analyze-source | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-analyze-source/SKILL.md |
| When the user requests to "audit a skill" or "audit skill" for drift. | skf-audit-skill | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-audit-skill/SKILL.md |
| Design a skill scope through guided discovery. Use when the user requests to "create a skill brief" or "brief a skill". | skf-brief-skill | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-brief-skill/SKILL.md |
| Compile a skill from a brief. Supports --batch for multiple briefs. Use when the user requests to "create a skill" or "compile a skill." | skf-create-skill | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-create-skill/SKILL.md |
| Consolidated project stack skill with integration patterns — code-mode or compose-mode. Use when the user requests to "create a stack skill." | skf-create-stack-skill | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-create-stack-skill/SKILL.md |
| Drop a skill version or entire skill — soft (deprecate) or hard (purge). Use when the user requests to "drop" or "remove a skill." | skf-drop-skill | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-drop-skill/SKILL.md |
| Package for distribution and inject context into CLAUDE.md/AGENTS.md/.cursorrules. Use when the user requests to "export" or "package a skill." | skf-export-skill | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-export-skill/SKILL.md |
| Skill compilation specialist — the forge master. Use when the user asks to "talk to Ferris" or requests the "Skill Forge agent." | skf-forger | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-forger/SKILL.md |
| Fast skill from a package name or GitHub URL — no brief needed. Use when the user requests a "quick skill" or "skill from URL" or "skill from package." | skf-quick-skill | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-quick-skill/SKILL.md |
| Improve architecture doc using verified skill data and VS feasibility findings. Use when the user requests to "refine skill architecture" or "improve architecture doc." | skf-refine-architecture | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-refine-architecture/SKILL.md |
| Rename a skill across all its versions — transactional copy-verify-delete. Use when the user requests to "rename a skill." | skf-rename-skill | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-rename-skill/SKILL.md |
| Initialize forge environment, detect tools, set capability tier. Use when the user requests to "set up" or "initialize the forge." | skf-setup | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-setup/SKILL.md |
| Cognitive completeness verification — quality gate before export. Use when the user requests to "test a skill" or "verify skill completeness." | skf-test-skill | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-test-skill/SKILL.md |
| Smart regeneration preserving [MANUAL] sections after source changes. Use when the user requests to "update a skill" or "regenerate a skill." | skf-update-skill | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-update-skill/SKILL.md |
| Pre-code stack feasibility verification against architecture and PRD documents. Use when the user requests to "verify a tech stack" or "verify stack." | skf-verify-stack | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.claude/skills/skf-verify-stack/SKILL.md |
| Registers and runs AI-First CLI as BMAD-invocable workflow. Use when user asks to generate/verify ai-context, get task context, run MCP doctor, configure AI-First. | ai-first-integration | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/skills/ai-first-integration/SKILL.md |
| Registers and runs Graphify CLI as BMAD-invocable workflow. Use when user asks to run graphify, build/update graph report, configure graphify integration. | graphify-integration | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/skills/graphify-integration/SKILL.md |
| Registers and integrates gentle-ai CLI with BMAD as optional workflow. Use when user asks to integrate, diagnose, or run gentle-ai. | gentle-ai-integration | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/skills/gentle-ai-integration/SKILL.md |
| Agile AI-driven development framework with specialized agent personas, structured workflows, scale-adaptive intelligence. Use when setting up BMad Method, installing agent skills, running BMad workflows. | bmad-method | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/skills/bmad-method/6.6.0/bmad-method/SKILL.md |
| Conventions and structural patterns for authoring BMAD agents — roles, triggers, persona rules, task boundaries, output contracts. Use when creating a new agent, reviewing an existing one for compliance, deciding how to split responsibilities across the agent roster. | bmad-agent-patterns | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/skills/bmad-agent-patterns/1.0.0/bmad-agent-patterns/SKILL.md |

## Compact Rules

Pre-digested rules per skill. Delegators copy matching blocks into sub-agent prompts as `## Project Standards (auto-resolved)`.

### work-unit-commits
- Commit by work unit (deliverable behavior, fix, migration, docs)
- No commit by file type (avoid models then services then tests)
- Keep tests with code (same commit as behavior they verify)
- Keep docs with user-visible change
- Tell a story (reviewer understands why each commit exists)
- Future PR-ready (each commit is candidate chained PR)
- SDD workload guard: >400-line change → group into chained PR slices

### comment-writer
- Be useful fast (start with actionable point, no recap)
- Be warm and direct (thoughtful teammate, not corporate bot)
- Keep it short (1-3 short paragraphs or tight bullet list)
- Explain why (technical reason when asking for change)
- Avoid pile-ons (comment on highest-value issue, not every tiny preference)
- Match thread language (Spanish: Rioplatense voseo: podés, tenés, fijate, dale)
- No em dashes (use commas, periods, parentheses)

### cognitive-doc-design
- Lead with the answer (decision, action, outcome first; context after)
- Progressive disclosure (start with happy path, then details, edge cases, references)
- Chunking (group related info into small sections; keep flat lists short)
- Signposting (use headings, labels, callouts, summaries for reader orientation)
- Recognition over recall (prefer tables, checklists, examples, templates over prose)
- Review empathy (design docs for reviewer verification without reconstructing story)

### chained-pr
- Review budget: MUST split when PR exceeds 400 changed lines (additions + deletions)
- Review time: design each PR for ~≤60-minute human review
- Review health: optimize for sustainable maintainer attention, not just CI compliance
- Start and finish: every chained PR states start, end, previous, next
- Autonomy: every chained PR must be understandable and verifiable on its own
- Scope: one deliverable work unit per PR; no unrelated refactors/features/tests/docs
- Dependencies: state dependencies and what follows next
- Exceptions: use size:exception only with maintainer approval
- SDD handoff: honor delivery_strategy from SDD forecasts
- Visual map: every chained PR must include dependency diagram marking current PR
- Tracker PR: Feature Branch Chain needs draft tracker PR mapping all children
- Child PR base: PR #1 targets feature/tracker branch; later children target previous PR branch
- Diff source of truth: retarget/rebase child PRs until diff contains only current work unit
- Strategy consistency: follow chosen chain strategy for entire chain; no mixing stacked/feature branch

### issue-creation
- Blank issues disabled — MUST use template (bug report or feature request)
- Every issue gets status:needs-review automatically on creation
- Maintainer MUST add status:approved before any PR can be opened
- Questions go to Discussions, not issues

### branch-pr
- Every PR MUST link an approved issue — no exceptions
- Every PR MUST have exactly one type:* label
- Automated checks must pass before merge is possible
- Blank PRs without issue linkage blocked by GitHub Actions

### skill-creator
- Create skill when pattern is repeated, project conventions differ, complex workflows need steps, decision trees help AI
- Don't create skill when documentation exists, pattern is trivial, one-off task
- Skill structure: SKILL.md (required), assets/ (optional), references/ (optional)

### go-testing
- Use table-driven tests for multiple test cases
- Bubbletea TUI testing: use teatest
- Golden file testing for large output verification
- Integration tests: test full component interactions

### judgment-day
- Launch TWO independent blind judge sub-agents in parallel (never sequential)
- Neither agent knows about the other — no cross-contamination
- Orchestrator synthesizes findings: confirmed (both), suspect (one), contradiction (disagree)
- Apply fixes, re-judge until both pass or escalate after 2 iterations
- Inject resolved skill compact rules into ALL judge and fix prompts

### graphify
- any input (code, docs, papers, images, videos) to knowledge graph
- Commands: /graphify <path>, /graphify <url>, /graphify query "<question>"
- Outputs: interactive HTML, GraphRAG-ready JSON, GRAPH_REPORT.md
- Persistent graph (graph.json survives sessions), honest audit trail (EXTRACTED/INFERRED/AMBIGUOUS edges), cross-document community detection
- Flags: --deep (richer inference), --update (incremental), --directed (preserve edge direction), --watch (auto-rebuild)

### skf-analyze-source
- Discover skill opportunities in large repos, produce recommended skill briefs
- Output: skill-brief.yaml per recommended skill

### skf-audit-skill
- Drift detection between skill and current source code
- Output: audit report with drift items

### skf-brief-skill
- Design skill scope through guided discovery
- Output: skill-brief.yaml

### skf-create-skill
- Compile skill from brief; supports --batch for multiple briefs
- Output: skill directory with SKILL.md, metadata.json, context-snippet.md, provenance-map.json

### skf-create-stack-skill
- Consolidated project stack skill with integration patterns (code-mode or compose-mode)
- Output: stack skill directory

### skf-drop-skill
- Drop skill version or entire skill (soft deprecate or hard purge)
- Output: updated registry, platform context rebuild

### skf-export-skill
- Package for distribution, inject context into CLAUDE.md/AGENTS.md/.cursorrules
- Output: updated export-manifest.json, IDE config files

### skf-forger
- Skill compilation specialist (forge master)
- Output: forged skill with all artifacts

### skf-quick-skill
- Fast skill from package name or GitHub URL — no brief needed
- Output: skill directory with SKILL.md, metadata.json

### skf-refine-architecture
- Improve architecture doc using verified skill data and VS feasibility findings
- Output: updated architecture doc

### skf-rename-skill
- Rename skill across all versions (transactional copy-verify-delete)
- Output: renamed skill directories, updated platform context

### skf-setup
- Initialize forge environment, detect tools, set capability tier
- Output: forge-tier.yaml, preferences.yaml

### skf-test-skill
- Cognitive completeness verification (quality gate before export)
- Output: test-report.md, JSON result

### skf-update-skill
- Smart regeneration preserving [MANUAL] sections after source changes
- Output: updated skill directory

### skf-verify-stack
- Pre-code stack feasibility verification against architecture and PRD documents
- Output: feasibility report

### ai-first-integration
- Two modes: setup/configure/install (register module), run (execute AI-First CLI)
- Triggers: "ai-first", "af", "generate ai-context", "verify ai-context", "context for task", "understand topic", "mcp doctor", "configure ai-first"
- Steps: parse intent, check setup state, load runtime config, verify CLI, execute action, summarize outcome
- Runtime config: afi.ai_first_bin, afi.ai_first_default_args, afi.ai_first_output_dir, afi.ai_first_default_root
- Fallbacks: ai_first_bin=af, ai_first_default_args="", ai_first_output_dir={project-root}/ai-context, ai_first_default_root={project-root}

### graphify-integration
- Two modes: setup/configure/install (register module), run (execute Graphify CLI)
- Triggers: "graphify", "run graph", "build graph report", "update graph", "configure graphify", "install graphify", "/graphify"
- Steps: parse intent, check setup state, load runtime config, verify CLI, execute command, summarize outcome
- Runtime config: gfi.graphify_bin, gfi.graphify_default_args, gfi.graphify_output_dir
- Fallbacks: graphify_bin=graphify, graphify_default_args="", graphify_output_dir={project-root}/graphify-out
- Prefer non-interactive invocations, keep command echo explicit

### gentle-ai-integration
- Four modes: setup/configure/install (register module), diagnose (detect CLI), sync (run gentle-ai sync), run (execute CLI)
- Triggers: "gentle-ai", "integrate gentle-ai", "diagnose gentle-ai", "sync gentle-ai", "run gentle-ai"
- Steps: parse intent, check setup state, resolve runtime config, detect CLI, run diagnostics, execute action, summarize outcome
- Runtime config: gai.gentle_ai_bin, gai.gentle_ai_default_args
- Fallbacks: gentle_ai_bin=gentle-ai, gentle_ai_default_args=""
- Optional, non-destructive by default; do not edit IDE configs unless user requests setup/sync

### bmad-method
- Agile AI-driven development framework with 12+ specialized agent personas
- Install via npx bmad-method install
- Workflows: analysis (brainstorming, research), planning (PRD, UX, architecture), implementation (sprints, stories, dev)
- Not for general agile consulting or non-BMad methodologies

### bmad-agent-patterns
- Structural patterns for authoring BMAD agent skills (roles, triggers, persona rules, task boundaries, output contracts)
- 8-step activation sequence, customize.toml schema and merge rules, agent archetypes (stateless, memory, autonomous)
- Not for workflow skills (create-*, check-*, edit-*)
- Quick start: create stateless agent SKILL.md, customize.toml; key types: agent_type, override surface opt-in
- Gotchas: 8-step order fixed; scalars override, arrays append; [[agent.menu]] merges by code field

## Project Conventions

| File | Path | Notes |
|------|------|-------|
| AGENTS.md | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/AGENTS.md | Index — references skills below |
| bmad-agent-patterns v1.0.0 | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/skills/bmad-agent-patterns/ | Referenced by AGENTS.md |
| bmad-method v6.6.0 | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/skills/bmad-method/ | Referenced by AGENTS.md |
| gentle-ai-integration v0.1.0 | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/skills/gentle-ai-integration/ | Referenced by AGENTS.md |
| graphify-integration v0.1.0 | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/skills/graphify-integration/ | Referenced by AGENTS.md |
| CLaude.md | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/CLAUDE.md | |
| .cursorrules | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.cursorrules | |
| copilot-instructions.md | /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/.github/copilot-instructions.md | |

Read the convention files listed above for project-specific patterns and rules. All referenced paths have been extracted — no need to read index files to discover more.
