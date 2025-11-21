# Hypercode: A Declarative Paradigm for Context-Aware Agent Synthesis

**Status:** Draft

**Author:** Egor Merkushev

**Date:** July 8, 2025

## 1. Abstract

This document proposes **Hypercode**, a declarative programming paradigm designed to radically separate an agent's logical structure from its contextual configuration. Hypercode introduces a model where the primary source code defines the abstract flow of execution, while external, cascading **Hypercode Cascade Sheets (HCS)** provide the concrete implementations, data, and behaviors. Drawing inspiration from the relationship between HTML and CSS, Hypercode utilizes a powerful selector-based mechanism, including context-aware **Rules** (`@rules`), to dynamically configure an agent's behavior based on its execution environment (e.g., development, production, testing), feature flags, or other external states.

## 2. Motivation

Modern agent-based systems suffer from a high degree of configuration complexity. Business logic is often intertwined with environment-specific checks (`if (env === 'production')`), boilerplate for dependency injection, and scattered configuration values. This increases cognitive load, complicates maintenance, and reduces the readability of the core logic.

Hypercode aims to solve this by:

1. **Maximizing Separation of Concerns:** Isolating the *what* (the logical structure) from the *how* (the concrete implementation and data).
2. **Reducing Boilerplate:** Eliminating conditional environment checks and manual dependency wiring from the agent logic.
3. **Improving Readability:** Presenting the agent's core logic as a clean, hierarchical structure, free from implementation details.
4. **Enabling Dynamic Context-Awareness:** Allowing the agent's behavior to be radically altered by external configuration files without modifying the core logic.

## 3. Core Concepts

The Hypercode paradigm is built on three main components:

* **Hypercode (`.hc` file):** A file describing the agent's logical structure using a simple, indentation-based hierarchy. It contains abstract commands or entities, analogous to an HTML document's structure.

* **Hypercode Cascade Sheet (`.hcs` file):** A YAML-like file that defines how to interpret and configure the commands in the Hypercode file. It uses selectors to target commands and apply configurations, analogous to a CSS stylesheet.

* **Runtime Environment:** An engine that parses both the `.hc` and `.hcs` files, resolves the configurations by applying the HCS rules to the Hypercode structure, and executes the resulting agent.

## 4. Syntax and Semantics

### 4.1. Hypercode Syntax

The syntax is minimal and based on indentation. Each line represents a command or entity. Commands can be augmented with **class** (`.`) and **id** (`#`) markers for targeting by the HCS.

```hypercode
# example.hc

Agent
  DataExtractor#pdf_extractor
    Extract
  Notifier#email_sender
    Send
```

### 4.2. Hypercode Cascade Sheet (HCS) Syntax

The HCS uses a YAML-based syntax with special selectors to apply configuration data. Rules are applied based on specificity, with ID selectors being more specific than class selectors, which are more specific than type selectors.

#### 4.2.1. Selectors

* **Type Selector:** Targets a command by its name.

    ```hcs
    DataExtractor:
      type: "pdf"
      output_format: "text"
    ```

* **Class Selector:** Targets all commands with a given class.

    ```hcs
    .extractor:
      max_retries: 3
    ```

* **ID Selector:** Targets the single command with a unique ID.

    ```hcs
    '#pdf_extractor':
      source: "document.pdf"
    ```

* **Child Selector:** Targets direct children of a command.

    ```hcs
    Notifier > Send:
      to: "moderator@example.com"
    ```

#### 4.2.2. Contextual Rules (`@rules`)

`@rules` allow entire sections of the HCS to be applied conditionally, based on the runtime environment. This is the core mechanism for context-awareness.

```hcs
# default.hcs

# Default configuration (e.g., for development)
DataExtractor:
  type: "pdf"
  source: "/var/tmp/dev_document.pdf"

Notifier > Send:
  to: "dev_moderator@example.com"

# --- Production Overrides ---
@env[production]:
  DataExtractor:
    source: "${PROD_DOCUMENT_PATH}" # Values can be interpolated from env vars

  .extractor:
    max_retries: 5

  Notifier > Send:
    to: "prod_moderator@example.com"
```

#### 4.2.3. Cascade and Specificity

The HCS resolution process follows a strict order of precedence, analogous to CSS:

1. **Origin and Importance:** Rules applied from more specific sources (e.g., a user-provided override file) can take precedence over base rules.
2. **Specificity:** A selector's specificity is calculated based on its components. From highest to lowest: ID (`#id`), Class (`.class`), Type (`Command`). A more specific selector always overrides a less specific one. (e.g., `#pdf_extractor` overrides `.extractor`).
3. **Source Order:** If two selectors have the same specificity, the one that appears later in the document wins.

When multiple rules match a single command, their properties are merged. Properties from higher-specificity rules override those from lower-specificity rules.

## 5. Example: A Simple Agent Workflow

This example demonstrates how a single Hypercode file can be configured for both development and production environments using an HCS file.

```hypercode
# agent.hc (The logic structure is constant)

Agent
  DataExtractor#main_extractor
    Extract
  Notifier#main_notifier
    Send
```

```hcs
# config.hcs (Provides context-dependent behavior)

# --- Default/Development Settings ---
DataExtractor:
  type: "pdf"
  source: "dev_document.pdf"

Notifier > Send:
  to: "dev_moderator@example.com"

# --- Production Environment Overrides ---
@env[production]:
  DataExtractor:
    source: "${PROD_DOCUMENT_PATH}"

  '#main_extractor':
    type: "image"

  Notifier > Send:
    to: "prod_moderator@example.com"
```

**Execution:**

* Runs the agent with the development configuration:

```bash
hypercode-runner agent.hc --hcs config.hcs
```

* Runs the same agent, but it now uses the production configuration. The core logic in `agent.hc` remains untouched:

```bash
hypercode-runner agent.hc --hcs config.hcs --env production
```

## 6. Comparison to Existing Concepts

* **Dependency Injection (DI):** Hypercode can be seen as a form of declarative, externalized DI. Unlike traditional DI containers configured via XML or annotations, HCS provides a more expressive and dynamic configuration mechanism through selectors and @rules.
* **Templating Engines (e.g., Jinja, Handlebars):** While similar, templating engines typically generate static text or configuration files. Hypercode is concerned with generating and configuring a live, executable agent graph.
* **Infrastructure as Code (IaC, e.g., Ansible, Terraform):** Hypercode shares the declarative philosophy of IaC tools but applies it to the agent logic itself, rather than to the underlying infrastructure. It defines the agent's runtime behavior, not just its deployment environment using HCS.

## 7. Open Questions

* **Debugging and Tooling:** How can developers effectively trace why a specific configuration was applied? This would require specialized debugging tools that can visualize the cascade and resolution of HCS rules.
* **Performance:** The overhead of parsing and resolving the HCS at startup needs to be analyzed. A JIT (Just-In-Time) resolution or an AOT (Ahead-Of-Time) compilation step might be necessary for performance-critical applications.
* **Complexity Management:** While HCS simplifies the core logic, very large and complex HCS files could become difficult to manage themselves. Best practices and modularization strategies would be required. This could include extending the at-rule system with directives like `@import`, allowing for better organization of large configurations.
