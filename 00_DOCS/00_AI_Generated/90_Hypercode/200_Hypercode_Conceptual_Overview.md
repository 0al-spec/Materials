# Hypercode Conceptual Overview ("Constitution Draft")

## 1. Purpose

Hypercode is an executable architecture language.

It is designed to describe how a system behaves at the level of architecture:
- which elements (agents, services, commands, tasks) exist,
- how they are connected,
- which flows, branches, and policies govern their interaction,
- how these flows change across environments, tenants, and feature sets.

Its goal is not to replace general-purpose languages, but to become the canonical place where the actual system behavior is defined at the architectural level.

---

## 2. Two Complementary Artifacts: .hc and .hcs

Hypercode consists of two tightly related artifacts:

1. **Hypercode file (.hc)** – architectural skeleton & base logic
   - Declares structural elements of the system (nodes, agents, commands, pipelines, states).
   - Describes high-level control flow and relationships:
     - who calls whom,
     - which steps form a pipeline,
     - which branches or fallbacks exist,
     - what events or conditions connect elements.
   - This is already logic – but at the level of architecture, not at the level of algorithms.

2. **Hypercode Cascade Sheet (.hcs)** – contextual specialization & policies
   - Contains selector-based rules that apply to elements declared in .hc.
   - Modulates how the architecture behaves in specific contexts:
     - enable/disable certain elements or paths,
     - switch implementations or routes,
     - adjust limits, timeouts, retries, strategies,
     - apply security, logging, or resource policies.
   - Uses cascade semantics: more specific rules override general ones in a deterministic way.
   - Uses context-aware directives (@env, @profile, @feature, etc.) to express how architecture changes across environments and scenarios.

Together, .hc and .hcs describe an executable architectural program.

---

## 3. Division of Responsibilities

Hypercode deliberately separates levels of logic:

**Architectural & orchestration logic – in Hypercode**
- Which components participate in a scenario.
- In which order they run.
- Which branches exist and when they're taken.
- Which policies and strategies are applied in which context.
- How agents/systems are wired logically across boundaries.

**Algorithmic & low-level logic – in host languages**
- How exactly a video is encoded.
- How a database query is built.
- How a request is validated against a schema.
- How cryptographic primitives are implemented.

Hypercode is the source of truth for "what happens in the system" at the architectural level.
Host languages are the source of truth for "how each atomic step works internally".

---

## 4. Execution Model

Hypercode is not "just configuration":

- There is a Hypercode runtime (or several runtimes in different ecosystems) that:
  - loads .hc and .hcs,
  - builds an architectural execution graph,
  - applies cascade and context resolution,
  - drives the actual execution of workflows, routes, and agent interactions.

Important nuances:
- Hypercode does not directly construct objects or manage memory; it tells the runtime:
  - which roles and elements must exist,
  - how they are connected,
  - under which conditions they're active.
- The runtime maps Hypercode elements to concrete objects, services, processes, or containers in a given platform:
  - Swift objects, Java services, microservices, actors, etc.

So, Hypercode is executed through a runtime, but the program being executed (at architectural level) is .hc + .hcs.

---

## 5. Cascade and Context as First-Class Semantics

A key differentiator of Hypercode is that cascade and context are built into the language model, not bolted on via tooling conventions.

- **Selectors** (by type, ID, tags, hierarchy, roles, etc.) express where a rule applies.
- **Cascade** expresses how multiple rules combine, with deterministic resolution (specificity, precedence, ordering).
- **Context directives** (@env, @profile, @tenant, @feature, etc.) express when a rule applies.

This allows:
- expressing multi-environment, multi-tenant, feature-flagged architecture declaratively,
- moving scattered `if (env == "prod")` and `if featureFlagX` from code into a central, inspectable architectural program,
- reasoning about behavior changes across contexts at the level of a single model.

---

## 6. Relationship to Other Tools and Languages

Hypercode is intentionally orthogonal to many existing tools:

- **It is not a DI container**: DI focuses on object graphs and injection; Hypercode focuses on behavioral flows and architectural policies.
- **It is not a plain config format**: configs store parameters; Hypercode defines the executable architecture of the system and how it varies.
- **It is not just another DSL**:
  - It is a system-level DSL for executable architecture,
  - language-agnostic by design, meant to sit above general-purpose languages,
  - with cascade and context as first-class constructs.

Hypercode is the place where system behavior as a whole is written, read, reviewed, versioned, and reasoned about.
