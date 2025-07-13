# 📋 Hypercode Grammar Test Cases

This document contains a collection of test cases for validating the Hypercode grammar implemented in ANTLR4.  
Each test includes a code snippet, expected structure, and optional notes.

---

## ✅ Basic Commands

```hc
Application
Button
Cancel
```

- Simple list of top-level commands.
- No classes or IDs.

---

## ✅ Commands with `.class` and `#id`

```hc
Application
  Button.primary #ok
  Button.secondary #cancel
```

- Tests support for class selectors (`.primary`) and IDs (`#ok`).
- Also validates indentation and nested structure.

---

## ✅ Mixed nesting

```hc
Application
  Form
    Input.text #name
    Input.password #pass
  Button.primary #submit
```

- Validates deep nesting and multiple element types.

---

## ✅ Empty lines and extra spacing

```hc
Application

  Button.primary    #confirm


  Cancel
```

- Should skip or tolerate empty lines.
- Extra spaces between elements are ignored.

---

## ❌ Invalid: bad identifier

```hc
123Button
```

- Identifiers must start with a letter.

---

## ❌ Invalid: class before name

```hc
.primaryButton
```

- Element name must come before `.class`.

---

## ❌ Invalid: incorrect indentation

```hc
Application
    Button
```

- Indentation must be consistent (e.g., 2 spaces).
- Too much or too little breaks nesting.

---

## ✅ Standalone ID and class usage

```hc
Button #onlyId
Button.primary
```

- Should allow presence of only `.class` or `#id`.

---

## ✅ Advanced: sibling blocks

```hc
Section
  Title
  Paragraph

Section
  Image
```

- Ensures that repeated blocks at same level are parsed independently.

---

## 🧪 Usage

Run each example through the ANTLR parser:

```bash
make run FILE=tests/example1.hc
```

Compare parse tree to expected structure.

