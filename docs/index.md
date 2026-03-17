# Documentation Index

Central hub for project documentation. AI agents should read this first.

## Quick Start

```bash
# Prerequisites: Node.js 20+, pnpm
make install
make dev-site
make check
```

## Documentation

| Document | Purpose |
|----------|---------|
| [PATTERNS.md](./PATTERNS.md) | Coding conventions and patterns |
| [CONTRIBUTING.md](./CONTRIBUTING.md) | How to contribute (agents + humans) |
| [SUCCESS_CRITERIA.md](./SUCCESS_CRITERIA.md) | CI checks that must pass |

## For AI Agents

### Key Context

- This is a **static HTML/CSS site** deployed to GitHub Pages
- No build step — `apps/site/` is uploaded directly
- `make` orchestrates everything: `make` → `pnpm` → `turbo`
- Desktop app releases live at `geney-ai/geney`

### Workflow

1. **Understand** — Read the task description and relevant docs
2. **Explore** — Search the codebase to understand context
3. **Plan** — Break down work into small steps
4. **Implement** — Follow existing patterns in `PATTERNS.md`
5. **Verify** — Run checks from `SUCCESS_CRITERIA.md`
6. **Commit** — Clear, atomic commits

### Guidelines

- Follow existing code patterns and conventions
- Make atomic commits (one logical change per commit)
- Use `make check` to validate before finishing
