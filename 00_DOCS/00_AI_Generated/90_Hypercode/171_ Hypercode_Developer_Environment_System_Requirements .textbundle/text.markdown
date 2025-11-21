# Hypercode Developer Environment: System Requirements

This document outlines the minimal software requirements for developers contributing to the Hypercode language, its reference runtime, and its core tooling.

### 1. Core Development Environment

A developer must be proficient in **at least one** of the following language ecosystems, as the Hypercode runtime and tools are designed to be polyglot.

-   **Rust:**
    -   `rustc` (latest stable version)
    -   `cargo`
-   **Python:**
    -   Python 3.9+
    -   `pip` & `venv`
-   **Go:**
    -   Go 1.18+

### 2. Essential Tooling

-   **Version Control:**
    -   `Git` (latest version) is mandatory for source code management.
-   **Text Editor / IDE:**
    -   A modern code editor that supports the Language Server Protocol (LSP).
    -   **Recommended:** Visual Studio Code or any JetBrains IDE (e.g., IntelliJ IDEA, CLion, PyCharm).
-   **Containerization:**
    -   `Docker Desktop` or a compatible container engine is required to run and test packaged tools like the certification runner.
-   **API & Schema Tools:**
    -   Familiarity with API definition tools like Protocol Buffers (`protoc`) for gRPC or similar tools for the chosen ABI/IPC contract.

### 3. Collaboration & QA Infrastructure

-   **CI/CD:**
    -   A `GitHub` account is required to interact with the project's repositories and CI/CD pipelines (GitHub Actions).
-   **Node.js Ecosystem (for Tooling/Plugin Dev):**
    -   `Node.js` (LTS version)
    -   `npm` or `yarn`
    -   *Note: This is essential for developers working on the LSP client-side plugins for IDEs like VS Code.*
