# Geney

A desktop app for designing and planning molecular cloning workflows.

Built with Tauri v2 (Rust + React) and a Python sidecar for bioinformatics compute.

## Quick Start

```bash
# Clone
git clone git@github.com:geney-ai/geney.git
cd geney

# Install dependencies
make install

# Run the desktop app
make dev
```

### Prerequisites

- [Node.js 22+](https://nodejs.org/) with pnpm (`corepack enable pnpm`)
- [uv](https://astral.sh/uv) (Python toolchain)
- [Rust](https://rustup.rs/) (for Tauri)
- System dependencies for Tauri: see [Tauri prerequisites](https://v2.tauri.app/start/prerequisites/)

## Project Structure

```
geney/
├── apps/
│   ├── desktop/              # Tauri v2 + Vite + React (main product)
│   ├── site/                 # Static marketing site
│   ├── sidecar/              # Python bio engine (JSON-RPC over stdin/stdout)
│   └── py-addgene-scraper/   # Addgene catalog scraper
├── packages/
│   ├── py-bio/               # Bioinformatics library (Biopython, pydna)
│   ├── ts-geney/             # Shared TS types + IPC layer
│   └── ts-ui/                # Design system components
├── pyproject.toml             # uv workspace config
├── pnpm-workspace.yaml        # pnpm workspace config
└── turbo.json                 # Turborepo pipeline
```

## Architecture

- **Rust owns storage** — Tauri manages SQLite at `~/Geney/geney.db`, handles all CRUD
- **Content-addressed entities** — sequences (`seq_`), features (`ftr_`), constructs (`con_`), and operations (`op_`) are identified by content hashes computed by py-bio. Rust persists them with INSERT OR IGNORE for automatic deduplication. User-facing library items use UUIDs and reference constructs by content ID.
- **Python sidecar is compute-only** — parse GenBank, digest, ligate, validate, enzyme library. Buffers entities during compute via `ComputeContext`, emits them in the response for Rust to persist.
- **IPC** — Frontend calls Rust via Tauri `invoke()`. Bio compute goes through sidecar JSON-RPC (stdin/stdout)
- **Single-user desktop app** — no auth, no multi-tenancy

## Development

```bash
make dev          # Run desktop app (Tauri dev mode)
make dev-site     # Run marketing site dev server
make check        # Run all checks (fmt, lint, types, test)
make test         # Run tests
make fmt          # Format code
make build        # Build desktop app (sidecar + Tauri)
make clean        # Clean build artifacts
```

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Desktop shell | Tauri v2 (Rust) |
| Frontend | React, Vite, Tailwind CSS |
| Storage | SQLite (via Tauri/Rust) |
| Bio compute | Python (Biopython, pydna) |
| Sidecar IPC | JSON-RPC over stdin/stdout |
| Build | Turborepo, pnpm, uv |

## Credits

Geney is built on the shoulders of these open source projects:

**Desktop & Frontend**
- [Tauri](https://tauri.app/) — desktop app framework (Rust + webview)
- [React](https://react.dev/) — UI framework
- [Vite](https://vitejs.dev/) — frontend build tool
- [Tailwind CSS](https://tailwindcss.com/) — utility-first CSS
- [Radix UI](https://www.radix-ui.com/) — accessible component primitives
- [Lucide](https://lucide.dev/) — icon set
- [React Flow](https://reactflow.dev/) — node-based graph editor
- [Zustand](https://zustand.docs.pmnd.rs/) — state management
- [React Router](https://reactrouter.com/) — client-side routing
- [react-resizable-panels](https://github.com/bvaughn/react-resizable-panels) — resizable panel layouts
- [dnd kit](https://dndkit.com/) — drag and drop

**Bioinformatics**
- [Biopython](https://biopython.org/) — computational biology toolkit
- [pydna](https://github.com/BjornFJohansson/pydna) — DNA assembly simulation
- [NetworkX](https://networkx.org/) — graph algorithms
- [seqparse](https://github.com/Lattice-Automation/seqparse) — sequence file parsing

**Rust**
- [rusqlite](https://github.com/rusqlite/rusqlite) — SQLite bindings for Rust
- [serde](https://serde.rs/) — serialization framework
- [chrono](https://github.com/chronotope/chrono) — date/time library
- [thiserror](https://github.com/dtolnay/thiserror) — error derive macros

**Build & Tooling**
- [Turborepo](https://turbo.build/) — monorepo build orchestration
- [pnpm](https://pnpm.io/) — fast package manager
- [uv](https://github.com/astral-sh/uv) — Python package manager
- [Biome](https://biomejs.dev/) — JS/TS formatter and linter
- [Ruff](https://github.com/astral-sh/ruff) — Python linter
- [Black](https://github.com/psf/black) — Python formatter
# site
