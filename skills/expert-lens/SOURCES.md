# Expert Lens Sources

## Source Inventory

| Source | Trust tier | Confidence | Contribution | Constraints |
| --- | --- | --- | --- | --- |
| User conversation on 2026-07-14 | Primary requirement | High | Defined the goal: expert/practitioner context beyond official docs; both learning and refresh modes; current trends; adaptive depth; technical focus with non-software support. | Do not store private examples beyond this summarized requirement. |
| `/Users/subbums/.agents/skills/skill-writer/SKILL.md` | Workflow authority | High | Required synthesis, authoring, description optimization, registration, validation, `SPEC.md`, and source capture. | Runtime skill should not depend on host-specific absolute paths. |
| `skill-writer/references/mode-selection.md` | Workflow authority | High | Selected new-skill path: synthesis + authoring + description optimization + registration/validation. | Report class, shape, coverage, gaps. |
| `skill-writer/references/execution-shapes.md` | Workflow authority | High | Selected `inline-guidance` with small prompt-level routing; rejected scripts, refs, and provider-specific mechanics for initial version. | Keep simplest adequate shape. |
| `skill-writer/references/layout-inline-skill.md` | Layout authority | High | Kept runtime instructions in one coherent `SKILL.md`. | Add references later only for real lookup branches. |
| `skill-writer/references/workflow-routing.md` | Workflow authority | Medium | Added route table for concise, briefing, refresh, comparison, and ambiguous requests. | Routing stays prompt-level, not file-based. |
| `skill-writer/references/output-contracts.md` | Output authority | High | Used flexible templates instead of strict schemas. | Do not force every section for short answers. |
| `skill-writer/references/authoring-path.md` and `reference-architecture.md` | Authoring authority | High | Added compact `SPEC.md` and `SOURCES.md`; kept provenance out of runtime. | Every added file needs a clear purpose. |
| Existing repo `README.md` and `skills/letmecode/SKILL.md` | Repo convention | High | Confirmed canonical repository layout under `skills/<name>/SKILL.md` and README skill table. | Existing skill uses extra frontmatter, but new skill stays portable with `name` and `description`. |

## Synthesis Decisions

| Decision | Status | Rationale |
| --- | --- | --- |
| Name the skill `expert-lens`. | Adopted | User approved; short and broad enough for software and non-software domains. |
| Classify as `generic` with explicit dimensions. | Adopted | It covers many topics and domains, not one integration/API surface. |
| Use primary shape `inline-guidance`. | Adopted | One compact set of instructions covers most invocations. |
| Add prompt-level routing. | Adopted | Response shape must vary by narrow answer, deep briefing, refresh, and comparison. |
| Add reference files for domain-specific expert packs. | Deferred | No stable domain corpus exists yet; premature references would be vague. |
| Add scripts or deterministic validators. | Rejected | The skill changes answer framing, not a repeatable file/API operation. |
| Use provider-specific mechanics. | Rejected | The skill should stay portable. |
| Keep `agents/openai.yaml`. | Adopted | The initializer created UI metadata and it is useful; runtime remains portable. |

## Coverage Matrix

| Dimension | Coverage | Status |
| --- | --- | --- |
| Learning new topic | Route table and expert checklist | Covered |
| Refresh prior knowledge | Dedicated refresh route | Covered |
| Short practical answer | Concise output pattern | Covered |
| Deep expert briefing | Briefing output pattern | Covered |
| Current trends | Source posture requires search for active/version-sensitive topics | Covered |
| Source confidence | Source posture labels official, maintainer, practitioner, codebase, and anecdotal sources | Covered |
| Software depth | Software bias section lists architecture, testing, runtime, security, upgrades, and mature codebase signals | Covered |
| Non-software support | Non-software caution rule | Covered |
| False positives | Should-not-trigger set below | Covered |
| Provider portability | No provider-specific runtime mechanics | Covered |

## Description Optimization

Final description:

> Adds practitioner-grade context to learning, relearning, exploration, and explanation requests. Use when the user asks to learn, refresh, explore, compare, or understand a technical/software topic, tool, library, framework, architecture, or domain beyond surface-level docs; also use for non-software topics where expert tacit knowledge, gotchas, field norms, tradeoffs, or current trends matter.

Should trigger:
- "Teach me Rails beyond the docs."
- "I worked with Rails years ago; refresh me on what matters now."
- "Explain Kafka like a production engineer."
- "What are the gotchas with Kubernetes?"
- "Compare Postgres and MongoDB from a real-world architecture perspective."
- "What should I know about product strategy beyond generic advice?"

Should not trigger:
- "What is the syntax for a Ruby hash?"
- "Fix this failing unit test."
- "Implement this React component."
- "What is the current time?"
- "Summarize this file without extra context."
- "Give me the official API parameters only."

Optimization summary:
- Front-loaded practitioner-grade context to improve recall for broad learning prompts.
- Included concrete trigger verbs: learn, refresh, explore, compare, understand.
- Kept technical/software terms explicit while allowing non-software expert tacit knowledge.
- Excluded implementation-specific internals from the description.

## Precision Pass

| Item | Result |
| --- | --- |
| Behavior delta | Add expert/practitioner framing as the default response mode for learning and exploration. |
| Existing rule replaced | Initial template placeholders in `SKILL.md` were replaced. |
| Content moved out of runtime | Provenance, rationale, coverage, and maintenance details moved to `SOURCES.md` and `SPEC.md`. |
| New artifacts | `SPEC.md` added for maintenance contract; `SOURCES.md` added for synthesis provenance. |
| Simpler shapes rejected | None simpler than inline guidance; references/scripts/provider mechanics rejected. |

## Retrieval Stopping Rationale

The available sources cover user requirements, local skill-authoring rules, repository conventions, and validator expectations. Further external research is low-yield because this skill does not encode domain-specific expert facts; it defines a reusable answering posture and source strategy.

## Open Gaps

- No real-world answer examples have been collected yet.
- No holdout prompt set beyond the initial trigger review exists.
- Domain-specific expert reference packs may be useful later if repeated usage reveals stable needs.
