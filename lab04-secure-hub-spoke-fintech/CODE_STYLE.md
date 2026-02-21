# Code Style & Clean Code Guidelines

Concise guidelines for maintaining consistent, readable code in this lab.

---

## General Principles

- **DRY** – Don't repeat yourself. Extract shared logic into variables, locals, or modules.
- **Single responsibility** – One file/block per concern. Split when it grows.
- **Explicit over implicit** – Name things clearly; avoid magic values.
- **Comments** – Explain *why*, not *what*. Keep them short.

---

## Terraform

### File organization

| File        | Purpose                                      |
|-------------|----------------------------------------------|
| `main.tf`   | Core resources (RG, VNet, etc.)              |
| `variables.tf` | Input variables and locals                 |
| `outputs.tf`   | Output values                              |
| `providers.tf` | Provider config and versions                |
| `backend.tf`   | Remote state config                        |

### Naming

- **Resources**: `azurerm_<resource>.<descriptive_name>` (e.g. `azurerm_resource_group.rg`)
- **Variables**: `snake_case`, descriptive (e.g. `resource_suffix`, `tags_extra`)
- **Locals**: `snake_case` for derived values (e.g. `tags = merge(...)`)

### Comments

```hcl
# Section header (use for logical blocks)
# ---- Subsection ----
# Inline: brief explanation when non-obvious
```

### tfvars

- One file per environment (`dev.tfvars`, `prod.tfvars`)
- Group related vars; use section headers (`# ========== RG ==========`)

---

## GitHub Actions

### Structure

- Workflow-level `env` for shared values (e.g. `TF_DIR`)
- Job-level `env` for job-specific vars (backend, ARM_*)
- Step names: include environment when relevant

### Comments

- Top: workflow purpose and trigger
- Inline: explain non-obvious vars or logic (e.g. state key derivation)

---

## Shell Scripts

- Shebang + `set -euo pipefail` at top
- Constants in UPPER_SNAKE_CASE
- Section comments for logical blocks
- Inline comments only when logic is non-obvious

---

## Formatting

- **Terraform**: `terraform fmt -recursive`
- **YAML**: 2 spaces; align when it improves readability
- **Shell**: 2 spaces for indent
