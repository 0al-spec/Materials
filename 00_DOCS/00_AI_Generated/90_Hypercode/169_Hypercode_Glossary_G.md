# Zettelkasten for Hypercode Terms

This document is a collection of interconnected definition cards for key concepts in the Hypercode project. Each card is an atomic note that can be used in Obsidian or another system that supports wiki-links.

-——

# Zettelkasten for Hypercode RFC Terms

This document contains a set of definition cards for the foundational concepts, terms, and features introduced in the original Hypercode RFC (00_Hypercode_RFC.pdf). It is designed to be used as a reference or knowledge base.

### Hypercode (Paradigm)

Hypercode is a declarative programming paradigm designed to radically separate a program's logical structure from its contextual configuration. It is not a specific language or framework, but a model of development. The core idea is that the abstract flow of a program is defined in one type of file ([[Hypercode (.hc)]]), while the concrete implementations and environment-specific details are provided by another ([[Hypercode Cascade Sheet (HCS)]]).

### Context-Aware Programming

Context-Aware Programming is the ability of a program to dynamically alter its behavior and configuration based on its execution environment without changes to the core application logic. In Hypercode, this is achieved through [[@rules]] in [[Hypercode Cascade Sheet (HCS)]] files, which activate different configurations based on the [[Execution Context]] (e.g., production, development, testing).

### Hypercode (.hc)

Hypercode (.hc file) is a declarative file that describes the logical structure of a program in a minimal, indentation-based hierarchical format. It contains abstract commands or entities, augmented with optional class (.) and ID (#) markers for targeting. It is analogous to an HTML document's structure, defining what the components of the system are, but not how they are implemented.

### Hypercode Cascade Sheet (HCS)

Hypercode Cascade Sheet (.hcs file) is a YAML-compatible file that configures the entities defined in a [[Hypercode (.hc)]] file. It uses [[Selector|Selectors]] to target specific commands and apply configuration data. It is analogous to a CSS stylesheet, providing the concrete implementations, data, and behaviors for the abstract structure. It defines how the components work.

### Selector

A Selector is the mechanism used in a [[Hypercode Cascade Sheet (HCS)]] to target elements within a [[Hypercode (.hc)]] file. The RFC defines several types of selectors, which are applied based on a [[Specificity]] algorithm to resolve which configuration takes precedence.

- [[Type Selector]]
- [[Class Selector]]
- [[ID Selector]]
- [[Child Selector]]

### Type Selector

A Type Selector is the most basic form of [[Selector]] in HCS. It targets a command or entity based on its name (its type). For example, a selector Database: targets all Database commands in the corresponding .hc file. It has the lowest [[Specificity]].

### Class Selector

A Class Selector targets all commands in a .hc file that have been marked with a specific class, prefixed with a dot (.). For example, the selector .pooled: will apply its rules to any command marked with .pooled, such as Database.pooled. It is more specific than a [[Type Selector]].

### ID Selector

An ID Selector targets a single, unique command in a .hc file that has been marked with a specific ID, prefixed with a hash (#). For example, '#primary-db': targets the unique command Database#primary-db. It has the highest [[Specificity]] of the basic selectors.

### Child Selector

A Child Selector targets commands that are direct children of another command in the .hc hierarchy. It is represented by the > combinator. For example, WebServer > Listen: targets a Listen command only if it is a direct child of a WebServer command.

### @rules

@rules are the core mechanism for [[Context-Aware Programming]] in Hypercode. It is a special syntax in a [[Hypercode Cascade Sheet (HCS)]] file that allows entire sections of configuration to be applied conditionally, based on the [[Execution Context]]. For example, @env[production]: activates the enclosed rules only when the execution environment is set to production.

### Execution Context

The Execution Context is the set of external states that determines which [[@rules]] in an HCS file are active at runtime. The most common context is the environment (env=production), but it could also include feature flags, user roles, or other dynamic conditions. The runtime uses the context to resolve the final configuration graph.

### Resolution Algorithm

The Resolution Algorithm is the process performed by the [[reference runtime]] to determine the final configuration of every component. It involves parsing the .hc and .hcs files, resolving the applicable [[@rules]] based on the [[Execution Context]], and then merging properties based on [[Cascade and Specificity]].

### Cascade and Specificity

Cascade and Specificity is the set of principles that govern the [[Resolution Algorithm]]. It defines a strict order of precedence for applying rules, analogous to CSS:
1. Origin and Importance: Rules from more specific sources (e.g., a user override file) can take precedence.
2. Specificity: A selector's importance is calculated based on its components. A more specific selector (e.g., [[ID Selector]]) always overrides a less specific one (e.g., [[Type Selector]]).
3. Source Order: If two selectors have the same specificity, the one that appears later in the document wins.

### Specificity

Specificity is the weight or importance that the [[Resolution Algorithm]] gives to a [[Selector]]. It is calculated based on the components of the selector (number of IDs, classes, and types). This calculation is fundamental to ensuring a predictable and deterministic outcome when multiple rules target the same component.

### Separation of Concerns

Separation of Concerns is a core design principle that Hypercode aims to maximize. It refers to the practice of separating a program into distinct sections, where each section addresses a separate concern. Hypercode enforces a radical separation between the logical structure (the "what," defined in .hc) and the contextual configuration (the "how," defined in .hcs).

### Executable Program Graph

An Executable Program Graph is the final, in-memory representation of the application after the [[Resolution Algorithm]] has been executed. It is not just a static configuration map, but a live graph of instantiated objects, configured and wired together, ready for execution. This distinguishes Hypercode from simple templating engines.

### Environment-Agnostic

Environment-Agnostic is a property of the Hypercode paradigm, meaning it is not tied to any specific programming language, runtime, or deployment system. A [[reference runtime]] can be implemented in any language (Python, Rust, Java, etc.), making Hypercode a potential polyglot orchestration layer.

### Declarative, Externalized DI

Declarative, Externalized Dependency Injection (DI) is a way of describing Hypercode's relationship to traditional DI. Unlike frameworks where DI is configured inside the application code (via annotations or code-based modules), Hypercode externalizes this configuration into .hcs files and uses a declarative syntax with selectors and rules, making it more dynamic and context-aware.

-——

## Terms from TODO

## Section 1: Core Language and Syntax

### Complexity Management

**Complexity Management** is one of the central problems that Hypercode solves. In the context of the project, this refers to preventing chaos in configuration files as a system grows. Instead of complexity being "smeared" across imperative code, it is externalized into declarative .hcs files. To combat this complexity, mechanisms like [[@import Directive]] and [[Mixins/Templates]] are introduced, which allow for structuring and reusing configuration, thus avoiding [[YAML Hell]].

### Declarative Cliff

**The “Declarative Cliff”** is a conceptual limit faced by declarative languages like HCS. It occurs when the required configuration logic becomes too complex or dynamic to be expressed within the syntax of the [[DSL]]. In such cases, developers are forced to either create overly complicated configurations or resort to workarounds. Hypercode addresses this problem with controlled [[Declarative Escape Hatches]].

### DSL (Domain-Specific Language)

**A DSL (Domain-Specific Language)** is a programming language created to solve problems in one specific domain, as opposed to general-purpose languages (GPLs) like Python or Java. In Hypercode, the .hcs language is a DSL specifically designed for the declarative description of application configuration and assembly. Its syntax is limited but highly expressive for this narrow task.

### @import Directive

**The @import Directive** is a language construct in .hcs that allows the contents of one configuration file to be included in another. It is a key tool for [[Complexity Management]], as it enables the breakdown of monolithic configurations into small, logically grouped, and reusable modules (e.g., database.hcs, logging.hcs).

### YAML Hell

**”YAML Hell”** is a colloquial term describing a situation where configuration files in YAML format (or similar, like .hcs) become so large, nested, and complex that they are impossible to read, maintain, and debug. Hypercode combats this phenomenon with modularization mechanisms like [[@import Directive]] and [[Mixins/Templates]].

### BNF (Backus–Naur form)

**Backus–Naur Form (BNF)** is a formal system for describing the syntax of languages. In the context of Hypercode, BNF is used to create a precise and unambiguous grammar for the .hc and .hcs languages. A formal grammar is a prerequisite for developing parsers, linters, and other tools.

### HCS parser

**The HCS parser** is a component of the [[reference runtime]] responsible for reading a textual .hcs file and converting it into an internal data structure (like a parse tree), which can then be used by the rule resolution engine. It implements the grammar described using [[BNF]].

### Reference Runtime

**The Reference Runtime** is the main, official implementation of the Hypercode execution environment. It serves as the standard against which all other (potentially third-party) implementations should be compared. The reference runtime is responsible for parsing .hc and .hcs files, applying the [[import cascade]], resolving rules, and ultimately, assembling and running the application.

### Relative and Absolute Paths

**Relative and Absolute Paths** are two ways of specifying file locations when using the [[@import Directive]]. Absolute paths specify the full path from the file system's root, while relative paths specify the path from the location of the current .hcs file. Supporting both path types is important for project organization flexibility.

### Environment Variable Expansion

**Environment Variable Expansion** is the runtime's ability to substitute values from the operating system's environment variables into .hcs files. This allows for more flexible and secure configurations by not hardcoding sensitive data or environment-specific parameters. For example, host: "${DB_HOST}".

### Import Cascade

**The Import Cascade** is the mechanism that determines the order and precedence of rules applied from different .hcs files linked via the [[@import Directive]]. The cascade rules define how styles are merged and overridden if they are specified in multiple files. In Hypercode, rules from the importing (main) file have higher precedence than those from imported files.

### Conflict Resolution Rules

**Conflict Resolution Rules** are a part of the [[Resolution Semantics]] that precisely define which value will be applied to a component's property if it is targeted by multiple rules of the same specificity. In Hypercode, as in CSS, the rule that appears later in the source code wins.

### Declarative Escape Hatches

**”Declarative Escape Hatches”** are special, strictly controlled constructs in HCS that allow "escaping" the purely declarative syntax to solve complex problems. They are the answer to the [[Declarative Cliff]] problem. The main "hatches" in Hypercode are [[@factory]] and [[@expression]].

### @factory

**The `@factory` directive** is one of the [[Declarative Escape Hatches]] that allows delegating the creation of a component not to the runtime, but to a special function or factory class written in a general-purpose language (e.g., Python). This is necessary when the object creation logic is too complex for a [[DSL]] and requires imperative code.

### @expression

**The `@expression` directive** is one of the [[Declarative Escape Hatches]] that allows computing property values using simple, safe expressions. These expressions are executed in a sandboxed environment ([[safe, sandboxed expression evaluator]]) and have read-only access to the context, making the configuration more dynamic without compromising security.

### Runtime Contract (Interface)

**The Runtime Contract (Interface)** is a formal description of how external code (e.g., a factory for [[@factory]]) must interact with the Hypercode runtime. This contract defines what methods and data the runtime provides to the factory (e.g., access to other dependencies) and what the factory must return as a result.

### Safe, sandboxed expression evaluator

**A safe, sandboxed expression evaluator** is a runtime component that executes the code written in [[@expression]] directives. "Sandboxed" means that this code has no access to the file system, network, or other potentially dangerous resources. It can only work with the data explicitly provided to it.

### Read-only Access

**Read-only Access** is a security principle applied to [[@expression]]. It means that expressions can only read values from the context (e.g., environment variables) but cannot modify them. This prevents side effects and preserves the declarative nature of the configuration.

### Security Policy Gating

**Security Policy Gating** is a requirement that the use of potentially powerful features like [[Declarative Escape Hatches]] must be explicitly enabled in the runtime configuration. By default, they are disabled to prevent accidental or malicious execution of unsafe code.

### Attribute Selectors

**Attribute Selectors** are a way of targeting components in .hcs based on the presence or value of their properties (attributes), which may have been set by lower-precedence rules. For example, WebServer[secure=true] will only select web servers where the secure property is already set to true.

### Combinators

**Combinators** are special characters in .hcs selectors that describe the relationship between components, allowing for more precise rules. Examples in Hypercode include + (adjacent sibling selector) and > (child selector).

### Selector Specificity Calculation Algorithm

**The Selector Specificity Calculation Algorithm** is a formal set of rules that determines which selector is "more important" or "more precise." The runtime uses this algorithm to decide which of the conflicting rules to apply. For example, an ID selector (#my-id) is typically more specific than a class selector (.my-class).

### Formal Specificity Scoring Table

**A Formal Specificity Scoring Table** is an official document or part of the specification that details how many "points" each type of selector (ID, class, attribute, type) contributes when using the [[selector specificity calculation algorithm]]. The existence of such a table eliminates ambiguity and is mandatory for the compatibility of different runtimes.

### Mixins/Templates

**Mixins/Templates** are a mechanism in HCS that allows defining reusable blocks of configuration and "mixing" them into different rules. This is the primary tool for following the [[DRY (Don't Repeat Yourself)]] principle in .hcs files.

### DRY (Don't Repeat Yourself)

**DRY (Don't Repeat Yourself)** is a fundamental principle of software development aimed at reducing code duplication. In the context of Hypercode, applying this principle to .hcs files using [[Mixins/Templates]] helps to avoid errors and simplifies configuration maintenance.

### Sass/SCSS

**Sass/SCSS** is a preprocessor for CSS that extends its syntax by adding features like variables, nesting, and mixins. It is mentioned in Hypercode as a source of inspiration for the implementation of [[Mixins/Templates]], as it solves a similar problem of duplication in declarative styling languages.

### Pre-processing step
A pre-processing step is a stage in the runtime's operation that is executed before the main rule resolution process. At this stage, the runtime processes constructs like [[Mixins/Templates]], effectively substituting their content into the appropriate places before the [[main cascade resolution]] begins.

### Main Cascade Resolution

**The Main Cascade Resolution** is the key process in the Hypercode runtime during which it collects all rules from all .hcs files, sorts them according to specificity and order, and then sequentially applies them to the components from the .hc file to determine their final properties.

### Resolution Semantics

**Resolution Semantics** is the formal, mathematically precise description of the entire [[main cascade resolution]] process. It includes the [[selector specificity calculation algorithm]], the [[property merge strategy]], and the [[conflict resolution rules]], and also provides [[determinism]] and [[invariance guarantees]]. It is the most important part of the specification for ensuring runtime compatibility.

### Property Merge Strategy

**The Property Merge Strategy** is the set of rules that defines how a component's properties are combined when it is targeted by multiple non-conflicting rules. For example, if one rule sets port and another sets host, the component will end up with both properties.

### Determinism

**Determinism** is a guarantee provided by the [[Resolution Semantics]] which states that for the same input data (.hc and .hcs files), the result of the resolution will always be absolutely identical, regardless of the runtime implementation or environment.

### Invariance Guarantees

**Invariance Guarantees** are a set of statements in the [[Resolution Semantics]] that describe which properties of the system remain unchanged during the resolution process. For example, an invariant might be that the order of components in an .hc file does not affect rule application, unless order-based combinators are used in the selectors.

### Mathematical Model

**A Mathematical Model** is a way of formalizing the [[Resolution Semantics]] using mathematical apparatus (e.g., set theory or graph theory). Creating such a model is the ultimate goal for achieving complete unambiguity in the specification.

### Formal Specification

**A Formal Specification** is a document that describes a language and its behavior with maximum precision and without ambiguity, using tools like [[BNF]] and a [[mathematical model]]. It serves as the primary source of truth for all developers of runtimes and tools.

### "Golden Fixtures"

**”Golden Fixtures”** are a reference set consisting of .hc files, .hcs files, and the expected results of their resolution. This set is used to automatically verify any runtime implementation for compliance with the [[formal specification]]. If a runtime passes all tests from this set, it is considered compliant.
Section 2: Tooling & Developer Experience (DX)

### High cognitive load

**High cognitive load** is the mental effort required from a developer to understand and work with a system. One of Hypercode's goals is to reduce this load when reading business logic, but the new paradigm itself can create a load during the learning phase. Quality tools are designed to minimize this effect.

### Steep learning curve

**A steep learning curve** is a characteristic of a technology that requires significant effort and time to master. Hypercode, as a new paradigm, potentially has this characteristic. The DX section of the roadmap aims to "flatten" this curve with intuitive tools and quality documentation.

### "Killer App"

**A “Killer App”** is a colloquial term for a feature or tool that makes a technology extremely attractive and ensures its success. In the context of Hypercode, the [[Configuration Inspector]] is intended to be this "killer app," as it solves the main problem of declarative cascade systems: the difficulty of debugging.

### Resolved Configuration Graph

**The Resolved Configuration Graph** is the final data structure that the runtime creates after applying all .hcs rules to the .hc file. This graph represents a complete description of all application components and their final, configured properties. This graph is the input for the [[Configuration Inspector]].

### Explain Mode

**Explain Mode** is a special mode of the [[Configuration Inspector]] that not only shows the final properties of a component but also explains in detail why they are what they are: which rules were applied, in what order, which were overridden, and the specificity of each.

### "Styles" Panel

**The “Styles” Panel** is a user interface element in the [[Configuration Inspector]] that mimics the analogous panel in web browser developer tools. It conveniently displays all rules applied to the selected component and allows for interactive exploration of the cascade.

### Language Server Protocol (LSP)

**The Language Server Protocol (LSP)** is a standard created by Microsoft that defines the protocol for interaction between a code editor (IDE) and a "language server." The server provides features such as autocompletion, diagnostics, and formatting. Creating a single LSP server for Hypercode makes it easy to integrate language support into multiple editors (VS Code, JetBrains IDEs, etc.).

### Syntax Highlighting

**Syntax Highlighting** is a basic IDE feature that colors different parts of the code (keywords, strings, comments) differently, improving readability. It is one of the first tasks when implementing language support in an editor.
semantic autocompletion
Semantic autocompletion is an advanced IDE feature that suggests code completion options based not only on syntax but also on the meaning (semantics) of the entire project. For example, when writing a selector in .hcs, the IDE will suggest the names of components that actually exist in the .hc file.

### Live Validation

**Live Validation** is an IDE feature that checks code for errors as it is being written and immediately underlines problem areas, without waiting for compilation or execution.

### Go-to-definition

**Go-to-definition** is an IDE feature that allows a user to instantly jump to the place in the code where an element was defined by clicking on the name of a variable, function, or, in Hypercode's case, a component in a selector.

### "Quick-fixes"

**”Quick-fixes”** are automatic actions suggested by the IDE to correct detected errors or linter warnings. For example, if the linter finds a duplicated block of code, it might suggest a "quick-fix" to extract it into a [[Mixins/Templates]].

### Pluggable Rule Architecture

**A Pluggable Rule Architecture** is a design for the [[HCS Linter]] that allows users or third-party developers to easily add their own validation rules without modifying the linter's core code. This makes the tool flexible and extensible.

### Overly-specific selectors

**Overly-specific selectors** are an anti-pattern in .hcs where a selector becomes too long and fragile (e.g., app > panel > section > button). The [[HCS Linter]] should detect and warn about such selectors, as they complicate maintenance and style overrides.

### Unreferenced Secrets

**Unreferenced Secrets** are a potential security issue where a value exists in a secret store, but no rule in .hcs references it. The [[HCS Linter]] can integrate with secret management systems to detect such "dangling" data.

### Wildcard Selectors

**Wildcard selectors** are selectors that use `*` to target all components. Their use can be dangerous because they have low specificity but can unintentionally change the configuration of a large number of components. The [[HCS Linter]] should warn about such usage.

### Official Language Specification

**The Official Language Specification** is the document ([[formal specification]]) that serves as the single source of truth for how the Hypercode language should work. The [[CLI Golden Test Runner]] verifies runtimes against this specification.

### Golden Fixture Suite

A synonym for [[«golden fixtures»]].

### "Hypercode Compliant" Certification Program

**The “Hypercode Compliant” Certification Program** is an initiative aimed at creating an ecosystem of compatible tools. Third-party developers can run their runtime implementations through the [[CLI Golden Test Runner]], and if all tests pass, they receive an official "seal of quality" confirming their compatibility with the specification.

## Section 3: Performance & Execution Model

### Real-world Workloads

**Real-world Workloads** are scenarios for benchmarking that simulate the use of Hypercode in actual, complex projects, rather than in simple synthetic tests. They include a large number of components, imports, and complex rules, which allows for a realistic performance evaluation.

### JIT Startup Overhead

**JIT Startup Overhead** is the extra time a Hypercode application takes to start compared to an equivalent application written in pure imperative code. This overhead is due to the need to parse and resolve .hcs files at every startup. One of the project's goals is to minimize this figure.

### JIT (Just-In-Time) code

**JIT (Just-In-Time) code** — in the context of Hypercode, this refers to the standard execution model where the runtime reads and interprets .hcs files "on the fly" every time the application starts. This provides maximum flexibility but creates [[JIT startup overhead]]. The opposite is [[AOT code]].

### AOT (Ahead-Of-Time) Compilation

**AOT (Ahead-Of-Time) Compilation** is an alternative execution model where .hc and .hcs files are compiled into optimized imperative code in the target language in advance, before the application is run. This completely eliminates [[JIT startup overhead]] and is the recommended approach for production environments.

### AOT Compiler

**The AOT Compiler** (hc-compile) is the tool that performs [[AOT (Ahead-Of-Time) Compilation]]. It takes configuration files as input and generates executable code that no longer contains parsing logic but instead directly creates and wires components.

### Direct-instantiation Code

**Direct-instantiation Code** is the output of the [[AOT compiler]]. It is imperative code that directly calls class constructors and passes them dependencies, as if it were written by hand without a DI framework or the Hypercode runtime.

### Runtime Parsing

**Runtime Parsing** is the process of reading and analyzing .hcs files that occurs every time the application starts in [[JIT code]] mode. [[AOT (Ahead-Of-Time) Compilation]] eliminates the need for this step.

### Resolution Overhead

**Resolution Overhead** is the time the runtime spends on the [[main cascade resolution]]. It is the main component of the [[JIT startup overhead]].

### Security Capability Checks

**Security Capability Checks** are a requirement for the [[AOT compiler]], stating that it must embed the same security checks (see [[Capability Enforcement in Resolution Engine]]) into the generated [[AOT code]] that the runtime performs in JIT mode. This ensures that compiled code is as secure as interpreted code.

### AOT Code

**AOT Code** is the executable code generated by the [[AOT compiler]]. It does not require the [[reference runtime]] to execute.

### Runtime Configuration Resolution Overhead

A synonym for [[resolution overhead]].

### Incremental Resolution (Hot Reload)

**Incremental Resolution (Hot Reload)** is an optimization for development (watch mode), where the runtime does not re-calculate the entire configuration graph when a single file changes, but instead identifies and updates only the parts affected by the change. This provides almost instantaneous feedback.

### Watch Mode

**Watch Mode** is an operating mode for the runtime in which it monitors .hc and .hcs files for changes and automatically reloads the configuration upon saving them, using [[Incremental Resolution (Hot Reload)]].

### Watch Flag

**The `—watch` flag** is a command-line flag for starting the Hypercode runtime in [[watch mode]].

## Section 4: Security & Trust

### Secure-by-Design

**Secure-by-Design** is a development approach where security considerations are an integral part of the architecture from the very beginning, rather than being added on at the end. Hypercode aims to follow this principle by building security into the core of the language and runtime.

### `secret://` URI scheme

**The `secret://` URI scheme** is a standardized way of referencing secrets from .hcs files that avoids storing them directly in the code. The URI specifies where to load the secret from (e.g., secret://vault/path/to/key). This URI is handled by the [[SecretProvider model]].

### SecretProvider Model

**The SecretProvider Model** is a pluggable architecture in the runtime that allows connecting different "providers" to work with various secret stores (HashiCorp Vault, AWS Secrets Manager, etc.). The runtime delegates the task of retrieving a secret to the provider based on the address specified in the [[secret:// URI scheme]].

### `hypercode.lock`

**The `hypercode.lock`** file is a manifest, similar to package-lock.json in npm, which contains [[cryptographic hashes]] of all .hcs files used in a project. This file is the basis for the [[HCS Signing & Verification]] mechanism, ensuring configuration integrity.

### Cryptographic Hashes

**Cryptographic Hashes** are unique "fingerprints" of files, calculated using a cryptographic algorithm. Any change to a file, no matter how small, results in a drastically different hash. Storing hashes in hypercode.lock allows verification that the configuration files have not been altered.

### "Secure Mode"

**”Secure Mode”** is a special operating mode for the runtime in which it requires mandatory verification of the hypercode.lock file's digital signature before execution. In this mode, any unsigned or tampered configuration will be rejected.

### HCS Signing & Verification

**HCS Signing & Verification** is a security mechanism that guarantees the integrity (files have not been modified) and authenticity (files were created by a trusted source) of the configuration. It is based on [[cryptographic hashes]] in the [[hypercode.lock]] file and a digital signature of that file.

### Agent Passport Security Model

**The “Agent Passport” Security Model** is a concept where each component (agent) in the system has a declarative manifest ("passport") describing its capabilities: which files it can access, which network addresses it can connect to, etc. Hypercode integrates this model into its core via [[Capability Enforcement in Resolution Engine]].

### Architectural Declaration

**An Architectural Declaration** — in the context of Hypercode, this is the .hc file. It describes the structure of the application. Linking this declaration with a [[security policy]] means that security becomes an integral part of the architecture.

### Security Policy

**A Security Policy** is a set of rules that defines what is allowed and what is forbidden for the components of a system. In Hypercode, the security policy is defined using the [[Agent Passport security model]] and is enforced by the runtime.

### Capability Bounds

**Capability Bounds** are the specific permissions defined in a component's "passport" within the [[Agent Passport security model]]. For example, `file_access: read_only(“/data”)`.

### "Passport"

**A “Passport”** is the declarative manifest of a component, which is the central element of the [[Agent Passport security model]].

## Section 6: Integration & Interoperability

### "Adapter for Legacy Code" Pattern

**The “Adapter for Legacy Code” Pattern** is an official, documented way to integrate Hypercode into existing projects whose code does not follow modern DI principles. The pattern consists of creating a special "wrapper" class ([[«wrapper» pattern]]) that hides the "impurity" of the old code and provides a clean, configurable interface for Hypercode.

### "Wrapper" Pattern

A synonym for the [[«Adapter for Legacy Code» Pattern]].
security sandbox wrappers
Security sandbox wrappers are a requirement for the implementation of the [[«Adapter for Legacy Code» Pattern]], according to which the adapter class should not only transform the interface but also, where possible, restrict (sandbox) the legacy code to prevent it from gaining unauthorized access to resources.

-——

### External Compatibility Layer (Generators)

The External Compatibility Layer (Generators) is a feature of Hypercode that allows it to serve as a single source of truth for configuring not only the application itself but also external systems like Terraform or Kubernetes. This is implemented through a [[«generator» architecture]].

### "generator" architecture

The "generator" architecture is a pluggable system in Hypercode that allows connecting "generators" capable of transforming the resolved Hypercode configuration into a format understood by other systems (e.g., into .tfvars for Terraform).

### Terraform: .tfvars

.tfvars are variable files for [[Terraform]], a tool for managing infrastructure as code. A Terraform generator in Hypercode allows infrastructure variables to be managed from the same .hcs files as the application.

### Terraform

Terraform is a popular tool for managing infrastructure as code (IaC).

### Kubernetes: ConfigMap, Secret

ConfigMap and Secret are standard resources in [[Kubernetes]] for storing configuration data and secrets, respectively. A Kubernetes generator in Hypercode allows for the automatic creation of these resources based on .hcs rules.

### Kubernetes

Kubernetes is an open-source platform for automating the deployment, scaling, and management of containerized applications.

### Stable ABI/IPC Contract

A Stable ABI/IPC Contract is a formalized and versioned protocol that defines how the Hypercode ecosystem tools (IDE, CLI) interact with the runtime. The stability of this contract is critical for the [[language-agnostic]] approach.
language-agnostic
Language-agnostic is a property of a system or standard that allows it to work with components written in different programming languages. Hypercode aims to be a language-agnostic orchestration layer.

### Application Binary Interface

An ABI (Application Binary Interface) is a low-level contract between software components that defines how they interact at the machine code level. In the context of Hypercode, this term is used as part of the [[Stable ABI/IPC Contract]] to denote a strict, machine-readable interface.

### Inter-Process Communication

IPC (Inter-Process Communication) is a set of mechanisms that allow different processes (e.g., an IDE and the Hypercode runtime) to exchange data. The [[Stable ABI/IPC Contract]] standardizes this interaction.

### JSON-RPC

JSON-RPC is a simple remote procedure call protocol that uses JSON to encode messages. It is a candidate for implementing the [[Stable ABI/IPC Contract]] due to its simplicity.

### gRPC

gRPC is a high-performance remote procedure call framework developed by Google. It uses Protocol Buffers for data serialization and is a candidate for the [[Stable ABI/IPC Contract]] for scenarios requiring high performance.

### WIT (WebAssembly Interface Types)

WIT (WebAssembly Interface Types) is a standard for describing interfaces between WebAssembly components and the host system. It is a promising candidate for the [[Stable ABI/IPC Contract]] due to its focus on security and language independence.

### .wit

.wit is the file extension used for defining interfaces in the [[WIT (WebAssembly Interface Types)]] format.

### .proto

.proto is the file extension used for defining services and messages for [[gRPC]] using Protocol Buffers.

### Semantic Versioning (SemVer)

Semantic Versioning (SemVer) is a formal standard for assigning version numbers to software. It prescribes how to change the version number (MAJOR.MINOR.PATCH) depending on whether the changes are breaking. The [[Stable ABI/IPC Contract]] must strictly follow this standard.

## Section 7: Infrastructure & Quality Assurance (QA)

### CI/CD pipeline

A CI/CD pipeline is an automated process in modern software development that includes Continuous Integration (CI) — building and testing code with every change, and Continuous Delivery/Deployment (CD) — automatically preparing for a release.

### CI Service

A CI Service is a platform (e.g., [[GitHub Actions]]) that provides the infrastructure and tools to run a [[CI/CD pipeline]].

### GitHub Actions

GitHub Actions is a popular [[CI Service]] built into the GitHub platform.

### Unit Tests

Unit Tests are tests that verify the correctness of the smallest, isolated parts of the code (modules, functions).

### Integration Tests

Integration Tests are tests that verify the correct interaction of multiple system components with each other. In Hypercode, this primarily involves running the [[«golden fixtures»]].

### Static Analysis

Static Analysis is the analysis of code without actually executing it. In Hypercode, this includes the work of the [[HCS Linter]] and other tools that look for potential errors, vulnerabilities, and style violations.

### Security Scanning

Security Scanning is a part of the [[CI/CD pipeline]] where automated tools check the code and its dependencies for known vulnerabilities.

### Merge Gate

A Merge Gate is a rule in a version control system that prohibits merging a branch (e.g., a Pull Request) if the [[CI/CD pipeline]] for it has not completed successfully. This is a mandatory requirement for maintaining the quality of the main branch.

### mandatory requirement

A mandatory requirement — in the context of the roadmap, this means that a task or condition is non-negotiable and must be fulfilled for the successful completion of a stage.

### Version Compatibility Testing

Version Compatibility Testing is a process that ensures a new version of the runtime is backward compatible with configurations written for previous versions, in accordance with [[Semantic Versioning (SemVer)]] rules.

### polyglot ecosystem

A polyglot ecosystem is the community and set of tools around a technology that support and encourage development in different programming languages. Creating such an ecosystem is one of Hypercode's strategic goals.

### quality standard

A quality standard is a set of formal requirements and tests (e.g., [[«golden fixtures»]]) that any implementation must meet to be considered high-quality and compliant.

### "badge of honor"

A "badge of honor" is a metaphor for the official [[«Hypercode Compliant» SVG badge]], which serves as public recognition that a third-party implementation meets the [[quality standard]].

### Certification Process

The Certification Process is a documented and automated set of steps that developers of third-party runtimes must follow to obtain the [[«Hypercode Compliant» SVG badge]].

### "Hypercode Compliant" SVG badge

The "Hypercode Compliant" SVG badge is an official graphic icon that developers of certified runtimes can place in their repositories to demonstrate their compliance with the specification.

### List of Certified Runtimes

The List of Certified Runtimes is an official, public list on the project's website that serves as a directory of all third-party implementations that have passed the [[Certification Process]].

-——

# Terms by ChatGPT-5

## Core Language and Cascade

### Descendant Selector

A Descendant Selector is a type of [[Selector]] that targets commands that are descendants of another command in the [[Hypercode (.hc)]] hierarchy, regardless of how deeply nested they are. It is represented by a space between two selectors. For example, `WebServer .secure-port:` targets any element with the `.secure-port` class that exists anywhere inside a `WebServer` command.

This selector is less specific than a [[Child Selector]] (`>`) but more expressive for applying broad rules within a specific architectural branch.

### General Sibling Selector

The General Sibling Selector (`~`) is a [[Combinators|Combinator]] that targets commands that are siblings of and appear after a specified command, sharing the same parent in the [[Hypercode (.hc)]] hierarchy. For example, `PrimaryDB ~ ReplicaDB:` would apply a configuration to all `ReplicaDB` commands that follow the `PrimaryDB` command at the same indentation level. It is useful for configuring groups of related peer components.

### Rule Origin

Rule Origin refers to the source layer from which a configuration rule originates. The [[Resolution Algorithm]] uses origin as the first and most critical step in the [[Cascade and Specificity]] calculation, creating a layered system of precedence. The standard origins are, in increasing order of priority:

1.  **Base:** Default rules from the runtime or core library.
2.  **Imported:** Rules from files included via the [[@import Directive]].
3.  **Main:** Rules defined in the primary `.hcs` file.
4.  **User Override:** Rules from a special user-specific file, loaded last.

This formalizes how the [[Import Cascade]] resolves conflicts between different configuration sources.

### Rule Importance

Rule Importance is a mechanism that allows a single rule to override all other declarations, regardless of [[Specificity]] or [[Document Order]]. It is the equivalent of CSS's `!important` flag. Using importance should be done sparingly, as it can make debugging the cascade more difficult. Its primary purpose is for user override stylesheets or critical security policies that must not be accidentally overridden. It is the highest layer of the [[Cascade and Specificity]] hierarchy, even above [[Rule Origin]].

### Document Order

Document Order is the principle used as the final tie-breaker in the [[Resolution Algorithm]] when two [[Selector|Selectors]] have the exact same [[Specificity]]. According to this rule, the selector that appears later in the document (or in an imported file) wins. This ensures that the resolution process is always deterministic. It is a key part of [[Conflict Resolution Rules]] and is synonymous with the concept of [[Source Order]].

### Interpolation

Interpolation is the process of substituting placeholders in a [[Hypercode Cascade Sheet (HCS)]] file with dynamic values at runtime. The most common use is [[Environment Variable Expansion]] (e.g., `host: "${DB_HOST}"`), but it can also extend to other values within the [[Execution Context]]. A formal definition of interpolation syntax and the available scope of values is critical for predictable configuration and for tooling like the [[HCS Linter]].

### Namespace

A Namespace is a conceptual scope that prevents name collisions for identifiers (IDs) and classes within a large project. While [[Hypercode (.hc)]] does not have a formal namespace syntax, the [[@import Directive]] and file structure implicitly create them. A robust [[Resolution Algorithm]] must define how [[ID Selector]] and [[Class Selector]] targets are resolved within the context of their file and the broader [[Import Cascade]] to prevent ambiguity in complex systems.

## Merge and Resolution Semantics

### List Merge Strategy

The List Merge Strategy is a specific rule within the [[Property Merge Strategy]] that defines how array properties are combined when a component is targeted by multiple rules. Developers can specify a policy for merging, such as:

* **replace:** The last list to be applied completely replaces any previous lists.
* **append:** Elements from the new list are added to the end of the existing one.
* **deduplicate:** Elements are appended, but duplicates are removed.

Defining a clear strategy is critical for predictable configuration of components that accept lists of values, like plugins or middleware.

### Map Merge Strategy

The Map Merge Strategy is a component of the [[Property Merge Strategy]] that defines how map/dictionary properties are combined. The strategy must clarify whether the merge is shallow (top-level keys are replaced) or deep (nested maps are recursively merged). The default behavior in Hypercode is typically a deep merge, allowing for granular configuration overrides, while key collisions at the same level are resolved based on [[Document Order]].

### Conflict Diagnostics

Conflict Diagnostics are detailed messages generated by the [[Reference Runtime]] or [[Configuration Inspector]] that explain exactly why one rule was overridden by another. These diagnostics are essential for debugging and transparency, forming the data backbone for the inspector's [[Explain Mode]]. A typical diagnostic message would show the winning and losing rules, their respective [[Selector|Selectors]], their calculated [[Specificity]] scores, and their [[Rule Origin]] and [[Document Order]].

## Execution and Artifacts

### Runner

A Runner is the component of the [[Reference Runtime]] responsible for interpreting and executing a Hypercode application in [[JIT (Just-In-Time) code|JIT mode]]. It performs the file parsing, rule resolution, and construction of the [[Executable Program Graph]] every time the application starts. This term helps distinguish the interpretation-based execution model from the pre-compiled [[AOT (Ahead-Of-Time) Compilation|AOT]] model.

### AST (Abstract Syntax Tree)

An AST (Abstract Syntax Tree) or IR (Intermediate Representation) is the internal data structure that the [[HCS parser]] creates from the raw text of `.hc` and `.hcs` files. This tree represents the code's structure and semantics in a way that is easy for the machine to work with. The [[Resolution Algorithm]] and tools like the [[Configuration Inspector]] operate on this AST, not the raw text files. A formally specified AST is a prerequisite for building a stable ecosystem of tools.

### Resolution Cache

The Resolution Cache is an in-memory store used to support [[Incremental Resolution (Hot Reload)]]. When operating in [[Watch Mode]], the runtime uses this cache to store the results of previous resolutions (e.g., the [[AST (Abstract Syntax Tree)|AST]] or partially resolved graphs). When a file changes, the runtime can invalidate only the affected parts of the cache, recalculating a small subset of the graph instead of starting from scratch. This dramatically speeds up reload times in development.

## Tooling and Developer Experience

### HCS Linter

The HCS Linter is a static analysis tool that checks [[Hypercode Cascade Sheet (HCS)]] files for errors, potential bugs, stylistic issues, and anti-patterns. It is built on a [[Pluggable Rule Architecture]] , allowing for custom rule sets. Core responsibilities include identifying [[Overly-specific selectors]] , [[Wildcard Selectors]] , [[Unreferenced Secrets]] , and enforcing project-specific conventions.

### Formatter

A Formatter (`hc-fmt` or `hcs-fmt`) is a developer tool that automatically rewrites `.hc` and `.hcs` files into a standard, canonical style. It enforces consistent indentation, key ordering, and spacing. A formatter eliminates style debates and makes configurations more readable. Its most critical role is ensuring that files are in a predictable format before security operations, which is a prerequisite for reliable [[Canonicalization]].

### Property Provenance Trace

A Property Provenance Trace is the detailed "chain of custody" for a component's final property value, as displayed by the [[Configuration Inspector]]. It provides a step-by-step history showing every rule that targeted the property, the file and line number of each rule, their [[Specificity]] scores, and which rule ultimately "won" the cascade. This trace is the core data that powers the inspector's [[Explain Mode]] and [[“Styles” Panel]]. 

## Security and Trust

### Canonicalization

Canonicalization is the process of converting a configuration file into a standard, unambiguous textual representation before it is used in a security-sensitive operation. For [[HCS Signing & Verification]], `.hcs` files must be canonicalized (e.g., keys sorted alphabetically, consistent whitespace) before their [[Cryptographic Hashes]] are calculated. Without this step, two semantically identical files could have different hashes, making verification impossible. A [[Formatter]] is often used to perform canonicalization.

### Capability Enforcement in Resolution Engine

Capability Enforcement is the process by which the [[Resolution Algorithm]] actively blocks configurations that violate a component's defined [[Security Policy]]. As part of the [[Agent Passport Security Model]], each component has declared [[Capability Bounds]] (e.g., which file paths or network ports it can access). If a rule attempts to configure a component with a value outside these bounds, the resolution engine will fail with a security error. This integrates security directly into the application assembly phase.

## Interoperability and Ecosystem

### Emitters

Emitters, also known as Generators, are pluggable modules that extend the Hypercode runtime to transform the final [[Resolved Configuration Graph]] into configuration files for external systems. This is the core of the [[External Compatibility Layer (Generators)]] and `"generator" architecture` . For example, a [[Terraform]] emitter could generate `.tfvars` files , and a [[Kubernetes]] emitter could generate `ConfigMap` and `Secret` manifests .

### Versioning Scheme

The Versioning Scheme is the formal policy that dictates how the [[Official Language Specification]] and its associated tools and runtimes are versioned. This scheme must strictly adhere to [[Semantic Versioning (SemVer)]] to ensure predictability and maintain a stable ecosystem. Major version changes signal breaking changes to the specification or the [[Stable ABI/IPC Contract]] , while minor and patch versions guarantee backward compatibility, as verified by [[Version Compatibility Testing]] .

