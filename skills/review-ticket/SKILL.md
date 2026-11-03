---
name: review-ticket
description: Review a well-defined Jira ticket, issue, story, or implementation request before coding. Use when the user wants one consolidated critique of the ticket's necessity, assumptions, gaps, risks, edge cases, acceptance criteria, proposed solution, and meaningful alternatives without an interactive question-by-question interview or implementation.
---

# Review Ticket

Treat the ticket as a proposal to evaluate, not an instruction to execute. Return one complete review; do not conduct an interview.

## Gather Evidence

Read the full ticket, including acceptance criteria, comments, links, and material history when available. Inspect only the relevant code, tests, documentation, ADRs, related tickets, and prior changes needed to verify the proposal.

Separate:

- the problem and desired outcome;
- the proposed solution;
- confirmed constraints;
- assumptions and unresolved decisions;
- current system behavior.

Do not ask the user questions while investigating. If evidence is unavailable, continue with what is available and identify the limitation in the review.

## Evaluate

Check whether:

- the problem is real, current, and worth solving;
- the requested behavior already exists or conflicts with existing behavior;
- the proposed solution follows from the objective;
- a smaller change, existing capability, or no change would meet the objective;
- acceptance criteria cover observable success, failure paths, and important edge cases;
- security, privacy, data integrity, compatibility, migration, performance, observability, rollout, or operational risks are material;
- the approach fits current architecture and team conventions.

Challenge the ticket only when evidence or a meaningful tradeoff supports the concern. Do not invent objections, alternatives, or questions to make the review appear thorough.

## Return One Review

Use this structure:

### Verdict

Choose one: `ready`, `ready with assumptions`, `needs clarification`, or `reconsider`. Give the main reason in one or two sentences.

### Objective and proposal

State the problem being solved and distinguish it from the ticket's proposed implementation.

### Findings

List material findings in priority order. Label each `blocking`, `risk`, `gap`, `assumption`, or `conflict`, and include the evidence and why it matters. If none exist, say so.

### Alternatives

Include only credible alternatives with meaningful tradeoffs. Consider a smaller change, reuse of existing behavior, and doing nothing. Omit this section when the proposed approach is clearly best.

### Questions

List every unresolved question together, ordered by implementation impact. For each question, explain what its answer changes and give a recommended default when one is safe. Never ask these questions across multiple turns.

### Recommendation

Recommend the next action and state confidence plus anything that could not be verified. Do not implement, modify the ticket, or contact anyone.

Keep the report proportional to the ticket. Prefer a few evidence-backed findings over an exhaustive speculative checklist.
