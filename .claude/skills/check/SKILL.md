---
description: Run project checks (build, test, lint, format). Use when validating code quality, preparing for merge, or verifying changes pass CI.
allowed-tools:
  - Bash(make:*)
  - Bash(pnpm:*)
  - Bash(uv:*)
  - Bash(cargo:*)
  - Bash(cat:*)
  - Bash(ls:*)
  - Read
  - Glob
  - Grep
---

Run the full success criteria checks for the Geney monorepo.

## Steps

1. Run the full check suite from the repo root:

   ```bash
   make check
   ```

   This runs in order: `fmt-check` → `lint` → `types` → `test` → `build`

2. If formatting fails, auto-fix and report:

   ```bash
   make fmt
   ```

   Then re-run `make fmt-check` to confirm the fix.

3. If linting fails, attempt auto-fix:

   ```bash
   make lint-fix
   ```

4. For per-package issues, run checks in the specific package:

   - TypeScript: `cd packages/<pkg> && pnpm check`
   - Python: `cd packages/py-bio && make check` or `cd apps/sidecar && make check`
   - Rust: `cd apps/desktop/src-tauri && cargo check && cargo clippy && cargo fmt --check`

5. Report a summary of pass/fail status for each check.

6. If any checks fail that cannot be auto-fixed, report what needs manual attention.

This is the gate for all PRs — all checks must pass before merge.
