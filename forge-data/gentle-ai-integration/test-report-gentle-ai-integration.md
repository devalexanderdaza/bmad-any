# Test Report — gentle-ai-integration

**Date**: 2026-05-05  
**Skill version**: 0.1.0  
**Result**: PASS-with-drift  
**Score**: 85/100

---

## Summary

The skill is structurally complete and logically coherent. The On Activation steps correctly cover all declared capability actions. All referenced assets and scripts exist. Two drift items found: metadata tier understates actual quality, and export artifacts are missing.

---

## Checks

| Check | Result | Detail |
|-------|--------|--------|
| Frontmatter (name, description) | ✅ PASS | Both present |
| Invocation contract table | ✅ PASS | Inputs/Outputs/Headless/Tokens all defined |
| Action aliases consistent | ✅ PASS | BW fix applied: now lists setup\|configure\|install\|diagnose\|sync\|run |
| On Activation covers all actions | ✅ PASS | Steps 2+6 map configure→setup flow, diagnose, sync, run |
| Capability Actions section | ✅ PASS | 4 actions: configure, diagnose, sync, run |
| Referenced assets exist | ✅ PASS | assets/module-setup.md, assets/install-guide.md, assets/module.yaml, assets/module-help.csv |
| Referenced scripts exist | ✅ PASS | scripts/merge-config.py, scripts/merge-help-csv.py |
| Headless mode documented | ✅ PASS | {headless_mode} token in Invocation Contract |
| Non-destructive policy | ✅ PASS | Notes section present |
| metadata.json confidence_tier | ⚠️ DRIFT | "Quick" with export_count:0 — content is Forge-level (has On Activation, assets, scripts) |
| context-snippet.md | ❌ MISSING | Required for skf-export-skill |
| .export-manifest.json | ❌ MISSING | Required for skf-export-skill |

---

## Gaps (for US)

1. **metadata.json**: upgrade `confidence_tier` from "Quick" to "Forge"; set `export_count` to 1 after first export.
2. **context-snippet.md**: create at `skills/gentle-ai-integration/context-snippet.md`.
3. **skills/.export-manifest.json**: create with gentle-ai-integration entry for all 4 IDEs.

---

## Coherence Check

- Invocation contract `action` aliases now match Overview modes ✅
- On Activation step 6 correctly gates `run` on user-provided args (required) ✅  
- `diagnose` terminates early without side effects ✅
- Setup flow delegates to `./assets/module-setup.md` then returns ✅
