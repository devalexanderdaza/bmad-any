# Graph Report - bmad-any  (2026-05-07)

## Corpus Check
- 26 files · ~218,561 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 357 nodes · 573 edges · 26 communities detected
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]
- [[_COMMUNITY_Community 7|Community 7]]
- [[_COMMUNITY_Community 8|Community 8]]
- [[_COMMUNITY_Community 9|Community 9]]
- [[_COMMUNITY_Community 10|Community 10]]
- [[_COMMUNITY_Community 11|Community 11]]
- [[_COMMUNITY_Community 12|Community 12]]
- [[_COMMUNITY_Community 13|Community 13]]
- [[_COMMUNITY_Community 14|Community 14]]
- [[_COMMUNITY_Community 15|Community 15]]
- [[_COMMUNITY_Community 16|Community 16]]
- [[_COMMUNITY_Community 17|Community 17]]
- [[_COMMUNITY_Community 18|Community 18]]
- [[_COMMUNITY_Community 19|Community 19]]
- [[_COMMUNITY_Community 20|Community 20]]
- [[_COMMUNITY_Community 21|Community 21]]
- [[_COMMUNITY_Community 22|Community 22]]
- [[_COMMUNITY_Community 23|Community 23]]
- [[_COMMUNITY_Community 24|Community 24]]
- [[_COMMUNITY_Community 25|Community 25]]

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
- None detected - all connections are within the same source files.

## Communities

### Community 0 - "Community 0"
Cohesion: 0.14
Nodes (27): assemble_envelope(), _assemble_warnings(), cmd_emit(), cmd_validate(), _compute_tool_deltas(), _die(), emit_envelope_line(), _freeze() (+19 more)

### Community 1 - "Community 1"
Cohesion: 0.09
Nodes (17): _detect_placeholder_version(), extract(), main(), parse_gradle(), parse_pom_xml(), parse_settings_gradle(), parse_setup_py(), Best-effort regex parse of setup.py — does NOT execute the file. (+9 more)

### Community 2 - "Community 2"
Cohesion: 0.16
Nodes (21): calculate_tier(), detect(), _die(), _first_line(), main(), _ok(), probe_ast_grep(), probe_ccc() (+13 more)

### Community 3 - "Community 3"
Cohesion: 0.17
Nodes (20): _build_workspaces(), detect(), detect_cargo_workspace(), detect_generic_folders(), detect_lerna(), detect_npm_workspaces(), detect_pnpm_workspaces(), detect_python_multi_package() (+12 more)

### Community 4 - "Community 4"
Cohesion: 0.23
Nodes (20): _atomic_write(), cmd_clean_stale(), cmd_init_prefs(), cmd_read(), cmd_register_qmd_collection(), cmd_write_tools(), _die(), main() (+12 more)

### Community 5 - "Community 5"
Cohesion: 0.2
Nodes (18): _acquire_lock(), cmd_commit_dir(), cmd_flip_link(), cmd_stage_dir(), cmd_write(), _create_symlink_or_junction(), _die(), _is_link_or_junction() (+10 more)

### Community 6 - "Community 6"
Cohesion: 0.2
Nodes (16): _component_registry_match(), _die(), _find_registry_files(), _has_component_array_annotation(), main(), _narrow_public_api_match(), _parse_argv(), Return repo-relative paths matching registry.ts / components.ts (any depth). (+8 more)

### Community 7 - "Community 7"
Cohesion: 0.2
Nodes (16): assemble_patterns(), _atomic_write(), cmd_merge(), _die(), main(), merge_patterns(), _ok(), Crash-safe write via temp + fsync + rename. Mirrors skf-atomic-write.py. (+8 more)

### Community 8 - "Community 8"
Cohesion: 0.23
Nodes (15): assemble_brief(), atomic_write(), cmd_write(), _die(), flat_to_nested(), main(), Apply the version-precedence rule. Returns the resolved version string.      Use, Validate the context payload. Raises via _die on hard errors; returns warnings. (+7 more)

### Community 9 - "Community 9"
Cohesion: 0.28
Nodes (15): cmd_deprecate(), cmd_get(), cmd_read(), cmd_remove(), cmd_rename(), cmd_set(), main(), _migrate_v1_to_v2() (+7 more)

### Community 10 - "Community 10"
Cohesion: 0.25
Nodes (15): cmd_check(), cmd_clear(), cmd_insert(), cmd_read(), cmd_replace(), find_managed_section(), main(), Replace managed section content between markers. (+7 more)

### Community 11 - "Community 11"
Cohesion: 0.24
Nodes (14): _basename(), detect(), _die(), _extension(), _frequency_fallback(), _has_basename(), _has_path_segment(), _has_suffix() (+6 more)

### Community 12 - "Community 12"
Cohesion: 0.24
Nodes (12): _http_get_json(), main(), parse_github_url(), Fetch JSON. Returns (payload_or_None, outcome).      Outcome values:       "ok", Try the npm registry. Returns (parsed_or_None, outcome)., Try the PyPI registry. Returns (parsed_or_None, outcome)., Try the crates.io registry. Returns (parsed_or_None, outcome)., Parse a GitHub URL/string into (canonical_url, owner, repo).      Handles the va (+4 more)

### Community 13 - "Community 13"
Cohesion: 0.26
Nodes (11): classify(), _die(), is_forge_owned(), load_registry_names(), main(), _ok(), parse_live_names(), True if `name` ends with one of the forge suffixes. (+3 more)

### Community 14 - "Community 14"
Cohesion: 0.27
Nodes (11): deep_merge(), _detect_keyed_merge_field(), extract_key(), find_project_root(), load_toml(), main(), _merge_arrays(), _merge_by_key() (+3 more)

### Community 15 - "Community 15"
Cohesion: 0.25
Nodes (10): Validate metadata.json fields. Returns list of issues., Validate a complete skill package directory.      When `skip_frontmatter` is Tru, Validate SKILL.md frontmatter. Returns list of issues., Validate SKILL.md body has required sections. Returns list of issues., Validate context-snippet.md format. Returns list of issues., validate_body_structure(), validate_context_snippet(), validate_frontmatter() (+2 more)

### Community 16 - "Community 16"
Cohesion: 0.27
Nodes (9): diff_inventories(), entry_matches(), index_by_name(), load_inventory(), main(), Return True if two entries are identical across all DIFF_FIELDS., Compute the structural diff between two export inventories.      Returns a dict, Load an export inventory from a JSON file.      Accepts either:       - {"export (+1 more)

### Community 17 - "Community 17"
Cohesion: 0.33
Nodes (8): Scan the skills output folder and produce an inventory., Read a JSON file, returning (data, None) or (None, error)., Resolve the active version for a skill group directory.      Returns (version_st, Scan a single skill group directory and return its inventory entry., read_json_file(), resolve_active_version(), scan_inventory(), scan_skill_group()

### Community 18 - "Community 18"
Cohesion: 0.44
Nodes (8): assemble(), cmd_emit(), cmd_validate(), _die(), main(), Build the envelope from a context payload, deriving exit_code., Validate an envelope dict against the schema. Exits non-zero on failure., validate()

### Community 19 - "Community 19"
Cohesion: 0.36
Nodes (7): main(), parse_frontmatter(), Validate skill name format. Aligned with canonical validator.py., Validate SKILL.md frontmatter against agentskills.io spec.      Returns a result, Extract and parse YAML frontmatter from SKILL.md content.      Returns (parsed_d, validate_frontmatter(), _validate_name()

### Community 20 - "Community 20"
Cohesion: 0.32
Nodes (7): _iso_utc_now(), main(), _normalize_exports(), Returns 'YYYY-MM-DDTHH:MM:SSZ' for the current UTC instant., Render the metadata.json envelope. Pass `now_fn` to inject a     deterministic t, Accept either a list of strings or a list of {name, type, ...} dicts.     Return, render_metadata()

### Community 21 - "Community 21"
Cohesion: 0.46
Nodes (7): deep_merge(), _detect_keyed_merge_field(), extract_key(), load_toml(), main(), _merge_arrays(), _merge_by_key()

### Community 22 - "Community 22"
Cohesion: 0.38
Nodes (6): classify_all(), classify_finding(), compute_drift_score(), Classify all findings and compute drift score., Classify a single finding's severity. Returns severity string., Compute overall drift score from classified findings.

### Community 23 - "Community 23"
Cohesion: 0.53
Nodes (5): compute_score(), make_error(), Round to 2 decimal places using JavaScript-compatible rounding.      JavaScript, round2(), validate_input()

### Community 24 - "Community 24"
Cohesion: 0.5
Nodes (4): load_yaml_file(), Load a YAML file, returning (data, None) or (None, error_string)., Run preflight checks and return a result dict., run_preflight()

### Community 25 - "Community 25"
Cohesion: 0.83
Nodes (3): _err(), main(), validate()

## Knowledge Gaps
- **115 isolated node(s):** `Extract and parse YAML frontmatter from SKILL.md content.      Returns (parsed_d`, `Validate skill name format. Aligned with canonical validator.py.`, `Validate SKILL.md frontmatter against agentskills.io spec.      Returns a result`, `True when any path contains the given segment (e.g. 'src/main/kotlin/').`, `Return the lowercased file extension including the leading dot, or empty string.` (+110 more)
  These have ≤1 connection - possible missing edges or undocumented components.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What connects `Extract and parse YAML frontmatter from SKILL.md content.      Returns (parsed_d`, `Validate skill name format. Aligned with canonical validator.py.`, `Validate SKILL.md frontmatter against agentskills.io spec.      Returns a result` to the rest of the system?**
  _115 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Community 0` be split into smaller, more focused modules?**
  _Cohesion score 0.14 - nodes in this community are weakly interconnected._
- **Should `Community 1` be split into smaller, more focused modules?**
  _Cohesion score 0.09 - nodes in this community are weakly interconnected._