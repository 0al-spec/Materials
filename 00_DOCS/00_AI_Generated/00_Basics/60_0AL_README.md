# 0AL — Zero-trust Agents Layer

> The missing layer between your OS and agents.

**0AL** defines a runtime-agnostic execution model for securely running agents in zero-trust environments.

---

## Core Concepts

Every executable becomes an *agent*,  
every invocation — a *declaration*,  
every process — *sandboxed, signed, introspectable*.

- **0AL**  
  A thin but foundational substrate that turns every execution into a secure agent contract.

- **Agent Passport**  
  A signed declaration of who the agent is, what it can do, and how it should be constrained.

- **`zeroald`**  
  A reference daemon that executes agents natively within the 0AL model.

- **`agentifyd`**  
  A reference daemon that agentifies legacy executables based on their declared passports.

---

## Repository Structure (WIP)

| Repository                 | Description |
|----------------------------|-------------|
| [`agent-passport`](https://github.com/0al-spec/agent-passport) | RFC/specification for the Agent Passport format |
| `zeroald`                  | Reference runtime daemon for executing native 0AL agents |
| `agentifyd`                | Agentification daemon for legacy binaries using Agent Passport |
| `zeroal`                   | CLI tools for building, signing, validating, and running agents |
| `docs`                     | Documentation, guides, and developer materials (planned) |

---

## Status

`0AL` is currently in **pre-release stage**.  
The Agent Passport RFC is published.  
The core 0AL specification and reference runtimes (`agentifyd`, `zeroald`) are in active design and prototyping.

---

## Mission

To turn every process into a verifiable, minimal-trust agent — and make your OS **agent-native**.

---

## Get Involved

We’ll be opening early issues, design discussions, and implementation proposals soon.  
Until then — **Trust No One. Run Everything.**