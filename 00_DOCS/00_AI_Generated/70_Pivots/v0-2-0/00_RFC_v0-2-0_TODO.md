# Agent Passport Specification – Expert Review TODO List

Based on a multi-role expert review, the following tasks are recommended for the next iteration (v0.2.0) of the Agent Passport Specification.

—

## 🔐 Security & Zero-Trust Enhancements
- [ ] Clarify the verification mechanism for `publicKeyRef` (e.g., JWKS, DID resolution).
- [ ] Emphasize TLS usage and threat of MITM during key retrieval.
- [ ] Add a `revoked` field for offline/passive revocation awareness.
- [ ] Recommend HSM or enclave support for Issuing Authority private key storage.

## 🧠 Multi-Agent Systems (MAS) Support
- [ ] Define capability inheritance or delegation (referencing capabilities from other agents).
- [ ] Consider adding support for context-aware or conditional capabilities (e.g., `@rules`-like semantics).

## 📜 Specification Format & Validation
- [ ] Provide a formal JSON Schema for the Agent Passport YAML format.
- [ ] Define MIME type (`application/vnd.agent-passport+yaml`) in the IANA section.
- [ ] Encourage tooling to gracefully ignore unknown fields (with examples).

## 📋 Compliance, Lifecycle & Auditing
- [ ] Consider adding an `auditLogPolicy` section for visibility & access control of audit logs.
- [ ] Add optional `revocationReason` field for better forensic traceability.
- [ ] Suggest standard ways to present revoked passports (e.g., stamp or flag in metadata).

## ⚙️ Runtime Enforcement and Integration
- [ ] Define required behavior of runtimes on mismatch between passport and agent actions.
- [ ] Add guideline on graceful degradation or fallback (e.g., partial enforcement modes).
- [ ] Suggest conformance test cases for agent runtimes to validate enforcement behavior.

## 🧩 General Extensibility
- [ ] Encourage use of `x-` fields and vendor namespaces for forward-compatible experimentation.
- [ ] Expand on versioning strategy with concrete migration guidance for future versions.

—

**Generated:** 2025-07-20  
**Source:** Expert review of agent-passport-v0.1.0.pdf