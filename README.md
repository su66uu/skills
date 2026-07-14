# Agent Skills

A collection of reusable agent skills.

Each skill lives in its own directory under `skills/` and follows the standard `skills/<name>/SKILL.md` layout used by the `skills` CLI.

## Skills

| Skill | Description |
| --- | --- |
| `expert-lens` | Adds practitioner-grade context, gotchas, trends, and expert mental models to learning and exploration requests. |
| `letmecode` | Guides a developer through coding tasks as a learning coach while the developer writes the code themselves. |

## Install

List available skills:

```bash
npx skills add su66uu/skills --list
```

Install all skills from this repository:

```bash
npx skills add su66uu/skills --skill '*'
```

Install one skill:

```bash
npx skills add su66uu/skills --skill expert-lens
```

Install one skill globally for Codex:

```bash
npx skills add su66uu/skills --skill expert-lens -g -a codex
```

Install one skill globally for Claude Code:

```bash
npx skills add su66uu/skills --skill expert-lens -g -a claude-code
```

## Local Install

From this repository checkout:

```bash
npx skills add . --list
```

Install all local skills:

```bash
npx skills add . --skill '*'
```

Install one local skill:

```bash
npx skills add . --skill expert-lens
```

## Repository Layout

```text
skills/
  <skill-name>/
    SKILL.md
```

Current layout:

```text
skills/
  expert-lens/
    agents/
      openai.yaml
    SKILL.md
    SPEC.md
    SOURCES.md
  letmecode/
    SKILL.md
```

## Adding a Skill

Create a new directory under `skills/`:

```text
skills/
  my-new-skill/
    SKILL.md
```

The `SKILL.md` frontmatter should include at least:

```markdown
---
name: my-new-skill
description: What this skill does and when an agent should use it.
---
```

Keep the `name` value aligned with the directory name.

## skills.sh

Installs through the `skills` CLI can make the repository and its skills appear on skills.sh:

```bash
npx skills add su66uu/skills --skill expert-lens
```

Do not disable telemetry if you want installs to count toward skills.sh discovery and ranking.
