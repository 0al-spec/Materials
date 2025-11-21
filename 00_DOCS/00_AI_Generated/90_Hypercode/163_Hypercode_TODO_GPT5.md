# Hypercode Detailed TODO

## 1. Core Language and Syntax (High Priority)

**Goal:** Evolve the HCS language to handle complex, real-world configurations while preserving declarative clarity.  

**P0: Resolution Engine semantics MUST BE formally defined**.

### 1.1. Implement `@import` Directive

- **Objective:** Modularize HCS files, avoid "YAML Hell", promote reuse.
- **Tasks:**
  - Update BNF grammar to parse `@import "path/to/file.hcs"`.
  - Implement path resolver (relative & absolute, env var expansion).
  - Define import cascade & conflict resolution rules.
- **Definition of Done (DoD):**
  - All test fixtures with multiple imports pass.
  - Circular imports are detected and produce errors.
  - Import precedence rules documented in RFC.
- **Metrics:** Startup resolution time ≤ 100ms for 50 imports.

### 1.2. Declarative Escape Hatches

- Add `@factory`, `@expression` with controlled capabilities.
- **New requirement:** **MUST BE** gated by security policy — no arbitrary code exec unless explicitly allowed.
- **DoD:** Execution paths logged and traceable.
- **Metric:** 100% of escape hatches validated against allowed capabilities list.

### 1.3. Extended Selector Syntax

- Add attribute selectors, combinators (`+`, `>`).
- **DoD:** RFC updated with specificity scoring table.
- **Metric:** All selector resolution deterministic across reference runtimes.

### 1.4. Mixins/Templates

- **New:** **MUST** support parameterization.
- **DoD:** Mixins **CAN BE** tested in isolation.
- **Metric:** 0 duplicated config blocks in official examples.

### 1.5. **Resolution Semantics Specification**

- Formalize:
  - Specificity calculation
  - Merge strategy
  - Conflict resolution
  - Determinism & invariance guarantees
- **DoD:** Mathematical model + 100 golden fixtures.
- **Metric:** Fixtures pass in all compliant runtimes.

## 2. Tooling & Developer Experience

### 2.1. Configuration Inspector

- Add “explain mode” with dependency graph.
- **DoD:** CLI & GUI output match.
- **Metric:** 95% developer satisfaction in usability tests.

### 2.2. IDE Plugins

- Include quick-fixes for common anti-patterns.
- **DoD:** Available in VSCode Marketplace & JetBrains repo.

### 2.3. Application Graph Visualizer

- **MUST** read both `.hc` & `.hcs` and resolve cascade.
- **New:** Export to PNG/SVG.

### 2.4. Linter

- Add security linting (detect unreferenced secrets, wildcard selectors).
- **DoD:** CI rejects PRs failing lint.

### 2.5. **CLI Golden Test Runner**

- Run fixture sets against a runtime to check compliance.
- **Metric:** 100% reproducibility of results.

## 3. Performance & Execution Model

### 3.1. Benchmarking

- Include real-world workloads (50+ selectors, 10 imports).
- **Metric:** Target startup overhead ≤ 10% of baseline imperative code.

### 3.2. AOT Compilation

- **MUST** embed capability checks into compiled code.

### 3.3. **Incremental Resolution**

- Resolve **ONLY** changed parts of configuration in watch mode.
- **Metric:** Hot reload < 200ms for medium config.

## 4. Security & Trust (Cross-cutting)

### 4.1. Secret Management

- Standardize encrypted secrets referencing (`secret://`).
- **DoD:** Compatible with Vault, AWS, Kubernetes.

### 4.2. Signing & Verification

- Require `.hcs` signature check before execution.
- **Metric:** 0 unsigned configs pass in secure mode.

### 4.3. **Capability Enforcement in Resolution**

- Each rule application must respect capability bounds from Agent Passport.
- **DoD:** Unauthorized rules rejected with error.

## 5. Documentation & Community

### 5.1. Guides & Tutorials

- Add “Security Best Practices for HCS”.

### 5.2. Best Practices

- Include naming, structuring, performance tuning.
- **New:** Add migration guides for breaking changes.

## 6. Integration & Interoperability

### 6.1. Adapter for Legacy Code

- **MUST** include security sandbox wrappers.

### 6.2. Compatibility Layer

- Generate Terraform/K8s configs.
- Ensure generated configs are signed & verifiable.

### 6.3. **ABI/IPC Contract**

- Define stable JSON-RPC or WIT schema for communication with runtimes.
- **DoD:** Contract published, versioned, with semver rules.
- **Metric:** No breaking changes without major version bump.

## 7. Infrastructure & Quality Assurance

### 7.1. **CI/CD Pipeline**

- Run golden fixtures, lint, security scans on each commit.
- **Metric:** 100% pass before merge.

### 7.2. **Version Compatibility Testing**

- Test new runtime against all previous golden fixture sets.

### 7.3. **Reference Runtime Certification**

- Badge for runtimes passing 100% compliance tests.