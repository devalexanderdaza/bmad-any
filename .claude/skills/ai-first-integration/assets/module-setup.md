# Module Setup

Standalone module self-registration. This file is loaded when:
- The user passes `setup`, `configure`, or `install` as an argument
- The module is not yet registered in `{project-root}/_bmad/config.yaml`
- The skill's first-run init flow detects this is a fresh installation

## Overview

Registers this standalone module into a project. Module identity comes from `./assets/module.yaml`. Collects user preferences and writes them to:

- `{project-root}/_bmad/config.yaml`
- `{project-root}/_bmad/config.user.yaml`
- `{project-root}/_bmad/module-help.csv`

Both config scripts use anti-zombie behavior: existing entries for this module are removed before writing fresh ones.

`{project-root}` is a literal token in config values. Never replace it inside config files.

## Check Existing Config

1. Read `./assets/module.yaml` for module metadata and variable definitions (`code=afi`).
2. Check if `{project-root}/_bmad/config.yaml` exists and whether section `afi` is present.

If user provides inline values (or headless/default intent), map provided values to config keys and use defaults for the rest.

## Collect Configuration

Ask for values with defaults. Present all values together so the user can respond once with only overrides.

**Default priority**: existing config > module defaults.

### Core Config

Only collect if no core keys already exist:
- `user_name`
- `communication_language` + `document_output_language`
- `output_folder`

### Module Config

Collect all variables in `./assets/module.yaml` that include `prompt`.
Apply `result` templates when storing values.
Fields with `user_setting: true` are written to `config.user.yaml` only.

## Write Files

Write temporary answers JSON as `{"core": {...}, "module": {...}}`.
Then run both scripts:

```bash
python3 ./scripts/merge-config.py --config-path "{project-root}/_bmad/config.yaml" --user-config-path "{project-root}/_bmad/config.user.yaml" --module-yaml ./assets/module.yaml --answers {temp-file} --legacy-dir "{project-root}/_bmad"
python3 ./scripts/merge-help-csv.py --target "{project-root}/_bmad/module-help.csv" --source ./assets/module-help.csv --legacy-dir "{project-root}/_bmad" --module-code afi
```

Stop if either command fails.

## Create Output Directories

Resolve `{project-root}` only for filesystem operations and create directory paths as needed (`mkdir -p`).
Do not replace `{project-root}` token in config values.

## Confirm

Show what was written based on script output.
Then display `module_greeting` from `./assets/module.yaml`.

## Return to Skill

Setup complete. Resume normal skill flow with newly written config.
