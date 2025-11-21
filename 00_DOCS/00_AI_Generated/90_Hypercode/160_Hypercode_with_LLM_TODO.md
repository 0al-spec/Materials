# Hypercode MVP (v0.1) — TODO Checklist

> Legend — **⏳ evening‑weeks** (≈15 h).  
> Tick the box when done ✔️

## 0 · Organizational “Sprint 0”
- [ ] ⏳ 0.5  Create repository + GitHub Actions scaffold  
- [ ] ⏳ 0.2  Connect Copilot / LLM agent & update README  

## 1 · Spec & Grammar
- [ ] ⏳ 1    Finalize EBNF grammar (`.hc`, `.hcs`)  
- [ ] ⏳ 1    Implement ANTLR v4 lexer & parser  
- [ ] ⏳ 0.5  Add golden fixtures (10‑15 sample files)  

## 2 · Parser / AST Layer
- [ ] ⏳ 1    Python wrapper ⇒ `hypercode.ast`  
- [ ] ⏳ 1.5  Pretty error reporter (range highlight)  
- [ ] ⏳ 1    Unit‑tests for each grammar rule  

## 3 · Cascade Resolver (Semantics)
- [ ] ⏳ 3    Selector matcher (type / .class / #id / `>` child)  
- [ ] ⏳ 2    Merge & override rules (specificity, source‑order)  
- [ ] ⏳ 1    Compute final property map  
- [ ] ⏳ 1    `trace()` API → provenance map  
- [ ] ⏳ 1    Fuzz / property tests  

## 4 · Python Runtime (Interpreter mode)
- [ ] ⏳ 2    Instantiate components via `importlib` + DI‑less injection  
- [ ] ⏳ 0.5  Secret‑hook (stub)  
- [ ] ⏳ 0.5  Lifecycle API (`run() / shutdown()`)  
- [ ] ⏳ 0.5  Smoke example (`hello.hc + hello.hcs`)  

## 5 · AOT Compiler → Python
- [ ] ⏳ 0.5  Jinja2 template engine scaffolding  
- [ ] ⏳ 2    Generate imports & init graph  
- [ ] ⏳ 0.5  `black` auto‑format + `mypy` check  
- [ ] ⏳ 1    Self‑test: generated module passes `pytest`  

## 6 · CLI & Packaging
- [ ] ⏳ 1    `hypercode parse|validate|build` via Typer  
- [ ] ⏳ 0.5  Publish wheel to PyPI (pre‑release)  

## 7 · Developer Tooling
- [ ] ⏳ 1.5  VS Code syntax highlight (TextMate grammar)  
- [ ] ⏳ 1    On‑save lint (calls `hypercode validate`)  
- [ ] ⏳ 1.5  Inspector CLI (`trace` tree, Rich TUI)  

## 8 · Tests & Documentation
- [ ] ⏳ 1.5  Coverage ≥ 80 % (`pytest‑cov`, `hypothesis`)  
- [ ] ⏳ 1    MkDocs site (quick‑start, API)  
- [ ] ⏳ 1    Tutorial “from zero to running app”  

## 9 · Hardening & Release Candidate
- [ ] ⏳ 0.5  Performance benchmark (parse, resolve, AOT)  
- [ ] ⏳ 1    Bug‑bash & issue triage  
- [ ] ⏳ 0.2  Public beta — upload PyPI & VSIX  
- [ ] ⏳ 1    Post‑beta critical fixes  

---

### Totals
**≈ 33‑34 evening‑weeks** ⇒ ~9 months at 15 h/week.