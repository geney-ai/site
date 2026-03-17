# Project Guide

Static marketing site for Geney. HTML/CSS, no build step. Deployed to GitHub Pages via `deploy-site.yml`.

Desktop app releases live at [geney-ai/geney](https://github.com/geney-ai/geney).

## Quick Reference

```bash
make install       # Install dependencies (pnpm)
make dev-site      # Run site dev server
make check         # Run all checks (fmt, lint, types, test, build)
make fmt           # Format code
make lint          # Lint code
make build         # Build all projects
make clean         # Clean build artifacts
```

## Project Structure

```
apps/
└── site/          # Static HTML/CSS marketing site
```

### Tooling

| Tool | Purpose |
|------|---------|
| Turborepo | Monorepo build orchestration |
| pnpm | Package manager + workspace |
| Biome | Formatting + linting |

## Documentation

- `docs/index.md` — Documentation hub
- `docs/PATTERNS.md` — Coding conventions
- `docs/SUCCESS_CRITERIA.md` — CI checks
- `docs/CONTRIBUTING.md` — Contribution guide

## Constraints

- All `make check` gates must pass before merge
- Biome single quotes, 2-space indent, 80-char line width
- `make` orchestrates everything — `make` → `pnpm` → `turbo`

## Do Not

- Do not commit `.env` files or secrets
- Do not add new dependencies without discussion
- Do not skip checks with `--no-verify`
- Do not push directly to main
