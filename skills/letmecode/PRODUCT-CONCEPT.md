# Developer Growth Companion

Status: Early product concept

Origin: The `letmecode` skill

Working title: Developer Growth Companion

## Product Thesis

Most coding agents are optimized for task completion: understand the request, produce a solution, and edit the files.

This product would instead be optimized for developer growth while completing real work. It would help a developer think, decide, debug, and learn without quietly taking ownership of the reasoning process.

The central principle is:

> The developer owns the reasoning and the code. The product controls the difficulty and supplies support only as needed.

The product is not valuable because it can generate more code. Existing coding agents already do that well. Its distinctive value is knowing:

- what help to withhold;
- which question to ask;
- when to provide a hint;
- when direct assistance is appropriate; and
- when the developer is ready for greater independence.

## Problem

A coaching agent can preserve the user's keystrokes while still taking over the important thinking.

If the agent identifies the next step, chooses the architecture, explains the tradeoff, provides pseudocode, and evaluates the result, the developer may become a transcription layer. They write the code, but the agent performs most of the cognitive work.

This creates the appearance of active learning without necessarily developing independent judgment.

The product must therefore protect productive cognitive work, not merely prevent the agent from editing files.

## Product Shape

The initial product idea is an IDE-native companion, with Neovim as a natural first environment.

It should behave like a quiet senior engineer sitting nearby:

- aware of the relevant working context;
- attentive without being intrusive;
- willing to ask before telling;
- able to recognize when the developer is stuck;
- capable of giving direct help when speed genuinely matters; and
- increasingly quiet as the developer becomes more capable.

An IDE integration can observe useful signals such as:

- file navigation and editing activity;
- repeated changes to the same code;
- diagnostics and compiler errors;
- test commands and results;
- diffs and completed implementation units;
- debugging activity; and
- pauses that may indicate uncertainty.

These signals should inform assistance, not trigger constant interruptions.

## Assistance Ladder

Help should be progressively disclosed:

1. A question that helps the developer reason.
2. A small conceptual hint.
3. A pointer to a relevant file, API, or piece of documentation.
4. A more concrete explanation of the tradeoff.
5. Pseudocode or a partial example.
6. A direct answer or complete code.

The developer should be able to choose the level of assistance. Direct answers remain available because sometimes shipping is more important than learning, but they should not be the default.

An example interaction:

```text
You have changed this function three times.

Want:
[q] a question to help reason through it
[h] a small hint
[d] relevant documentation
[r] a review of your current approach
[a] the answer
```

## Interaction Principles

### Ask Before Deciding

Before offering a design or solution, ask the developer to state their current understanding, hypothesis, or proposed approach.

The developer should make the next meaningful decision before the product supplies its own decision.

### Protect Productive Struggle

The product should distinguish productive struggle from wasted struggle.

Productive struggle includes:

- decomposing a problem;
- forming and testing a hypothesis;
- choosing an abstraction;
- reasoning about state and data flow;
- comparing architectural tradeoffs; and
- predicting program behavior.

Wasted struggle often includes:

- recalling obscure syntax;
- locating an unfamiliar API;
- interpreting opaque tool output;
- finding the relevant file in a large repository; and
- dealing with incidental environment friction.

The product should preserve the former and readily reduce the latter.

### Remain Interruptible, Not Intrusive

The companion should primarily respond when invited. Proactive interventions should be rare, relevant, and easy to dismiss.

It should not turn ordinary development into a continuous sequence of quizzes.

### Preserve an Escape Hatch

The developer must always be able to request the answer, enable a speed-oriented mode, or hand the task to a conventional coding agent.

Choosing speed should be treated as a legitimate decision, not a failure to learn.

## Possible Modes

### Explore

The developer forms hypotheses, compares alternatives, and explains their reasoning. The product mainly asks questions and surfaces relevant context.

### Build

The product provides modest guidance while leaving decomposition and design decisions with the developer.

### Debug

The developer forms one hypothesis at a time and chooses how to test it. The product helps interpret evidence without prematurely supplying the fix.

### Review

The product evaluates a completed unit of work for correctness, maintainability, safety, and gaps, then helps the developer decide what to improve.

### Ship

The product prioritizes completion speed and permits direct answers, code generation, or a handoff to a task-completion agent.

## Personalization

The deeper opportunity is to model the developer as well as the repository.

Over time, the companion could learn:

- concepts the developer already understands;
- recurring blind spots;
- where hints are usually sufficient;
- where direct explanations are still useful;
- which kinds of mistakes repeat; and
- when previously supplied scaffolding can be removed.

For example:

> You understand Rails controllers, but transaction boundaries have caused trouble before. I will ask you to reason through this boundary before offering a recommendation.

Personalization should produce greater independence, not deeper dependence on the product.

## Product Metaphor

This is a development gym embedded in the real workplace.

The developer works on genuine code rather than artificial exercises. The product introduces appropriate resistance, provides spotting when needed, and gradually removes scaffolding as competence grows.

## Non-Goals

At least initially, the product is not:

- another autocomplete engine;
- a conventional autonomous coding agent;
- a replacement for documentation;
- a course or fixed curriculum;
- an always-on reviewer that comments on every edit; or
- a system that withholds urgent help to enforce learning.

## Risks

### Excessive Interruption

Poorly timed questions could break flow and make the product irritating rather than useful.

### Performative Socratic Coaching

Questions can become artificial rituals when the product already intends to steer the developer toward one predetermined answer.

### Incorrect Inference

Pauses and repeated edits do not always mean confusion. The developer may be exploring deliberately or handling an interruption outside the IDE.

### Dependence Disguised as Learning

Even hints can become a dependency if the product always performs decomposition and selects the next decision.

### Surveillance and Privacy

A personalized developer model and detailed activity history require careful boundaries, transparency, local-first options, and user control over retention.

### Measuring the Wrong Outcome

Lines of code, task speed, and suggestion acceptance do not demonstrate learning. The product needs measures related to decreasing assistance and increasing independent judgment.

## Early Success Signals

Potential signals worth validating include:

- the developer requests less help on repeated concepts;
- the developer can explain and defend decisions before receiving guidance;
- hints increasingly replace full answers;
- similar future tasks are completed with less intervention;
- the developer catches previously recurring mistakes independently;
- interruptions are infrequent and usually accepted as useful; and
- using the product does not substantially prevent real work from shipping.

## Open Questions

- Is Neovim the right first interface, or merely the best environment for early experimentation?
- Should the product be a standalone application, an editor plugin, or a protocol that multiple editors can implement?
- Which observations may be collected locally, and which—if any—may leave the machine?
- How should the product decide that an intervention is warranted?
- How can it measure understanding without turning development into an examination?
- What is the minimum useful persistent learner model?
- How should learning mode and shipping mode interact?
- When should the product recommend handing work to an autonomous agent?
- Can the assistance ladder work reliably across different experience levels and programming domains?
- Which behavior from the existing `letmecode` skill should be retained, changed, or discarded?

## Relationship to `letmecode`

The `letmecode` skill is the conceptual starting point and a useful environment for testing coaching behavior.

Its current safeguard—that the developer writes the code—is necessary but insufficient. Future experiments should also protect ownership of:

- problem decomposition;
- hypothesis formation;
- architectural decisions;
- tradeoff analysis; and
- selection of the next meaningful step.

Insights from those experiments may inform this product, but the product should not be constrained to remain a prompt-level skill.

## Current Decision

Preserve this as a product concept rather than a PRD.

A PRD should follow only after we choose an initial user, workflow, interface, and validation approach. Until then, this document records the product philosophy and the questions that should guide discovery.
