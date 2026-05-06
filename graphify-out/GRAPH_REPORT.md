# Graph Report - bmad-any  (2026-05-06)

## Corpus Check
- 216 files · ~150,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 555 nodes · 799 edges · 42 communities detected
- Extraction: 99% EXTRACTED · 1% INFERRED · 0% AMBIGUOUS · INFERRED: 5 edges (avg confidence: 0.78)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Cluster 0|Cluster 0]]
- [[_COMMUNITY_Skill Lifecycle|Skill Lifecycle]]
- [[_COMMUNITY_Skill Lifecycle|Skill Lifecycle]]
- [[_COMMUNITY_Cluster 3|Cluster 3]]
- [[_COMMUNITY_Cluster 4|Cluster 4]]
- [[_COMMUNITY_Cluster 5|Cluster 5]]
- [[_COMMUNITY_Cluster 6|Cluster 6]]
- [[_COMMUNITY_Cluster 7|Cluster 7]]
- [[_COMMUNITY_Cluster 8|Cluster 8]]
- [[_COMMUNITY_Cluster 9|Cluster 9]]
- [[_COMMUNITY_Cluster 10|Cluster 10]]
- [[_COMMUNITY_Cluster 11|Cluster 11]]
- [[_COMMUNITY_Cluster 12|Cluster 12]]
- [[_COMMUNITY_Cluster 13|Cluster 13]]
- [[_COMMUNITY_Cluster 14|Cluster 14]]
- [[_COMMUNITY_Cluster 15|Cluster 15]]
- [[_COMMUNITY_Cluster 16|Cluster 16]]
- [[_COMMUNITY_Cluster 17|Cluster 17]]
- [[_COMMUNITY_Cluster 18|Cluster 18]]
- [[_COMMUNITY_Cluster 19|Cluster 19]]
- [[_COMMUNITY_Cluster 20|Cluster 20]]
- [[_COMMUNITY_Cluster 21|Cluster 21]]
- [[_COMMUNITY_Cluster 22|Cluster 22]]
- [[_COMMUNITY_Cluster 23|Cluster 23]]
- [[_COMMUNITY_Cluster 24|Cluster 24]]
- [[_COMMUNITY_Cluster 25|Cluster 25]]
- [[_COMMUNITY_Cluster 26|Cluster 26]]
- [[_COMMUNITY_Cluster 27|Cluster 27]]
- [[_COMMUNITY_Cluster 28|Cluster 28]]
- [[_COMMUNITY_Cluster 29|Cluster 29]]
- [[_COMMUNITY_Cluster 30|Cluster 30]]
- [[_COMMUNITY_Cluster 31|Cluster 31]]
- [[_COMMUNITY_Cluster 32|Cluster 32]]
- [[_COMMUNITY_Cluster 33|Cluster 33]]
- [[_COMMUNITY_Cluster 34|Cluster 34]]
- [[_COMMUNITY_Cluster 35|Cluster 35]]
- [[_COMMUNITY_Cluster 36|Cluster 36]]
- [[_COMMUNITY_Cluster 37|Cluster 37]]
- [[_COMMUNITY_Cluster 38|Cluster 38]]
- [[_COMMUNITY_Cluster 39|Cluster 39]]
- [[_COMMUNITY_Cluster 40|Cluster 40]]
- [[_COMMUNITY_Cluster 41|Cluster 41]]

## God Nodes (most connected - your core abstractions)
1. `_build_workspaces()` - 10 edges
2. `read_manifest()` - 10 edges
3. `assemble_envelope()` - 10 edges
4. `cmd_write()` - 9 edges
5. `cmd_flip_link()` - 9 edges
6. `_die()` - 9 edges
7. `cmd_merge()` - 9 edges
8. `detect()` - 8 edges
9. `cmd_write_tools()` - 8 edges
10. `cmd_emit()` - 8 edges

## Surprising Connections (you probably didn't know these)
- `skf-audit-skill workflow` --references--> `Drift Report Template`  [INFERRED]
  /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/_bmad/skf/skf-audit-skill/SKILL.md → /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/_bmad/skf/skf-audit-skill/assets/drift-report-template.md
- `SKF: Skill Forge v0.1.0` --configures--> `SKF Configuration`  [INFERRED]
  /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/_bmad/skf/module.yaml → /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/_bmad/skf/config.yaml
- `SKF Configuration` --references--> `Alexander (User)`  [INFERRED]
  /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/_bmad/skf/config.yaml → /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/_bmad/config.user.yaml
- `skf-create-stack-skill workflow` --references--> `Compose Mode Rules`  [INFERRED]
  /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/_bmad/skf/skf-create-stack-skill/SKILL.md → /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/_bmad/skf/skf-create-stack-skill/references/compose-mode-rules.md
- `skf-create-stack-skill workflow` --references--> `Manifest Detection Patterns`  [INFERRED]
  /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/_bmad/skf/skf-create-stack-skill/SKILL.md → /Users/devalexanderdaza/Laboratory/GitHub/devalexanderdaza/bmad-any/_bmad/skf/skf-create-stack-skill/references/manifest-patterns.md

## Hyperedges (group relationships)
- **Skill Creation Pipeline** — skf_create_skill, create_skill_stage_load_brief, create_skill_stage_ecosystem_check, create_skill_stage_extract, create_skill_stage_enrich, create_skill_stage_compile, create_skill_stage_validate, create_skill_stage_generate_artifacts, create_skill_stage_report, create_skill_stage_health_check [INFERRED]
- **Verification Pipeline** — skf_verify_stack, verify_stack_stage_init, verify_stack_stage_coverage, verify_stack_stage_integrations, verify_stack_stage_requirements, verify_stack_stage_synthesize, verify_stack_stage_report, verify_stack_stage_health_check [INFERRED]
- **Update Pipeline** — skf_update_skill, update_skill_stage_init, update_skill_stage_detect_changes, update_skill_stage_re_extract, update_skill_stage_merge, update_skill_stage_validate, update_skill_stage_write, update_skill_stage_report, update_skill_stage_health_check [INFERRED]
- **Forge Tier Capabilities** — forge_tier, quick_tier, forge_tier_level, forge_plus_tier, deep_tier, extraction_patterns, confidence_tier_t1_low, confidence_tier_t1, confidence_tier_t2 [INFERRED]
- **Integration Verification Framework** — integration_verification_rules, language_boundary_check, protocol_compatibility_check, type_compatibility_check, cross_reference_check, verdict_tokens [INFERRED]
- **Source Resolution System** — tag_resolution, explicit_tag_resolution, implicit_tag_resolution, workspace_protocol, ephemeral_clone_fallback [INFERRED]
- **Merge Strategy System** — merge_conflict_rules, category_modified_exports, category_new_exports, category_deleted_exports, category_moved_exports, category_renamed_exports, manual_section_preservation [INFERRED]
- **Ferris Personality System** — skf_forger, ferris_architect_mode, ferris_surgeon_mode, ferris_audit_mode, ferris_delivery_mode, ferris_management_mode [INFERRED]
- **Quality & Integrity Principles** — zero_hallucination_principle, ast_first_principle, evidence_obligation, manual_section_preservation, provenance_tracking [INFERRED]
- **** — quick_skill, qs_step_01, qs_step_02, qs_step_03, qs_step_04, qs_step_05, qs_step_06, qs_step_07 [INFERRED]
- **** — brief_skill, bs_step_01, bs_step_02, bs_step_03, bs_step_04, bs_step_05, bs_step_06 [INFERRED]
- **** — quick_skill, qs_feature_batch_mode, qs_feature_version_targeting [INFERRED]
- **** — brief_skill, bs_feature_monorepo_detection, bs_feature_scope_recommendation, docs_only_source_type [INFERRED]
- **** — headless_mode_flow, headless_args_validation, result_contract_json_envelope [INFERRED]
- **** — extractors_parsers, registry_resolution_chain, atomic_write_operations, multi_language_support [INFERRED]
- **** — frontmatter_schema, skill_brief_schema, version_resolution_precedence, headless_args_validation [INFERRED]
- **First-Time Setup Flow (Brownfield)** — workflow_sf, workflow_an, workflow_cs, workflow_ts, workflow_ex [INFERRED 0.95]
- **Single Skill Full Quality Flow** — workflow_sf, workflow_bs, workflow_cs, workflow_ts, workflow_ex [INFERRED 0.95]
- **Single Skill Fast Flow** — workflow_sf, workflow_qs, workflow_ex [INFERRED 0.95]
- **Pre-Code Stack Verification Flow** — workflow_sf, workflow_cs, workflow_vs, workflow_ra, workflow_ss, workflow_ts, workflow_ex [INFERRED 0.90]
- **Maintenance Flow** — workflow_as, workflow_us, workflow_ts, workflow_ex [INFERRED 0.95]
- **Capability Tier Requirements** — tier_quick, tier_forge, tier_forge_plus, tier_deep, tool_ast_grep, tool_gh_cli, tool_qmd, tool_ccc [INFERRED 0.95]
- **Skill Generation Output Artifacts** — artifact_skill_md, artifact_metadata_json, artifact_provenance_map, artifact_evidence_report, storage_skill_package [INFERRED 0.95]
- **Verification and Quality Principles** — concept_zero_hallucination, concept_provenance, concept_drift, knowledge_zero_hallucination, knowledge_provenance [INFERRED 0.90]
- **Configuration Multi-Layer Resolution** — config_customize_toml, config_bmad_config_toml, script_resolve_customization, script_resolve_config [INFERRED 0.90]

## Communities

### Community 0 - "Cluster 0"
Cohesion: 0.04
Nodes (54): Deleted Exports Category, Modified Exports Category, Moved Exports Category, New Exports Category, Renamed Exports Category, Compile Stage, Ecosystem Check Stage, Enrich Stage (+46 more)

### Community 1 - "Skill Lifecycle"
Cohesion: 0.04
Nodes (51): agentskills.io Specification, drift-report.md, evidence-report.md, forge-tier.yaml, metadata.json, provenance-map.json, SKILL.md, BMAD Method (+43 more)

### Community 2 - "Skill Lifecycle"
Cohesion: 0.08
Nodes (34): Atomic Write Operations, Brief Skill, Monorepo Workspace Detection, Scope Type Recommendation, BS Step 1: Gather Intent, BS Step 2: Analyze Target, BS Step 3: Scope Definition, BS Step 4: Confirm Brief (+26 more)

### Community 3 - "Cluster 3"
Cohesion: 0.14
Nodes (27): assemble_envelope(), _assemble_warnings(), cmd_emit(), cmd_validate(), _compute_tool_deltas(), _die(), emit_envelope_line(), _freeze() (+19 more)

### Community 4 - "Cluster 4"
Cohesion: 0.09
Nodes (17): _detect_placeholder_version(), extract(), main(), parse_gradle(), parse_pom_xml(), parse_settings_gradle(), parse_setup_py(), Best-effort regex parse of setup.py — does NOT execute the file. (+9 more)

### Community 5 - "Cluster 5"
Cohesion: 0.16
Nodes (21): calculate_tier(), detect(), _die(), _first_line(), main(), _ok(), probe_ast_grep(), probe_ccc() (+13 more)

### Community 6 - "Cluster 6"
Cohesion: 0.17
Nodes (20): _build_workspaces(), detect(), detect_cargo_workspace(), detect_generic_folders(), detect_lerna(), detect_npm_workspaces(), detect_pnpm_workspaces(), detect_python_multi_package() (+12 more)

### Community 7 - "Cluster 7"
Cohesion: 0.23
Nodes (20): _atomic_write(), cmd_clean_stale(), cmd_init_prefs(), cmd_read(), cmd_register_qmd_collection(), cmd_write_tools(), _die(), main() (+12 more)

### Community 8 - "Cluster 8"
Cohesion: 0.2
Nodes (18): _acquire_lock(), cmd_commit_dir(), cmd_flip_link(), cmd_stage_dir(), cmd_write(), _create_symlink_or_junction(), _die(), _is_link_or_junction() (+10 more)

### Community 9 - "Cluster 9"
Cohesion: 0.2
Nodes (16): _component_registry_match(), _die(), _find_registry_files(), _has_component_array_annotation(), main(), _narrow_public_api_match(), _parse_argv(), Return repo-relative paths matching registry.ts / components.ts (any depth). (+8 more)

### Community 10 - "Cluster 10"
Cohesion: 0.2
Nodes (16): assemble_patterns(), _atomic_write(), cmd_merge(), _die(), main(), merge_patterns(), _ok(), Crash-safe write via temp + fsync + rename. Mirrors skf-atomic-write.py. (+8 more)

### Community 11 - "Cluster 11"
Cohesion: 0.23
Nodes (15): assemble_brief(), atomic_write(), cmd_write(), _die(), flat_to_nested(), main(), Apply the version-precedence rule. Returns the resolved version string.      Use, Validate the context payload. Raises via _die on hard errors; returns warnings. (+7 more)

### Community 12 - "Cluster 12"
Cohesion: 0.28
Nodes (15): cmd_deprecate(), cmd_get(), cmd_read(), cmd_remove(), cmd_rename(), cmd_set(), main(), _migrate_v1_to_v2() (+7 more)

### Community 13 - "Cluster 13"
Cohesion: 0.25
Nodes (15): cmd_check(), cmd_clear(), cmd_insert(), cmd_read(), cmd_replace(), find_managed_section(), main(), Replace managed section content between markers. (+7 more)

### Community 14 - "Cluster 14"
Cohesion: 0.24
Nodes (14): _basename(), detect(), _die(), _extension(), _frequency_fallback(), _has_basename(), _has_path_segment(), _has_suffix() (+6 more)

### Community 15 - "Cluster 15"
Cohesion: 0.24
Nodes (12): _http_get_json(), main(), parse_github_url(), Fetch JSON. Returns (payload_or_None, outcome).      Outcome values:       "ok", Try the npm registry. Returns (parsed_or_None, outcome)., Try the PyPI registry. Returns (parsed_or_None, outcome)., Try the crates.io registry. Returns (parsed_or_None, outcome)., Parse a GitHub URL/string into (canonical_url, owner, repo).      Handles the va (+4 more)

### Community 16 - "Cluster 16"
Cohesion: 0.22
Nodes (13): AST-backed Extraction, AST-First Principle, T1 Confidence Tier, T1-low Confidence Tier, T2 Confidence Tier, Extract Stage, Deep Tier, Extraction Patterns (+5 more)

### Community 17 - "Cluster 17"
Cohesion: 0.26
Nodes (11): classify(), _die(), is_forge_owned(), load_registry_names(), main(), _ok(), parse_live_names(), True if `name` ends with one of the forge suffixes. (+3 more)

### Community 18 - "Cluster 18"
Cohesion: 0.27
Nodes (11): deep_merge(), _detect_keyed_merge_field(), extract_key(), find_project_root(), load_toml(), main(), _merge_arrays(), _merge_by_key() (+3 more)

### Community 19 - "Cluster 19"
Cohesion: 0.25
Nodes (10): Validate metadata.json fields. Returns list of issues., Validate a complete skill package directory.      When `skip_frontmatter` is Tru, Validate SKILL.md frontmatter. Returns list of issues., Validate SKILL.md body has required sections. Returns list of issues., Validate context-snippet.md format. Returns list of issues., validate_body_structure(), validate_context_snippet(), validate_frontmatter() (+2 more)

### Community 20 - "Cluster 20"
Cohesion: 0.24
Nodes (11): Capability Tiers, Progressive Capability Knowledge, skf-merge-ccc-exclusions.py, Deep Tier, Forge Tier, Forge+ Tier, Quick Tier, ast-grep (+3 more)

### Community 21 - "Cluster 21"
Cohesion: 0.27
Nodes (9): diff_inventories(), entry_matches(), index_by_name(), load_inventory(), main(), Return True if two entries are identical across all DIFF_FIELDS., Compute the structural diff between two export inventories.      Returns a dict, Load an export inventory from a JSON file.      Accepts either:       - {"export (+1 more)

### Community 22 - "Cluster 22"
Cohesion: 0.33
Nodes (10): Drift Report Template, Severity Classification Rules, skf-audit-skill workflow, Step 1: Initialize & Baseline, Step 2: Re-Index Source, Step 3: Structural Diff, Step 4: Semantic Diff, Step 5: Severity Classification (+2 more)

### Community 23 - "Cluster 23"
Cohesion: 0.33
Nodes (8): Scan the skills output folder and produce an inventory., Read a JSON file, returning (data, None) or (None, error)., Resolve the active version for a skill group directory.      Returns (version_st, Scan a single skill group directory and return its inventory entry., read_json_file(), resolve_active_version(), scan_inventory(), scan_skill_group()

### Community 24 - "Cluster 24"
Cohesion: 0.44
Nodes (8): assemble(), cmd_emit(), cmd_validate(), _die(), main(), Build the envelope from a context payload, deriving exit_code., Validate an envelope dict against the schema. Exits non-zero on failure., validate()

### Community 25 - "Cluster 25"
Cohesion: 0.36
Nodes (7): main(), parse_frontmatter(), Validate skill name format. Aligned with canonical validator.py., Validate SKILL.md frontmatter against agentskills.io spec.      Returns a result, Extract and parse YAML frontmatter from SKILL.md content.      Returns (parsed_d, validate_frontmatter(), _validate_name()

### Community 26 - "Cluster 26"
Cohesion: 0.32
Nodes (7): _iso_utc_now(), main(), _normalize_exports(), Returns 'YYYY-MM-DDTHH:MM:SSZ' for the current UTC instant., Render the metadata.json envelope. Pass `now_fn` to inject a     deterministic t, Accept either a list of strings or a list of {name, type, ...} dicts.     Return, render_metadata()

### Community 27 - "Cluster 27"
Cohesion: 0.46
Nodes (7): deep_merge(), _detect_keyed_merge_field(), extract_key(), load_toml(), main(), _merge_arrays(), _merge_by_key()

### Community 28 - "Cluster 28"
Cohesion: 0.38
Nodes (6): classify_all(), classify_finding(), compute_drift_score(), Classify all findings and compute drift score., Classify a single finding's severity. Returns severity string., Compute overall drift score from classified findings.

### Community 29 - "Cluster 29"
Cohesion: 0.53
Nodes (5): compute_score(), make_error(), Round to 2 decimal places using JavaScript-compatible rounding.      JavaScript, round2(), validate_input()

### Community 30 - "Cluster 30"
Cohesion: 0.5
Nodes (4): load_yaml_file(), Load a YAML file, returning (data, None) or (None, error_string)., Run preflight checks and return a result dict., run_preflight()

### Community 31 - "Cluster 31"
Cohesion: 0.7
Nodes (5): skf-rename-skill workflow, Step 1: Select Rename Target, Step 2: Execute Rename (Transactional), Step 3: Report Rename Results, Step 4: Workflow Health Check

### Community 32 - "Cluster 32"
Cohesion: 0.83
Nodes (3): _err(), main(), validate()

### Community 33 - "Cluster 33"
Cohesion: 0.5
Nodes (4): AI-First Integration v0.1.0, BMAD Root Configuration, Gentle-AI Integration v0.1.0, Graphify Integration v0.1.0

### Community 34 - "Cluster 34"
Cohesion: 0.5
Nodes (4): Alexander (User), User Configuration, SKF Configuration, SKF: Skill Forge v0.1.0

### Community 35 - "Cluster 35"
Cohesion: 0.67
Nodes (3): Compose Mode Rules, Manifest Detection Patterns, skf-create-stack-skill workflow

### Community 36 - "Cluster 36"
Cohesion: 1.0
Nodes (2): graphify-integration v0.1.0, graphify

### Community 37 - "Cluster 37"
Cohesion: 1.0
Nodes (2): ai-first-integration v0.1.0, ai-first-cli

### Community 38 - "Cluster 38"
Cohesion: 1.0
Nodes (2): config.toml/.user.toml, resolve_config.py

### Community 39 - "Cluster 39"
Cohesion: 1.0
Nodes (1): Source Resolution Protocols

### Community 40 - "Cluster 40"
Cohesion: 1.0
Nodes (1): Ferris Operational Modes

### Community 41 - "Cluster 41"
Cohesion: 1.0
Nodes (1): bmad-method v6.6.0

## Knowledge Gaps
- **124 isolated node(s):** `Extract and parse YAML frontmatter from SKILL.md content.      Returns (parsed_d`, `Validate skill name format. Aligned with canonical validator.py.`, `Validate SKILL.md frontmatter against agentskills.io spec.      Returns a result`, `True when any path contains the given segment (e.g. 'src/main/kotlin/').`, `Return the lowercased file extension including the leading dot, or empty string.` (+119 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Cluster 36`** (2 nodes): `graphify-integration v0.1.0`, `graphify`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Cluster 37`** (2 nodes): `ai-first-integration v0.1.0`, `ai-first-cli`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Cluster 38`** (2 nodes): `config.toml/.user.toml`, `resolve_config.py`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Cluster 39`** (1 nodes): `Source Resolution Protocols`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Cluster 40`** (1 nodes): `Ferris Operational Modes`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Cluster 41`** (1 nodes): `bmad-method v6.6.0`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What connects `Extract and parse YAML frontmatter from SKILL.md content.      Returns (parsed_d`, `Validate skill name format. Aligned with canonical validator.py.`, `Validate SKILL.md frontmatter against agentskills.io spec.      Returns a result` to the rest of the system?**
  _124 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Cluster 0` be split into smaller, more focused modules?**
  _Cohesion score 0.04 - nodes in this community are weakly interconnected._
- **Should `Skill Lifecycle` be split into smaller, more focused modules?**
  _Cohesion score 0.04 - nodes in this community are weakly interconnected._
- **Should `Skill Lifecycle` be split into smaller, more focused modules?**
  _Cohesion score 0.08 - nodes in this community are weakly interconnected._
- **Should `Cluster 3` be split into smaller, more focused modules?**
  _Cohesion score 0.14 - nodes in this community are weakly interconnected._
- **Should `Cluster 4` be split into smaller, more focused modules?**
  _Cohesion score 0.09 - nodes in this community are weakly interconnected._