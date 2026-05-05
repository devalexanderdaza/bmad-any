# Graph Report - bmad-any  (2026-05-05)

## Corpus Check
- 4 files · ~4,789 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 55 nodes · 82 edges · 9 communities detected
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

## God Nodes (most connected - your core abstractions)
1. `main()` - 10 edges
2. `main()` - 7 edges
3. `_merge_arrays()` - 5 edges
4. `main()` - 5 edges
5. `merge_config()` - 5 edges
6. `deep_merge()` - 4 edges
7. `_merge_arrays()` - 4 edges
8. `main()` - 4 edges
9. `load_yaml_file()` - 4 edges
10. `load_legacy_values()` - 4 edges

## Surprising Connections (you probably didn't know these)
- `main()` --calls--> `load_yaml_file()`  [EXTRACTED]
  skills/graphify-integration/scripts/merge-config.py → skills/graphify-integration/scripts/merge-config.py  _Bridges community 5 → community 3_
- `main()` --calls--> `apply_legacy_defaults()`  [EXTRACTED]
  skills/graphify-integration/scripts/merge-config.py → skills/graphify-integration/scripts/merge-config.py  _Bridges community 8 → community 3_
- `main()` --calls--> `cleanup_legacy_configs()`  [EXTRACTED]
  skills/graphify-integration/scripts/merge-config.py → skills/graphify-integration/scripts/merge-config.py  _Bridges community 6 → community 3_
- `main()` --calls--> `merge_config()`  [EXTRACTED]
  skills/graphify-integration/scripts/merge-config.py → skills/graphify-integration/scripts/merge-config.py  _Bridges community 4 → community 3_
- `main()` --calls--> `write_config()`  [EXTRACTED]
  skills/graphify-integration/scripts/merge-config.py → skills/graphify-integration/scripts/merge-config.py  _Bridges community 7 → community 3_

## Communities

### Community 0 - "Community 0"
Cohesion: 0.23
Nodes (12): cleanup_legacy_csvs(), extract_module_codes(), filter_rows(), main(), parse_args(), Remove all rows matching the given module code., Write header + rows to CSV file, creating parent dirs as needed., Delete legacy per-module module-help.csv files for this module and core only. (+4 more)

### Community 1 - "Community 1"
Cohesion: 0.27
Nodes (11): deep_merge(), _detect_keyed_merge_field(), extract_key(), find_project_root(), load_toml(), main(), _merge_arrays(), _merge_by_key() (+3 more)

### Community 2 - "Community 2"
Cohesion: 0.46
Nodes (7): deep_merge(), _detect_keyed_merge_field(), extract_key(), load_toml(), main(), _merge_arrays(), _merge_by_key()

### Community 3 - "Community 3"
Cohesion: 0.53
Nodes (5): extract_user_settings(), load_json_file(), main(), parse_args(), Collect settings that belong in config.user.yaml.      Includes user_name and co

### Community 4 - "Community 4"
Cohesion: 0.33
Nodes (6): apply_result_templates(), extract_module_metadata(), merge_config(), Extract non-variable metadata fields from module.yaml., Apply result templates from module.yaml to transform raw answer values.      For, Merge answers into config, applying anti-zombie pattern.      Args:         exis

### Community 5 - "Community 5"
Cohesion: 0.5
Nodes (4): load_legacy_values(), load_yaml_file(), Load a YAML file, returning empty dict if file doesn't exist., Read legacy per-module config files and return core/module value dicts.      Rea

### Community 6 - "Community 6"
Cohesion: 1.0
Nodes (2): cleanup_legacy_configs(), Delete legacy config.yaml files for this module and core only.      Returns list

### Community 7 - "Community 7"
Cohesion: 1.0
Nodes (2): Write config dict to YAML file, creating parent dirs as needed., write_config()

### Community 8 - "Community 8"
Cohesion: 1.0
Nodes (2): apply_legacy_defaults(), Apply legacy values as fallback defaults under the answers.      Legacy values f

## Knowledge Gaps
- **17 isolated node(s):** `Return 'code' or 'id' if every table item carries that *same* field.      All it`, `Shape-aware array merge. Base + override combined tables may opt into     keyed`, `Recursively merge override into base using structural rules.     - Table + table`, `Read CSV file returning (header, data_rows).      Returns empty header and rows`, `Extract unique module codes from data rows.` (+12 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Community 6`** (2 nodes): `cleanup_legacy_configs()`, `Delete legacy config.yaml files for this module and core only.      Returns list`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 7`** (2 nodes): `Write config dict to YAML file, creating parent dirs as needed.`, `write_config()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 8`** (2 nodes): `apply_legacy_defaults()`, `Apply legacy values as fallback defaults under the answers.      Legacy values f`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `main()` connect `Community 3` to `Community 4`, `Community 5`, `Community 6`, `Community 7`, `Community 8`?**
  _High betweenness centrality (0.038) - this node is a cross-community bridge._
- **Why does `merge_config()` connect `Community 4` to `Community 3`?**
  _High betweenness centrality (0.017) - this node is a cross-community bridge._
- **What connects `Return 'code' or 'id' if every table item carries that *same* field.      All it`, `Shape-aware array merge. Base + override combined tables may opt into     keyed`, `Recursively merge override into base using structural rules.     - Table + table` to the rest of the system?**
  _17 weakly-connected nodes found - possible documentation gaps or missing edges._