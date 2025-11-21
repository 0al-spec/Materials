# First Priority Non-Coding Task: Formalize Resolution Semantics

**Task ID:** 1.5
**Section:** Core Language and Syntax
**Priority:** High

### Objective
To create a formal, mathematically precise specification of the resolution engine to guarantee determinism and compatibility between different runtime implementations.

### Rationale
This is the most critical non-coding task because it serves as the foundation for the entire language. Without a formal, unambiguous definition of how rules are resolved, different runtimes could behave differently, which would undermine the goal of creating a language standard. This work must precede or happen in parallel with any complex feature implementation to avoid ambiguity.

### Specific Tasks (No Coding Required)

1.  **Formalize the Specificity Calculation Algorithm:**
    * Create a document that assigns numerical weights to each selector type (ID, class, attribute, type).
    * Define the exact algorithm for calculating the final specificity score of any given selector chain.
    * Provide a `formal specificity scoring table` with examples.

2.  **Define the Property Merge Strategy:**
    * Document the rules for how properties from different, non-conflicting rules are merged into a single component configuration.

3.  **Define Conflict Resolution Rules:**
    * Formally state the tie-breaking logic. The primary rule is *source order*: the rule that appears later in the document (or is imported later) wins in a tie. This must be specified unambiguously.

4.  **Provide Determinism and Invariance Guarantees:**
    * Write a section for the RFC that formally guarantees *determinism* (the same input always produces the same output).
    * Describe the *invariance guarantees* of the system (e.g., how changing component order in `.hc` does or does not affect the outcome).

5.  **Create "Golden Fixtures":**
    * Write a comprehensive suite of `.hc` and `.hcs` test files that cover every edge case of the resolution semantics.
    * For each test case, manually write the expected final JSON/YAML output. This suite will become the standard against which all future code implementations will be tested.

### Definition of Done

* A new, detailed chapter titled "Resolution Semantics" is written and ready to be merged into the main Hypercode RFC document.
* A complete suite of "golden fixtures" with their expected outputs is created and committed to the project repository.
