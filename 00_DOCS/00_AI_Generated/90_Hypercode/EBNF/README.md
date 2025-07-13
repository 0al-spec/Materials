# 🧪 Hypercode + ANTLR Playground

This subproject provides a minimal interactive environment for experimenting with the **Hypercode language grammar**, implemented in [ANTLR4](https://www.antlr.org/).

> Use this if you're contributing to the grammar, testing `.hc` files, or building parsers/interpreters for Hypercode.

## ⚙️ Requirements

- Java 11 or later
- [curl](https://curl.se/)
- macOS, Linux or WSL (Makefile-based)

## 🚀 Quick Start

```bash
git clone https://github.com/0AL/Hypercode.git
cd Hypercode/examples/antlr
make run
```

The first run will automatically:

1. Download `antlr-4.13.0-complete.jar`
2. Generate Java sources from `Hypercode.g4`
3. Compile the parser and lexer
4. Parse and visualize `example.hc`

## 📁 Directory Layout

```
examples/antlr/
├── Hypercode.g4       # ANTLR4 grammar for .hc files
├── example.hc         # Sample Hypercode input file
├── Makefile           # Build, run, clean
├── .gitignore         # Ignores generated files
```

## 🛠️ Available Commands

```bash
make            # Downloads ANTLR and builds everything
make run        # Parses example.hc and shows the parse tree
make clean      # Removes generated files and classes
```

You can also run with a custom file:

```bash
make run FILE=mytest.hc
```

## 🔍 Sample Output

Given `example.hc`:

```hc
Application
Button
Cancel
```

The command:

```bash
make run
```

Produces:

```
(hypercode
  (line (commandLine (command Application) \n))
  (line (commandLine (command Button) \n))
  (line (commandLine (command Cancel) \n))
)
```

## 🧼 Cleanup

To remove all generated files:

```bash
make clean
```

## 🤝 Contributing

If you're contributing to the grammar:

- Edit `Hypercode.g4`
- Use `make run` to test your changes
- See `example.hc` for syntax samples
- Don’t commit `.class`, `.tokens`, or `.interp` files — they’re ignored

## 📄 License

This directory is part of the [Hypercode project](https://github.com/0AL/Hypercode) and licensed under MIT.
