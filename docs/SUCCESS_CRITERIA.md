# Success Criteria

Checks that must pass before code can be merged.

## Quick Check

```bash
make check
```

This runs all checks in sequence: format → lint → types → test → build.

## Individual Checks

### Formatting

```bash
# Check (CI)
make fmt-check

# Fix
make fmt
```

**Tool:** Biome — single quotes, 2-space indent, 80-char line width, LF line endings

### Linting

```bash
# Check (CI)
make lint

# Auto-fix
make lint-fix
```

**Tool:** Biome

## CI Pipeline

CI runs on push to `main` and on PRs targeting `main`. Steps:

1. `pnpm fmt:check` — formatting
2. `pnpm lint` — linting
3. `pnpm types` — type checking
4. `pnpm test:unit` — unit tests
5. `pnpm build` — build

All steps must pass. See `.github/workflows/ci.yml`.

## Deployment

Site deploys to GitHub Pages on push to `main` when `apps/site/**` changes. See `.github/workflows/deploy-site.yml`.

## Pre-commit

No pre-commit hooks are configured. Run `make check` manually before pushing.
