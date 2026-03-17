# Contributing

Guide for both human contributors and AI agents.

## Getting Started

1. **Prerequisites**: Node.js 20+, pnpm (`corepack enable pnpm`)
2. Clone and install:
   ```bash
   git clone git@github.com:geney-ai/site.git
   cd site
   make install
   ```
3. Run the dev server: `make dev-site`
4. Run checks: `make check`

## Making Changes

1. Create a feature branch from `main`
2. Make your changes following the patterns in `docs/PATTERNS.md`
3. Run checks: `make check`
4. Commit with a clear message describing the change
5. Open a pull request

## Commit Message Format

Use short, descriptive messages. Lowercase, imperative mood.

```
add download section to landing page
fix mobile nav layout
update hero copy
```

## Code Review

- All PRs require review before merge
- CI must pass before merge
- Use `/review` to self-check before requesting review
- Use `/check` to validate locally before pushing
