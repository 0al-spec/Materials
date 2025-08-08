# 90_Hypercode — Structure

This README summarizes the structure and purpose of the
Hypercode documentation set in this folder.
## Directory Tree

```
90_Hypercode/
├─ 00_Hypercode_RFC.md
├─ 01_Hypercode_RFC_Agents.md
├─ 02_Hypercode_Syntax.md
├─ 03_Hypercode_EBNF_Processing_Plan.md
├─ 10_Hypercode_Cases.md
├─ 20_Hypercode_Deep_Research_Gemini.md
├─ 30_Hypercode_Analysys.md
├─ 40_Hypercode.md
├─ 50_Hypercode_and_0AL.md
├─ 60_Hypercode_Cascade_Sheets.md
├─ 70_Hypercode_for_Agents.md
├─ 80_Hypercode_Cascade_Sheets_vs_Others.md
├─ 90_Dynamic_Agent Synthesis_from_Intent.md
├─ 100_SDD_for_Hypercode.md
├─ 110_Gemini_about_SDD_and_Hypercode.md
├─ 120_Hypercode_TODO.md
├─ 130_Hypercode_and_DI_Frameworks.md
├─ 140_Hypercode_TODO_RU.md
├─ 150_Hypercode_Roadmap.md
├─ 160_Hypercode_with_LLM_TODO.md
├─ 161_Hypercode_Hard_TODO.md
├─ 170_Golden_Fixtures.md
├─ EBNF/
│  ├─ README.md
│  ├─ TODO.md
│  ├─ EBNF_GPT5_TODO.md
│  └─ CONTRIBUTE.md
└─ OOP/
   └─ 00_Hypercode_and_OOP.md
```

## Grouped Index

### RFCs & Specs
- 00: [Hypercode RFC](./00_Hypercode_RFC.md)
- 01: [Hypercode RFC — Agents](./01_Hypercode_RFC_Agents.md)
- 02: [Syntax (BNF) + AST](./02_Hypercode_Syntax.md)
- 03: [EBNF Processing Plan](./03_Hypercode_EBNF_Processing_Plan.md)

### Research & Analysis
- 20: [Deep Research (Gemini)](./20_Hypercode_Deep_Research_Gemini.md)
- 30: [Hypercode Analysis](./30_Hypercode_Analysys.md)
- 110: [Formal Analysis + DI/IaC/EO](./110_Gemini_about_SDD_and_Hypercode.md)
- 130: [Hypercode vs DI Frameworks](./130_Hypercode_and_DI_Frameworks.md)
- 40: [Hypercode and Gemini (synthesis brief)](./40_Hypercode.md)
- 50: [Hypercode and 0AL](./50_Hypercode_and_0AL.md)

### Use Cases & Patterns
- 10: [Application Case: Data Pipeline](./10_Hypercode_Cases.md)
- 60: [Hypercode Cascade Sheets (HCS)](./60_Hypercode_Cascade_Sheets.md)
- 70: [Hypercode for Agents](./70_Hypercode_for_Agents.md)
- 80: [HCS vs DI/YAML/DSL](./80_Hypercode_Cascade_Sheets_vs_Others.md)
- 90: [Dynamic Agent Synthesis from Intent](./90_Dynamic_Agent%20Synthesis_from_Intent.md)

### Roadmap & TODOs
- 120: [TODO — RFC Expansion (EN)](./120_Hypercode_TODO.md)
- 140: [TODO — RFC Expansion (RU)](./140_Hypercode_TODO_RU.md)
- 160: [MVP Tasks (EN)](./160_Hypercode_with_LLM_TODO.md)
- 161: [Prioritized Roadmap (EN)](./161_Hypercode_Hard_TODO.md)
- 150: [Roadmap Mindmap (Mermaid)](./150_Hypercode_Roadmap.md)
- 170: [Golden Fixtures](./170_Golden_Fixtures.md)

### Methodology
- 100: [Specification‑Driven Development](./100_SDD_for_Hypercode.md)

### EBNF Playground
- [EBNF/README.md](./EBNF/README.md): ANTLR playground overview
- [EBNF/TODO.md](./EBNF/TODO.md): grammar/test cleanup notes
- [EBNF/EBNF_GPT5_TODO.md](./EBNF/EBNF_GPT5_TODO.md): folder/doc intent
- [EBNF/CONTRIBUTE.md](./EBNF/CONTRIBUTE.md): contributing basics

### OOP Angle
- [OOP/00_Hypercode_and_OOP.md](./OOP/00_Hypercode_and_OOP.md): EO/OOP angle

## Key Themes
- Declarative composition in `.hc`; cascading config in `.hcs`/`.dss`.
- Context‑aware agent synthesis and orchestration.
- Comparative framing vs DI, IaC, EO/OOP.
- SDD as the guiding development method.

## Known Gaps / Hygiene
- Naming: unify `.hcs` vs `.dss` across docs and examples.
- Duplicated planning: 120/140 and 160/161 overlap — consolidate.
- Filenames:
  - Fix typo: `30_Hypercode_Analysys.md` → `30_Hypercode_Analysis.md`.
  - Avoid spaces: `90_Dynamic_Agent Synthesis_from_Intent.md`.
- Grammar single source of truth: align RFC examples, golden fixtures,
  and EBNF tests.

## Suggested Next Steps
- Add canonical terminology section to the main RFC.
- Merge TODOs into a single roadmap (link from here).
- Extract minimal grammar + golden fixtures; cover with EBNF tests.
