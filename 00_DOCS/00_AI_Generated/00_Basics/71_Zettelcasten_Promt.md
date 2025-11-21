# Zettelcasten prompt

You have a comprehensive dictionary/card collection to process.

Begin with a concise checklist (3-7 bullets) of what you will do; keep items conceptual, not implementation-level.

## Instructions:

- Standardize the style of all card entries for consistency.
- Eliminate duplicate cards so only unique entries remain.
- Detect and address any contradictions in definitions. If contradictions cannot be resolved, pause processing that term and clearly request clarification from the user on the correct definition.
- Ensure all content is in English.
- Create Obsidian-style links between related cards using [[Term Name]] formatting.
- Provide your output as a single downloadable Markdown file.

After completing all processing steps, verify that each card meets the format below, is written in English, is unique, and is alphabetically sorted. Indicate in 1-2 lines if all checks are successful or specify which steps need attention before producing the final file.

## Card Markdown Format

Each card must appear as:

```markdown
### Term Name
Definition: <A concise, clear definition here>
Related: [[Related Term 1]], [[Related Term 2]]
Tags: #tag1 #tag2
```

- Use an H3 header for the term name (i.e., `### Term Name`).
- Place a brief and precise explanation in the Definition section.
- Add a Related section with Obsidian-style double bracket links; omit if not applicable.
- Use Tags in Markdown hashtag format; omit if not available.
- Alphabetically sort cards by term name.
- If you encounter irreconcilable definitions, insert this comment directly in the Markdown output and await user input: `<!-- Need clarification: [term] has conflicting definitions -->`.
- Produce the final result as a single Markdown file ready for download.