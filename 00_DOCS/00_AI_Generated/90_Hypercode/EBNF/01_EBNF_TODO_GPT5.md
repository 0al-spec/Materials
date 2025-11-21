# Hypercode EBNF – Implementation To-Do

## ✅ How I’ll generate this to-do
- Read current RFC 0.1 + EBNF playground (Lexer/Parser, Main.java, Makefile, tests) and infer gaps vs. intended syntax/semantics.
- Break work by components (Lexer, Parser/Grammar, AST, Error Handling, CLI, Build, Tests, Docs, Tooling) and add granular, verifiable tasks.
- Encode conventions (indent policy, IDs/classes order, comments) as grammar + tests first.
- Add observability (error messages, traces, JSON AST) to make later features testable.
- Wire CI + golden fixtures to lock behavior; add fuzz/property tests to guard regressions.

---

## 0. Project housekeeping
- [ ] **Repo structure**
  - [ ] Move playground into `/grammar/` and `/runtime/java/` (or `/src/`) with `README.md`.
  - [ ] Add `/examples/` with curated `.hc` and `/fixtures/ast/` for golden JSON trees.
  - [ ] Add `/scripts/` (formatter, corpus generator, fuzz seeds).
- [ ] **Coding standards**
  - [ ] `CONTRIBUTE.md`: formatting, commit style, PR checklist, test policy.
  - [ ] `.editorconfig` with LF, UTF-8, `indent_size = 2` (or 4) for Java/ANTLR, tabs policy.

---

## 1. Lexer (`HypercodeLexer.g4`)
**Goal:** robust indentation, whitespace/comment handling, precise token positions.

- [ ] **Indentation engine**
  - [ ] Replace ad-hoc token creation with **CommonTokenFactory**; avoid raw `Pair<>` usage.
  - [ ] Track `line`, `charPositionInLine`, `startIndex/stopIndex` on synthetic `INDENT`/`DEDENT`/`NL` tokens.
  - [ ] Emit **all pending DEDENTs at EOF** with correct source positions.
  - [ ] Add guard against **negative indent** and **inconsistent dedent** (raise lexing error).
- [ ] **Whitespace policy**
  - [ ] Single rule for leading indentation (e.g., `LEADING_WS`) recognized **only at BOL** (beginning of line).
  - [ ] Separate rule for inline spaces `WS -> skip` **not** active at BOL (use semantic predicate).
  - [ ] **Tabs vs spaces**: make policy configurable
        - [ ] Mode A: forbid mixing (default) → error with hint.
        - [ ] Mode B: allow tabs=8 spaces; normalize and warn (lexer channel: `HIDDEN`).
- [ ] **Newline normalization**
  - [ ] Accept `\n`, `\r\n`, `\r` → normalize to single `NEWLINE` token.
  - [ ] Collapse trailing spaces before newline; optionally warn.
- [ ] **Comments**
  - [ ] Line comments `// ...` or `; ...` (choose one not clashing with `#` id).
  - [ ] Block comments `/* ... */` (optional) with proper nesting disabled.
  - [ ] Comments go to `HIDDEN` channel; **preserve NEWLINE** when comments end with EOL.
- [ ] **Literals & identifiers**
  - [ ] IDENT: ASCII + Unicode letters, digits, `_`, `-` (decide on `-` rules; allow in ids/classes only).
  - [ ] Tokens for **`.` class**, **`#` id**, and **`>` child combinator** (parser may use).
  - [ ] Reserve future tokens (e.g., `@include`, `@env`) and mark as keywords.

**Acceptance**
- [ ] Unit tests: indent/dedent, EOF dedent, mixed tabs/spaces error, comment forms, Windows newlines, long lines.

---

## 2. Parser (`HypercodeParser.g4`)
**Goal:** express RFC 0.1 structure with flexible selectors and blocks.

- [ ] **Top-level structure**
  - [ ] `file : (block | blankline)* EOF`
  - [ ] `block : node NEWLINE INDENT (block | blankline)* DEDENT | node NEWLINE`
  - [ ] `blankline : NEWLINE` (possibly with comments only).
- [ ] **Node syntax**
  - [ ] `node : type selector*`
  - [ ] `type : IDENT`
  - [ ] `selector : classSel | idSel`
  - [ ] `classSel : DOT IDENT (DOT IDENT)*` (allow hierarchical classes: `.a.b`)
  - [ ] `idSel : HASH IDENT` (exactly one per node) **with rule**: at most 1 `#id` → semantic check.
  - [ ] Optional **combinators** (prep for HCS matching later) kept out of HC core; keep grammar minimal now.
- [ ] **Error productions & messages**
  - [ ] Friendly errors for: duplicate `#id`, class after newline, illegal char in id/class, unexpected dedent.
  - [ ] Disallow trailing selectors without type; give hint “did you mean `<type> .class`?”
- [ ] **Optional features toggles (behind flags)**
  - [ ] Allow hyphens in ids/classes (e.g., `file-logger`) and reject trailing `-`.
  - [ ] Allow `_` prefix ids (decide policy; document).

**Acceptance**
- [ ] Positive tests for permutations: `Type`, `Type.class`, `Type#id`, `Type.class1.class2#id`.
- [ ] Negative tests for `#a#b`, `.class` without type, stray selectors, bad indent tree.

---

## 3. AST & Semantic Model (Java runtime)
**Goal:** produce a stable, serializable AST + minimal validation layer.

- [ ] Define `HCNode { String type; String id?; List<String> classes; List<HCNode> children; SourceSpan span; }`
- [ ] Implement `ParseTreeVisitor` → `HCNode` builder.
- [ ] Enforce **one `#id`** and **unique classes** at node creation (dedupe).
- [ ] Compute `span` (start/end line/col) for precise diagnostics.
- [ ] **Serialization**
  - [ ] `--ast json` → pretty JSON output (stable key order).
  - [ ] `--ast tree` → ASCII tree for CLIs and golden fixtures.
- [ ] **Validation**
  - [ ] Check reserved keywords used as type/id/class → warning or error (configurable).
  - [ ] Emit **semantic warnings** on mixed case policy, very long identifiers (>128), etc.

**Acceptance**
- [ ] Golden fixtures: parse `/examples/*.hc` → `/fixtures/ast/*.json` and compare byte-for-byte.

---

## 4. Error handling & UX
- [ ] Custom `ANTLRErrorListener` for lexer/parser:
  - [ ] Colored, one-line diagnostics: `path:line:col: error: message` + snippet + caret.
  - [ ] Specific messages for indent stack issues and mixed tabs/spaces.
- [ ] Exit codes: 0 OK, 1 parsing/lexing error, 2 semantic error, 3 internal error.
- [ ] `--quiet`, `--no-color`, `--json-errors` (for editor integrations).

---

## 5. CLI / Main.java
- [ ] Replace ad-hoc main with a tiny CLI:
  - [ ] `hypercodec parse <file.hc> [--ast json|tree] [--strict-tabs] [--max-id=1]`
  - [ ] Read from STDIN when file not provided; write AST to STDOUT.
  - [ ] Measure parse time with `--bench` (prints tokens/sec, lines/sec).
- [ ] Add `--trace-tokens` (debug) to print token stream with positions.

---

## 6. Build system (Makefile)
- [ ] Targets
  - [ ] `make gen` – generate ANTLR artifacts to `/build/gen`.
  - [ ] `make build` – compile Java classes to `/build/classes`.
  - [ ] `make run FILE=examples/01-basic.hc` – run parser.
  - [ ] `make test` – unit tests + golden tests.
  - [ ] `make lint` – grammar lints (antlr-tool), Java lint.
  - [ ] `make clean` – remove `/build`.
- [ ] Variables: `ANTLR_VER`, `JAVA_HOME`, `CLASSPATH` assembled automatically; fail fast if missing.
- [ ] Reproducibility: pin ANTLR jar; checksum verify on download.

---

## 7. Tests
**Goal:** executable spec for grammar behavior with fast feedback.

- [ ] **Unit tests (lexer/parser)**
  - [ ] Positive: basic/nesting/empty-lines/indent-dedent/sibling-blocks.
  - [ ] Negative: invalid-id, class-before-type, duplicate id, mixed tabs/spaces.
  - [ ] Windows CRLF corpus; very long line; Unicode identifiers.
- [ ] **Golden tests**
  - [ ] For each example `.hc`, store `*.json` AST and `*.tree`.
  - [ ] `make test-golden` diffs current vs golden; `make regen-golden` to update intentionally.
- [ ] **Property & fuzz**
  - [ ] QuickCheck-style: generate random trees → pretty-print to `.hc` → parse → AST == original (shape).
  - [ ] Grammar fuzzer (e.g., Grammarinator) on restricted alphabet; crashers saved under `/fuzz/crashers`.
- [ ] **Performance tests**
  - [ ] Parse 1k/10k-node synthetic file; assert throughput threshold.

---

## 8. Tooling & Integrations
- [ ] **Formatter (optional v0)**
  - [ ] `hypercodefmt` → reindent, normalize newlines; idempotent.
- [ ] **LSP scaffold**
  - [ ] Provide `--json-errors` + `--ast json` to make VSCode/JetBrains extension trivial later.
- [ ] **Pre-commit hooks**
  - [ ] Run formatter + `make test` on staged `.hc`/grammar changes.

---

## 9. Documentation
- [ ] **EBNF README**
  - [ ] How to build/run; grammar overview; examples.
  - [ ] Indent policy; comments; allowed characters; error messages guide.
- [ ] **RFC alignment note**
  - [ ] Document decisions: multiple classes, one id, hyphens policy, reserved words.
- [ ] **CONTRIBUTE updates**
  - [ ] How to add a new syntax feature: steps + where to add tests + docs.

---

## 10. Release & CI
- [ ] GitHub Actions:
  - [ ] Matrix: {macOS, Linux} × {Java 17, 21}.
  - [ ] Cache ANTLR; run `make gen build test`.
  - [ ] Upload artifacts (jar + CLI script).
- [ ] Versioning:
  - [ ] Tag `v0.1.0-grammar1`; changelog following Keep a Changelog.
- [ ] Nightly fuzz job; fail on new crashers.

---

## 11. Future (behind flags, not blocking)
- [ ] Optional inline attributes (syntax spike) behind `--experimental-attrs`.
- [ ] Include directives (`@include`) and environment rules (reserved; grammar stubs only).
- [ ] Cross-file uniqueness check for `#id` (semantic phase with index).

---

## Milestones
- **M1 – Grammar hardening (Lexer/Parser + tests)**: Sections 1–2 + 6 + 7 (unit + golden) + 4 (errors).
- **M2 – AST & CLI**: Section 3 + 5; publish fixtures and examples.
- **M3 – CI & Docs**: Sections 9–10; public release `v0.1.0-grammar1`.
- **M4 – Tooling**: Section 8 (formatter) + property/fuzz maturity.

---

## Quick Validation of Actionability
- **Lexer:** Concrete tasks for token factory, BOL predicates, tabs policy, comments, newline normalization, with tests → ✅ sufficiently actionable.
- **Parser:** Explicit productions, selector rules, error productions, acceptance tests → ✅ actionable.
- **AST:** Data model, visitor, serialization, semantic checks, golden fixtures → ✅ actionable.
- **Error handling:** Custom listener + exit codes + flags → ✅ actionable.
- **CLI/Main & Makefile:** Specific commands/targets and variables → ✅ actionable.
- **Tests:** Unit/golden/property/fuzz/perf with locations and goals → ✅ actionable.
- **Docs/CI/Release/Tooling:** Clear outputs (README, Actions workflow, jar artifacts, formatter) → ✅ actionable.

_No area appears underspecified; each section has concrete deliverables, flags, and acceptance tests. If any policy choice (tabs vs spaces, hyphen rules) changes, update Lexer rules, Parser validations, and docs in lockstep._