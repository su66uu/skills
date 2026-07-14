# Expert Lens Specification

## Intent

Help agents answer learning, relearning, exploration, comparison, and explanation requests with practitioner-grade context instead of only official-doc or generic summary material.

The skill should make tacit expertise visible: mental models, gotchas, production patterns, ecosystem shifts, tradeoffs, and the questions experienced people ask.

## Scope

In scope:
- Software and technical topics as the primary use case.
- Non-software domains where expert tacit knowledge, field norms, or practitioner tradeoffs matter.
- Short practical answers and deeper expert briefings.
- Current-aware answers when trends, versions, libraries, frameworks, or ecosystem state matter.

Out of scope:
- Replacing official docs for exact API contracts.
- Presenting anecdotal community opinion as consensus.
- High-stakes professional advice without uncertainty and source confidence.
- Long learning curricula unless the user asks for a learning plan.

## Users And Trigger Context

- Primary users: people learning a new topic, returning to a topic after time away, or asking for expert context beyond surface-level docs.
- Common user requests: "teach me Rails", "refresh me on Kubernetes", "what do experts know about Kafka?", "what changed in React?", "explain Postgres like a production engineer".
- Should not trigger for: simple factual lookup, pure coding implementation, ordinary debugging, or requests where the user only wants exact docs/API syntax.

## Runtime Contract

- Required first action: frame the answer from the expert lens before generic explanation.
- Required outputs: adapt between concise answer, expert briefing, refresh, or comparison based on user intent.
- Non-negotiable constraints: label uncertainty and source posture; browse/search for latest or version-sensitive claims when available and necessary.
- Expected bundled files loaded at runtime: `SKILL.md` only.

## Source And Evidence Model

Authoritative sources:
- User requirements captured during creation.
- Local skill-writer workflow references and validation rules.
- Existing repository layout and skill conventions.

Useful improvement sources:
- positive examples: answers that reveal tacit knowledge without overwhelming the user.
- negative examples: generic docs summaries that miss practitioner context.
- commit logs/changelogs: changes to trigger wording, output shape, and browsing posture.
- issue or PR feedback: false positives, false negatives, overlong answers, weak sourcing.
- validation results: structural validation and trigger review.

Data that must not be stored:
- secrets
- private customer data
- private URLs or identifiers not needed for reproduction

## Reference Architecture

- `SKILL.md` contains the runtime router, checklist, source posture, and output patterns.
- `SPEC.md` contains intent, scope, trigger context, evidence model, and maintenance rules.
- `SOURCES.md` contains provenance, decisions, coverage matrix, trigger tests, and gaps.
- `references/`, `scripts/`, and `assets/` are not used in the initial version.

## Validation

- Lightweight validation: run the skill validator against `skills/expert-lens`.
- Deeper validation: test should-trigger and should-not-trigger prompts after meaningful wording changes.
- Holdout examples: keep future positive and negative examples in `references/evidence/` only if iteration evidence becomes substantial.
- Acceptance gates: frontmatter is valid, README registration is current, runtime instructions are compact, and every added file has a clear purpose.

## Known Limitations

- The skill cannot guarantee access to current web sources in every runtime.
- Non-software expert context can be subjective; answers must label confidence.
- The first version has no domain-specific reference packs.

## Maintenance Notes

- Update `SKILL.md` when runtime behavior, trigger scope, source posture, or output shape changes.
- Update `SOURCES.md` when adding evidence, changing major decisions, or recording validation outcomes.
- Add `references/evidence/` only after real usage produces reusable examples worth preserving.
