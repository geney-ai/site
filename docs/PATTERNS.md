# Coding Patterns

Conventions for the Geney marketing site.

## HTML/CSS

- Semantic HTML5 elements (`<nav>`, `<section>`, `<footer>`)
- CSS custom properties for colors and spacing
- Mobile-first responsive design
- No JavaScript required — static HTML/CSS only
- Google Fonts loaded via `<link>` with `preconnect`

## File Organization

```
apps/site/
├── index.html       # Single-page marketing site
├── style.css        # All styles
└── public/          # Static assets (favicons, images)
```

## Naming Conventions

- CSS classes: `kebab-case`
- Section IDs: `kebab-case` (used as anchor targets)
- Image files: `kebab-case`

## Formatting

- Biome: single quotes, 2-space indent, 80-char line width, LF line endings
- HTML: 4-space indent (standard)
