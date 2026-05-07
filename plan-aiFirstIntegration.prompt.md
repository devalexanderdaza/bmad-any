# Plan: AI-First Integration — PR & Branch Finalization

Consolidate and ship the `ai-first-integration` skill and all related changes already developed on
`copilot/start-implementation` into a clean PR against `main`.

**Steps**

### Phase 1 — Audit current changes (parallel)
1. Review every file in `git diff main --name-only`: confirm no unintended files are staged.
   Key groups: `.agents/`, `.claude/`, `.cursor/`, `.opencode/`, `skills/ai-first-integration/`,
   `_bmad/_config/`, `graphify-out/`, `scripts/`, `skills-lock.json`.
2. Read `skills/ai-first-integration/SKILL.md` and `skills/ai-first-integration/metadata.json` to
   confirm version, description, and capability-actions are correct.
3. Read `_bmad/_config/skill-manifest.csv` and `_bmad/module-help.csv` to confirm the skill is
   properly registered.

### Phase 2 — Validate scripts and assets
4. Run `python3 skills/ai-first-integration/scripts/merge-config.py --help` (or dry-run) to
   confirm the script is syntactically valid. *depends on step 1*
5. Run `python3 skills/ai-first-integration/scripts/merge-help-csv.py --help` (same).
6. Verify `.ai-first-ignore` exists and contains sensible ignore rules.

### Phase 3 — Cross-platform consistency check
7. Diff the four install targets to ensure they are identical copies:
   `.agents/skills/ai-first-integration/`, `.claude/skills/ai-first-integration/`,
   `.cursor/skills/ai-first-integration/`, `.opencode/skills/ai-first-integration/`.
   All four should mirror `skills/ai-first-integration/` exactly. *parallel with step 6*
8. Confirm `.mcp.json`, `.cursor/mcp.json`, `.opencode/mcp.json` each reference the correct MCP
   server entries. *parallel with step 7*

### Phase 4 — Graph artifacts
9. Confirm `graphify-out/GRAPH_REPORT.md` and `graphify-out/graph.json` are up-to-date (no
   absolute paths; portable). *depends on step 7*
10. If stale, re-run `graphify` to refresh (or confirm last run covered all changed files).

### Phase 5 — Commit and PR
11. Stage all verified changes and create a single conventional commit:
    `feat(ai-first): export skill + cross-platform install + graph refresh`
    with Co-authored-by trailer.
12. Push branch `copilot/start-implementation` and open a PR against `main` with a concise
    description listing: skill added, platforms covered, graph refreshed, scripts validated.

**Relevant files**
- `skills/ai-first-integration/SKILL.md` — canonical skill definition; check version & actions
- `skills/ai-first-integration/metadata.json` — version, name, description
- `skills/ai-first-integration/scripts/merge-config.py` — config-merge logic to validate
- `skills/ai-first-integration/scripts/merge-help-csv.py` — help-CSV merge logic to validate
- `_bmad/_config/skill-manifest.csv` — skill registry entry
- `_bmad/module-help.csv` — module help registration
- `.agents/skills/ai-first-integration/` — Copilot install target (mirror)
- `.claude/skills/ai-first-integration/` — Claude install target (mirror)
- `.cursor/skills/ai-first-integration/` — Cursor install target (mirror)
- `.opencode/skills/ai-first-integration/` — OpenCode install target (mirror)
- `graphify-out/GRAPH_REPORT.md` — graph artifact to verify is portable
- `scripts/install-skills.sh` — install script touched in this branch

**Verification**
1. `git diff main --name-only | wc -l` matches the expected count (~50 files) — no rogue files.
2. `python3 skills/ai-first-integration/scripts/merge-config.py` exits 0 on a dry-run or --help.
3. `diff -r skills/ai-first-integration .agents/skills/ai-first-integration` returns empty (no
   differences between source and install targets).
4. `grep -r "/Users/" graphify-out/` returns empty (no absolute paths in graph artifacts).
5. PR opens successfully; CI (if any) passes.

**Decisions**
- Scope: only the `ai-first-integration` skill export and graph refresh — no new feature code.
- Excluded: creating or running BMAD implementation-artifact stories (no sprint setup exists).
- Commit strategy: single squashed commit to keep history clean.

**Further Considerations**
1. **Graphify freshness** — if `graphify-out/` was regenerated inside the worktree it may contain
   the worktree's absolute path. Recommend re-running graphify on the canonical repo and copying
   the output, or verifying no absolute paths remain before merging.
