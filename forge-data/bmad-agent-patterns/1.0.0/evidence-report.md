---
skill_name: bmad-agent-patterns
generated: 2026-05-06
forge_tier: Forge
t2_future_count: 0
---

# Evidence Report: bmad-agent-patterns

**Generated:** 2026-05-06
**Forge Tier:** Forge
**Source:** `/Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any` @ `bfb08ff3` (main)

## Tool Versions

- ast-grep: 0.42.1
- QMD: N/A (not available at Forge tier)
- SKF: 1.4.0

## Extraction Summary

- Files in scope: 62 (across 6 agent skill directories)
- Files read: 10 (pattern saturation reached at file 5)
- Patterns extracted: 11
- Confidence: T1=0, T1-low=11, T2=0, T3=0
- Extraction method: source-reading (YAML/TOML/Markdown — no ast-grep patterns available for this language combination)

## Validation Results

- Schema: PASS (manual — skill-check flag probe: neither --no-security-scan nor --skip-security supported)
- Frontmatter: PASS (manual validation — all 6 checklist items satisfied)
- Body: skipped — skill-check automated flow unavailable (flag probe failed)
- Security: skipped — skill-check automated flow unavailable
- Content Quality (tessl): WARN — review 77%, description 100%, content 42% (below 60% floor; caused by two-tier design inter-tier overlap — covered by conciseness-redundancy-between-tiers dismissal rule)
- Metadata: PASS

## Quality Score Breakdown

- Description (tessl): 100% (specificity 3/3, trigger_term_quality 3/3, completeness 3/3, distinctiveness 3/3)
- Content (tessl): 42% (conciseness 1/3 — dismissed, actionability 3/3, workflow_clarity 2/3, progressive_disclosure 1/3 — dismissed)
- Review (tessl): 77%
- skill-check scoring: skipped (flag probe failure)

## Description Guard

- Restored: false
- Triggering tool: —
- Original description preserved: —
- Notes: —

## Auto-Fixed Issues

None (skill-check automated fix skipped due to flag probe failure)

## Dismissed tessl Suggestions

| Rule ID | Suggestion Text | Rationale |
|---------|----------------|-----------|
| conciseness-redundancy-between-tiers | Eliminate redundant sections: pick ONE location for each pattern's detail | Two-tier SKF design intentionally overlaps Tier 1 and Tier 2; conciseness scorer has no concept of this |
| move-full-api-reference | Commit to progressive disclosure: move 11 detailed pattern definitions to reference files | Two-tier design keeps Tier 2 inline by default; split-body handles extraction when size limits are exceeded |

## Novel tessl Suggestions — User Decision

- Suggestion 1: Add validation/verification steps after agent creation [SEMANTIC] → **Skipped by user**
- Suggestion 2: Remove provenance/SRC annotations from skill body [STRUCTURAL] → **Skipped by user**

## Remaining Warnings

- Language detection override: `skf-detect-language.py` returned `javascript` (false positive from
  `.opencode/node_modules` presence). Manually overridden to `yaml-toml-markdown` — the actual
  skill content is YAML frontmatter, TOML config, and Markdown.
- T1-low confidence throughout: YAML/TOML/Markdown is not in the ast-grep supported language list
  for Forge tier. All patterns extracted via source-reading. No AST node types verified by parser.
- Pattern saturation: 10 of 62 in-scope files were read. The remaining 52 are reference docs,
  templates, and scripts in `bmad-agent-builder/` that reinforce patterns P1-P11 without introducing
  new structural patterns.

## Auto-Decisions

| Step | Gate | Decision | Rationale | Timestamp |
|------|------|----------|-----------|-----------|
| 02 | Ecosystem Check | Skipped | No ecosystem registry API available | 2026-05-06 |
| 04 | Enrich | Skipped | Forge tier — QMD not available | 2026-05-06 |
