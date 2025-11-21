# AI-Generated Documentation Hub

This folder contains **AI-generated artifacts** for the Agentification Layer (0AL) project: PRDs, research, pitches, competitor analysis, MVP plans, and more. Organized by numbered categories (e.g., `00_Basics` for foundations, `60_MVP` for implementation phases).

Use this index to browse, reference, or regenerate content. All files are Markdown for easy rendering/linking.

## 📁 Full Directory Tree

```
00_AI_Generated/
├── 00_Basics/                          # Core concepts, PRD, roadmap, research
│   ├── 00_AL_PRD.md
│   ├── 01_AL_First_Concept.md
│   ├── 02_AL_Deep_Research.md
│   ├── 05_AL_Whitepaper.md
│   ├── 09_AL_Roadmap_raw.md
│   ├── 10_AL_Roadmap.md
│   ├── 20_AL_Value.md
│   ├── 30_AL_Hard_Questions.md
│   ├── 40_AL_Risk_and_Problems.md
│   ├── 50_AL_Applications.md
│   ├── 60_0AL_README.md               # Source for root README core content
│   ├── 70_AL_Promt.md
│   └── 71_Zettelcasten_Promt.md
├── 01_APIs/                            # API comparisons and specs
│   └── 00_MCP_vs_A2A.md
├── 10_Pitching/                        # Pitch decks and presentations
│   ├── 00_AL_Pitch_Long.md
│   ├── 10_AL_Pitch.md
│   └── 20_AL_CTO_Presentation.md
├── 20_Integrations/                    # Integration ideas and plans
│   ├── 00_AL_Integrations.md
│   ├── 01_AL_Integration_N1.md
│   ├── 02_AL_Integration_N2.md
│   └── 03_AL_Integration_N3.md
├── 50_Competitors/                     # Competitor analysis and reviews
│   ├── 00_AIOS_Source_Code_Analysys.md
│   ├── 09_Agent_Frameworks_Research.md
│   ├── 10_Agent_Frameworks_Comparison.md
│   ├── 20_Google_Projects.md
│   ├── 30_AL_Review_by_Gemini.md
│   └── 40_A2A_Security.md
├── 60_MVP/                             # MVP planning and phases
│   ├── 00_MVP_Simple_Plan.md
│   ├── 01_MVP_PRD.md
│   ├── 02_MVP_Tasks.md
│   ├── 02_Phase_A/
│   │   ├── 01_Docker.md
│   │   ├── 02_Running.md
│   │   └── 03_Documentation.md
│   └── 03_Phase_B/
│       ├── 01_Yaml_Passports.md
│       ├── 02_MCP_Executor.md
│       ├── 03_Discovery.md
│       ├── 04_Registery.md
│       └── 05_Security.md
└── 90_Hypercode/                       # Hypercode language grammar/tools
    └── EBNF/                           # EBNF playground (ANTLR4-based)
        ├── README.md
        ├── TODO.md
        ├── EBNF_GPT5_TODO.md
        └── CONTRIBUTE.md
```

## 📋 Summary by Category

| Category | Key Files/Folders | Purpose |
|----------|-------------------|---------|
| [**Basics**](./00_Basics/) (`00_Basics`) | [`60_0AL_README.md`](./00_Basics/60_0AL_README.md), [`05_AL_Whitepaper.md`](./00_Basics/05_AL_Whitepaper.md), [`10_AL_Roadmap.md`](./00_Basics/10_AL_Roadmap.md) | Foundational PRD, concepts, roadmap, risks, value props, prompts. |
| [**APIs**](./01_APIs/) (`01_APIs`) | [`00_MCP_vs_A2A.md`](./01_APIs/00_MCP_vs_A2A.md) | Compares MCP vs. A2A protocols for agent comms. |
| [**Pitching**](./10_Pitching/) (`10_Pitching`) | [`10_AL_Pitch.md`](./10_Pitching/10_AL_Pitch.md), [`20_AL_CTO_Presentation.md`](./10_Pitching/20_AL_CTO_Presentation.md) | Long/short pitches and CTO decks. |
| [**Integrations**](./20_Integrations/) (`20_Integrations`) | [`00_AL_Integrations.md`](./20_Integrations/00_AL_Integrations.md), [`0[1-3]_AL_Integration_N*.md`](./20_Integrations/) | High-level + specific integration strategies. |
| [**Competitors**](./50_Competitors/) (`50_Competitors`) | [`10_Agent_Frameworks_Comparison.md`](./50_Competitors/10_Agent_Frameworks_Comparison.md), [`30_AL_Review_by_Gemini.md`](./50_Competitors/30_AL_Review_by_Gemini.md) | Framework analysis, Google projects, security reviews. |
| [**MVP**](./60_MVP/) (`60_MVP`) | [`01_MVP_PRD.md`](./60_MVP/01_MVP_PRD.md), [`02_Phase_A/`](./60_MVP/02_Phase_A/), [`03_Phase_B/`](./60_MVP/03_Phase_B/) | Phased MVP plan: Docker, passports, executor, etc. |
| [**Hypercode**](./90_Hypercode/) (`90_Hypercode/EBNF`) | [`README.md`](./90_Hypercode/EBNF/README.md), [`TODO.md`](./90_Hypercode/EBNF/TODO.md) | Grammar playground for `.hc` agent pipelines (ANTLR4). Aligns with RFC/fixtures. |

## Usage Tips
- **Regenerate/Expand**: Use prompts from `00_Basics/70_AL_Promt.md`.
- **Hypercode Playground**: Follow [`90_Hypercode/EBNF/README.md`](./90_Hypercode/EBNF/README.md) for local grammar testing.