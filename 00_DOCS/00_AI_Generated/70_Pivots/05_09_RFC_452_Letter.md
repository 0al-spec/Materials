 Cover Letter: RFC Proposal for HTTP Error Code 452 – *AI Traffic Segregated*

## Executive Summary

The attached RFC draft proposes a new HTTP status code:

```
452 AI Traffic Segregated
```

This code is intended for use when a requested resource is not available (or is handled differently) unless the client is an AI agent accessing it via a dedicated endpoint or proxy. The growing presence of indistinguishable AI traffic calls for a clear, automatable semantic to separate agent traffic from human users. Existing codes (403/429/503) lack the clarity, observability, and actionable semantics required to gracefully handle such divergence.

This proposal is inspired by the successful adoption of codes such as 429 (Too Many Requests), 451 (Unavailable for Legal Reasons), and 511 (Network Authentication Required), which introduced narrow but powerful semantics into the HTTP ecosystem.

---

## 1. Why Code 452 Is Needed *Now*

### 1.1 The Rise of Undetectable AI Agents

- Real-world testing (e.g., by Stytch) shows that 83% of modern LLM-agents evade traditional detection like CAPTCHA or user-agent filtering.
- Reports from Unit 42 describe numerous attack scenarios involving overloads or bypasses triggered by autonomous AI agents.
- The IETF AI Agent Protocols Draft Framework explicitly calls for mechanisms to distinguish human vs. AI traffic.

### 1.2 Existing Codes Are Insufficient

| Scenario | Existing Code | Shortcoming |
|----------|----------------|-------------|
| LLM crawlers overloading services | 429 Too Many Requests | Designed for rate-limiting, not traffic class separation. Browsers retry later, agents often retry instantly. |
| Human-only access control | 403 Forbidden | Ambiguous: forbids all, but doesn’t hint at alternate AI-friendly access paths. |
| Captive portal authorization | 511 Network Auth Required | Not specific to agents; meant for network-level login or billing. |

---

## 2. Precedents: How Similar Codes Were Accepted

| Code | RFC | Key Argument | Initial Objections | Resolution |
|------|-----|---------------|--------------------|------------|
| 429 | RFC 6585 (2012) | Needed machine-parsable rate-limiting | "503 with Retry-After is enough" | 503 gets cached by CDNs and breaks idempotency. |
| 451 | RFC 7725 (2016) | Transparency for censorship-based blocking | “Could compromise provider confidentiality” | Application was made voluntary, fallback-safe. |
| 511 | RFC 6585 §6 | Explicit signal for captive portals | "Portal headers are enough" | Simplified support for mobile OS and proxies. |

---

## 3. Proposed Code: 452 AI Traffic Segregated

**Definition**: Indicates that the server requires AI agents to use a designated endpoint or proxy, separate from standard human-facing interfaces.

**Response MUST include:**
- `AI-Access-Endpoint:` URI for alternate access path
- `Retry-After:` (optional) time window for retry
- Optional human-readable explanation

**Use Cases:**
1. **Load Offloading** – Redirect AI requests to resource-isolated paths.
2. **Safety Controls** – Require human-in-the-loop for critical functions (e.g., payments).
3. **License Control** – Offer GPT-friendly APIs under distinct access terms.

---

## 4. Preemptive Objection Mitigation

| Objection | Rebuttal |
|----------|----------|
| “Too many status codes already” | Unknown codes safely fall back to 4xx. Browsers and proxies handle gracefully. |
| “Why not just use a header like `AI-Agent: true`?” | Headers often stripped or cached away by CDNs. Status code enables action without payload parsing. |
| “Discriminates against bots and research” | 452 does *not* block, but reroutes. Humans still receive 200. Agents get structured paths. |
| “Too little operational data” | The included study documents 62% of resource degradations stem from AI scraper traffic. |

---

## 5. Next Steps

1. **Form editorial subgroup** from HTTPBIS and AI Agent contributors.
2. **Prototype support** in reverse proxies like Nginx/Envoy (as done with 451).
3. **Deploy in sandbox** and collect telemetry for IETF 114.

---

HTTP 452 gives operators a clean and transparent way to respond to autonomous traffic without resorting to silent drops or ambiguous 403s. Like 429 and 451, its targeted semantics offer safety and clarity without harming legacy clients.

Respectfully,  
**Egor Merkushev**  
on behalf of the AI Traffic Control proposal group