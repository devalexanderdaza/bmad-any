---
workflowType: 'test-skill'
skillName: 'bmad-agent-patterns'
skillDir: 'skills/bmad-agent-patterns/1.0.0/bmad-agent-patterns'
runId: '20260506T000100Z-0001-a4f2'
testMode: 'naive'
forgeTier: 'Forge'
testResult: 'pass-with-drift'
score: '96.58'
threshold: '80'
analysisConfidence: 'full'
toolingStatus: 'ok'
workspaceDrift: 'overridden'
health_check_dispatched: true
testDate: '2026-05-06T00:01:00Z'
stepsCompleted: ['step-01-init', 'step-02-detect-mode', 'step-03-coverage-check', 'step-04-coherence-check', 'step-04b-external-validators', 'step-05-score', 'step-06-report']
nextWorkflow: 'update-skill'
---

# Test Report: bmad-agent-patterns

## Test Summary

**Skill:** bmad-agent-patterns
**Test Mode:** naive
**Forge Tier:** Forge

**Mode Rationale:** `skill_type: single` in metadata — individual skill with self-contained API surface, no cross-references to other skills.

**Analysis Plan:**
- Coverage Check: documented patterns vs source API surface (11 structural patterns vs .agents/skills/ directories)
- Coherence Check: basic structural validation — frontmatter, section completeness, key-type accuracy (no cross-reference verification in naive mode)

## Coverage Analysis

**Tier:** Forge
**Source Access:** full (State 1 — local source at `/Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any`)
**Source Path:** `.agents/skills/bmad-agent-{analyst,architect,dev,pm,tech-writer,builder}/`
**Files Analyzed:** 10 (pattern saturation at 5; pattern-reference skill — no barrel entry point)
**Denominator:** pattern-reference — canonicalized provenance-map count (11 patterns)

> **Note:** YAML/TOML/Markdown has no ast-grep patterns at Forge tier. Signature Accuracy and Type Coverage cannot be AST-verified — weights redistributed (equivalent to Quick-tier for sig/type categories). T1-low (source-reading) throughout.

> **Spot-check note:** Provenance-map identifiers (kebab-case) do not appear verbatim in SKILL.md — patterns documented under section headings "Pattern P1 — ...", "Pattern P11 — ...". Spot-check validated with augmented names: Pattern P1 ✓ (L209), Pattern P7 ✓ (L314), Pattern P11 ✓ (L377). Not fabrication — naming convention difference.

### Export Coverage

| Pattern | Type | Documented | Sig Verified | Source Location | Status |
|---------|------|-----------|-------------|-----------------|--------|
| P1 — SKILL.md-frontmatter | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-analyst/SKILL.md:L1` | PASS |
| P2 — conventions-block | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-analyst/SKILL.md:L14` | PASS |
| P3 — 8-step-activation | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-analyst/SKILL.md:L19` | PASS |
| P4 — agent-block-resolution | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-analyst/SKILL.md:L22` | PASS |
| P5 — customize-toml-metadata | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-builder/references/standard-fields.md:L54` | PASS |
| P6 — customize-toml-override-surface | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-analyst/customize.toml:L14` | PASS |
| P7 — merge-rules | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-analyst/customize.toml:L13` | WARN |
| P8 — agent-menu-item | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-analyst/customize.toml:L57` | PASS |
| P9 — override-file-locations | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-builder/references/standard-fields.md:L113` | PASS |
| P10 — agent-archetypes | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-builder/SKILL.md:L35` | WARN |
| P11 — workflow-agent-pattern | structural-pattern | yes | T1-low | `.agents/skills/bmad-agent-builder/SKILL.md:L19` | PASS |

### Coverage Summary

- **Patterns Found (source/provenance-map):** 11
- **Documented:** 11 (100%)
- **Missing Documentation:** 0
- **Cross-check Mismatches (SKILL.md body vs references/):** 2 — P7, P10 (High severity)
- **Stale Documentation:** 0

### Split-Body Cross-Check Findings

**Finding CB-1 (High) — P7 merge-rules:**
`references/activation-sequence.md:46` lists "Tables: deep-merge" as a 4th merge category.
SKILL.md P7 (L314) and `references/customize-toml-schema.md` document only 3 categories (scalars, plain arrays, arrays-of-tables). SKILL.md body is authoritative — reference file needs correction.

**Finding CB-2 (High) — P10 agent-archetypes:**
`references/agent-archetypes.md:64` lists `MEMORY.md` as a required sanctum file (6 total: PERSONA, CREED, BOND, CAPABILITIES, MEMORY, First Breath).
SKILL.md body (L163, L369) lists only 5 files (omits MEMORY.md). Source verification (`.agents/skills/bmad-agent-builder/SKILL.md:L35` — "6 standard files + First Breath") confirms the reference is correct — **SKILL.md body needs correction** (add MEMORY.md to the sanctum files list).

### Category Scores

| Category | Score | Notes |
|----------|-------|-------|
| Export Coverage | 100% | 11/11 patterns documented |
| Signature Accuracy | 90.9% (T1-low) | 10/11 — P10 body missing MEMORY.md (source-verified); no ast-grep; scored via manual T1-low source reading |
| Type Coverage | 100% (T1-low) | All documented types verified against source; no ast-grep; scored via manual T1-low source reading |

## Coherence Analysis

**Mode:** Naive (structural validation only)
**Coherence category:** Not scored (weight redistributed)

### Structural Findings

| # | Type | Detail | Line |
|---|------|--------|------|
| 1 | bare_opening_fence | Pattern P9 override-file-locations path block has no language tag (use `text`) | L352 |
| 2 | bare_opening_fence | Pattern P11 workflow meta-agent file-structure block has no language tag (use `text`) | L396 |

**Structural Issues:** 2 (Medium severity)

> §2.1 required sections: PASS | §2.2 fence balance: PASS (34 = 17 pairs) | §2.4 N/A (no function/method exports) | §2.5 N/A (no async) | §2.6 table columns: PASS | §2.7 scripts/assets: PASS

### Reference Consistency (split-body)

| # | Reference File | Pattern | Issue | SKILL.md Line | Reference Line |
|---|---------------|---------|-------|---------------|----------------|
| 1 | references/activation-sequence.md | P7 — merge-rules | Reference lists 4th merge category "Tables: deep-merge" absent from SKILL.md P7 and customize-toml-schema.md | L314 | L46 |
| 2 | references/agent-archetypes.md | P10 — agent-archetypes | Reference lists 6 sanctum files (adds MEMORY.md); SKILL.md body lists 5 (omits MEMORY.md) | L163, L369 | L64 |

**Exports Cross-Checked:** 11
**Mismatches Found:** 2 (High severity)

## External Validation

### skill-check
- **Available:** yes
- **Quality Score:** 100/100
- **Errors:** 0
- **Warnings:** 0
- **Diagnostics:** none (all categories full score: frontmatter 30/30, description 30/30, body 20/20, links 10/10, file 10/10)

### tessl
- **Available:** yes (auto-reused from create-skill evidence-report — SKILL.md unchanged)
- **Validation:** content below threshold (expected — split-body skill)
- **Description Score:** 100%
- **Content Score:** 42% ⚠ (expected — Tier 2 content in references/, tessl scans body only; pre-split score was baseline; two suggestions dismissed by active rules)
- **Review Score:** 77%
- **Suggestions:** previously reviewed and dismissed (conciseness-redundancy-between-tiers, move-full-api-reference) — no novel suggestions remain

> **Content quality note:** tessl content score of 42% reflects post-split-body inline content only. Tier 2 (Full API Reference, Full Type Definitions) lives in `references/*.md`. This is expected for a two-tier skill. Per `scoring-rules.md`: "use the pre-split tessl score as the content quality baseline." No action needed.

### Combined External Score
- **External Validation Score:** 88.5% ( (100 + 77) / 2 )
- **Tools used:** skill-check (live run), tessl (auto-reused from evidence-report)

## Completeness Score

**Score: 96.58% — PASS-WITH-DRIFT** (threshold: 80%)

> Workspace drift detected (HEAD 68f3cdc vs pinned bfb08ff3). Drift is benign — only forge-data/ and skills/ output artifacts committed after create-skill; no source files (.agents/skills/**) changed. `allow_workspace_drift: true` applied. Per M5 rule, result written as `pass-with-drift` and nextWorkflow forced to `update-skill`.

### Score Breakdown

| Category | Weight | Raw Score | Weighted |
|----------|--------|-----------|---------|
| Export Coverage | 45% | 100% | 45.00 |
| Signature Accuracy | 25% | 90.9% | 22.73 |
| Type Coverage | 20% | 100% | 20.00 |
| Coherence | 0% (redistributed — naive mode) | — | 0.00 |
| External Validation | 10% | 88.5% | 8.85 |
| **Total** | **100%** | | **96.58%** |

### Score Rationale

- **Export Coverage 100%**: All 11 patterns documented; 0 missing.
- **Signature Accuracy 90.9% (10/11)**: P10 agent-archetypes inaccurate — SKILL.md body (L163, L369) lists 5 sanctum files; authoritative source (`.agents/skills/bmad-agent-builder/SKILL.md:L35`) says "6 standard files + First Breath" (PERSONA, CREED, BOND, CAPABILITIES, MEMORY, First Breath). P7 accurate in SKILL.md body; error is in references/activation-sequence.md (reference file has stale "Tables: deep-merge" — not a SKILL.md body inaccuracy).
- **Type Coverage 100%**: All documented types verified — `agent_type` enum (stateless/memory/autonomous) and `customize.toml` field types confirmed against source.
- **External Validation 88.5%**: skill-check 100/100; tessl review 77% (content 42% expected for split-body — covered by active dismissal rules; pre-split score is baseline per scoring-rules.md).

### compute-score.py Output

```json
{
  "activeCategories": ["exportCoverage", "signatureAccuracy", "typeCoverage", "externalValidation"],
  "skippedCategories": ["coherence"],
  "weights": {"exportCoverage": 45.0, "signatureAccuracy": 25.0, "typeCoverage": 20.0, "coherence": 0, "externalValidation": 10.0},
  "weightedScores": {"exportCoverage": 45.0, "signatureAccuracy": 22.73, "typeCoverage": 20.0, "coherence": 0, "externalValidation": 8.85},
  "totalScore": 96.58,
  "threshold": 80,
  "result": "PASS"
}
```

## Gap Report

**Total Gaps:** 4
**Blocking (Critical + High):** 1
**Non-blocking (Medium + Low + Info):** 3

### Remediation Summary

| Severity | Count | Estimated Effort |
|----------|-------|-----------------|
| Critical | 0 | — |
| High | 1 | ~30 min — source re-read + SKILL.md body edit |
| Medium | 3 | ~10 min each — targeted edits to reference file and SKILL.md fences |
| Low | 0 | — |
| Info | 0 | — |
| **Total** | **4** | ~1 hour |

---

### GAP-001: P10 agent-archetypes — SKILL.md body missing MEMORY.md from sanctum files

**Severity:** High
**Category:** Coverage — Signature Accuracy
**Source:** `skills/bmad-agent-patterns/1.0.0/bmad-agent-patterns/SKILL.md:L163, L369`

**Issue:** Pattern P10 documents the sanctum file list with 5 files (PERSONA, CREED, BOND, CAPABILITIES, First Breath). The authoritative source (`.agents/skills/bmad-agent-builder/SKILL.md:L35`) and `references/agent-archetypes.md:L64` both list 6 required files — MEMORY.md is omitted from the SKILL.md body.

**Remediation:** Add `MEMORY.md` to the sanctum files list in SKILL.md at both occurrences (L163 and L369). Update the list to read: `PERSONA.md`, `CREED.md`, `BOND.md`, `CAPABILITIES.md`, `MEMORY.md`, `First Breath` (6 files total). Verify against `.agents/skills/bmad-agent-builder/SKILL.md:L35`.

---

### GAP-002: P7 merge-rules — references/activation-sequence.md has undocumented merge category

**Severity:** Medium
**Category:** Coherence — Reference Consistency (split-body)
**Source:** `skills/bmad-agent-patterns/1.0.0/bmad-agent-patterns/references/activation-sequence.md:L46`

**Issue:** `references/activation-sequence.md:L46` lists "Tables: deep-merge" as a 4th merge category. SKILL.md P7 (L314) and `references/customize-toml-schema.md` document only 3 categories (scalars, plain arrays, arrays-of-tables). SKILL.md body is authoritative and matches source behavior — the reference file has a stale or speculative entry.

**Remediation:** Remove the "Tables: deep-merge" entry from `references/activation-sequence.md:L46`. If this feature was planned but not implemented, move it to a `## Future / Planned` subsection or remove entirely. Verify that `.agents/skills/bmad-agent-analyst/customize.toml:L13` does not exercise deep-merge before removing.

---

### GAP-003: P9 code fence missing language tag

**Severity:** Medium
**Category:** Coherence — Structural
**Source:** `skills/bmad-agent-patterns/1.0.0/bmad-agent-patterns/SKILL.md:L352`

**Issue:** Pattern P9 (override-file-locations) contains a file-path block opened with a bare ` ``` ` fence (no language tag). Bare fences suppress syntax highlighting and reduce readability in IDEs and rendered output.

**Remediation:** Change the opening fence at L352 from ` ``` ` to ` ```text ` to explicitly mark the block as plain text.

---

### GAP-004: P11 code fence missing language tag

**Severity:** Medium
**Category:** Coherence — Structural
**Source:** `skills/bmad-agent-patterns/1.0.0/bmad-agent-patterns/SKILL.md:L396`

**Issue:** Pattern P11 (workflow-agent-pattern) contains a file-structure block opened with a bare ` ``` ` fence (no language tag). Same issue as GAP-003.

**Remediation:** Change the opening fence at L396 from ` ``` ` to ` ```text ` to explicitly mark the block as plain text.

---

### Discovery Quality

**Catalog Size:** 4 skills with SKILL.md (bmad-agent-patterns, bmad-method, gentle-ai-integration, graphify-integration)

**Prompts tested:**

| # | Prompt | Selected Skill | Confidence | Outcome |
|---|--------|---------------|-----------|---------|
| 1 | "How do I structure a new agent for my BMAD project?" | bmad-agent-patterns | high | PASS |
| 2 | "I need to add a custom role with its own persona — what goes in customize.toml?" | bmad-agent-patterns | high | PASS |
| 3 | "What is the difference between stateless, memory, and autonomous agents in BMAD?" | bmad-agent-patterns | high | PASS |

**Discovery result: 3/3 PASS** — description triggers route correctly across all tested prompts. No remediation needed.

**description_score (tessl):** 100% — no optimization needed.
