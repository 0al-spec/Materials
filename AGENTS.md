# Repository Guidelines

## Project Structure & Module Organization
- Root: documentation in `00_DOCS/`.
- TypeScript workspace in `ts/` with packages under `ts/*` (e.g., `ts/agent`).
- Source code lives in `ts/<package>/src` and compiles to `ts/<package>/build`.
- Shared tooling config in `ts/` (`Makefile`, `biome.jsonc`, `tsconfig.*.jsonc`).

## Build, Test, and Development Commands
- Install workspace deps: `cd ts && npm i`.
- Install package deps: `cd ts && make install-agent`.
- Build once: `cd ts && make build-agent` (emits `build/`).
- Build watch: `cd ts && make build-watch-agent`.
- Run built output: `cd ts && make run-agent`.
- Run in watch mode: `cd ts && make run-watch-agent`.
- Lint + format + deps graph: `cd ts && make lint-agent`.
- Lint watch: `cd ts && make lint-watch-agent`.
- Tests (Vitest): `cd ts && make test-agent` | `test-watch-agent` | `test-upd-agent`.
- Format all (Biome): `cd ts && make format`.

## Coding Style & Naming Conventions
- Indentation: spaces; line width 60 (Biome).
- Quotes: single quotes for JS/TS.
- TypeScript: `strict` enabled; prefer `import type { T }` when importing types.
- Node core imports: use `node:` protocol (e.g., `import fs from 'node:fs'`).
- Naming: PascalCase for types/classes, camelCase for vars/functions, kebab-case for filenames.

## Testing Guidelines
- Framework: Vitest. Place tests next to code as `*.test.ts`.
- Run fast locally with `make test-watch-agent`; update snapshots via `make test-upd-agent`.
- Aim for meaningful unit tests around `src/` modules; keep I/O stubbed.

## Commit & Pull Request Guidelines
- Commits: imperative mood summary (≤72 chars), optional body; keep scope clear (e.g., `agent:`). Link issues (`#123`) when relevant.
- PRs: include a concise description, linked issues, and how to verify (commands to build/test/run). Add logs or sample output if useful.

## Security & Configuration Tips
- Use `nvm` and the current LTS Node (`cd ts && npm -v` to check). Don’t commit secrets or local configs; `build/`, `node_modules/`, and OS files are already git-ignored.

## Hypercode EBNF Playground
- Location: `00_DOCS/00_AI_Generated/90_Hypercode/EBNF/`.
- Purpose: interactive grammar playground for the Hypercode language (ANTLR4-based), used to experiment with parsing `.hc` and aligning syntax with the RFC and golden fixtures.
- Contents:
  - `README.md`: overview and usage notes for the playground.
  - `TODO.md`: pending grammar/test cleanup tasks.
  - `EBNF_GPT5_TODO.md`: short intent and scope note for the subfolder.
  - `CONTRIBUTE.md`: contribution basics for grammar work.
- How agents benefit:
  - `.hc` describes agent pipelines; the grammar validates structure and enables tooling to generate or interpret agent graphs.
  - Keeps the agent layer consistent with declarative composition and cascading configs (`.hcs`/`.dss`).
- Suggested workflow:
  1) Read `EBNF/README.md` for the local run instructions.
  2) Use RFC examples and `90_Hypercode/170_Golden_Fixtures.md` as acceptance cases.
  3) When grammar changes, update fixtures and re-run playground tests.
  4) Reflect settled grammar in `02_Hypercode_Syntax.md` (BNF) and examples in `00_Hypercode_RFC.md`.
