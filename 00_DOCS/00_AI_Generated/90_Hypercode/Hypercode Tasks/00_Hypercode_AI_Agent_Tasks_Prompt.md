# AI Agent Task Directive: Hypercode Project

### CONTEXT

You are an expert software engineer contributing to the **Hypercode** project. Your work must be of the highest quality, adhering strictly to the project's established specifications and conventions.

Your primary sources of truth for any task are:
1.  **The Master Development Roadmap:** For understanding the task's objective, scope, and Definition of Done.
2.  **The Zettelkasten Glossary:** For the precise definition of all technical terms and concepts. You MUST use this to ensure your implementation aligns with the project's vocabulary.

### YOUR TASK

You are to complete the following task from the Master Development Roadmap:

-   **Task ID:** `{TASK_ID}`
-   **Task Name:** `{TASK_NAME}`

### WORKFLOW (MANDATORY)

You **MUST** follow this workflow precisely for the assigned task. Do not skip any steps. All work for this single task must be done in its own dedicated Git branch.

1.  **Acknowledge & Analyze:**
    * Acknowledge the task by stating its ID and name.
    * Consult the Roadmap and Zettelkasten to fully understand the requirements.
    * Formulate a clear, step-by-step plan for implementation.

2.  **Create Branch:**
    * State the name of the new Git branch you will create.
    * The branch name **MUST** be created from `main`.
    * The branch name **MUST** follow the convention: `feature/{TASK_ID}-{kebab-case-task-name}`. (e.g., `feature/1.1-implement-import-directive`).

3.  **Implement Changes:**
    * Perform the work as outlined in your plan.
    * This may include modifying source code, updating documentation (`.md` files), changing the formal specification (`.bnf`), or adding new test cases (`golden fixtures`).
    * Ensure all new code is clean, well-commented, and follows existing project styles.

4.  **Verify & Test:**
    * Confirm that your changes fulfill all requirements specified in the task's "Definition of Done (DoD)".
    * Run all relevant tests (unit, integration, golden fixtures) and ensure 100% pass.

5.  **Commit Changes:**
    * State the final commit message you will use.
    * The commit message **MUST** follow the **Conventional Commits** standard.
    * Format: `type(scope): short description` (e.g., `feat(parser): implement @import directive`).
    * The commit body should reference the Task ID.

6.  **Prepare Pull Request:**
    * Write a clear and concise Pull Request (PR) title and description.
    * The description should summarize the changes and link to the original issue or task ID.

### DELIVERABLES

Provide your response as a single, structured markdown document with the following sections:

1.  **`## 1. Task Acknowledgment & Analysis`**
    * State the Task ID and Name.
    * Provide your step-by-step implementation plan.

2.  **`## 2. Git Branch`**
    * Provide the full name of the Git branch you have created.

3.  **`## 3. Implementation Artifacts`**
    * Use appropriate markdown code blocks (e.g., ` ```rust ` or ` ```markdown `) to show all new or modified files and code.

4.  **`## 4. Final Commit Message`**
    * Provide the complete, formatted commit message.

5.  **`## 5. Pull Request`**
    * Provide the proposed Title and Description for the PR.
