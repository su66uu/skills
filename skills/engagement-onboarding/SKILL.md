---
name: engagement-onboarding
description: Progressively discover and configure one active client engagement for a local, read-only work advisor. Use when starting with a new client, resuming incomplete workspace onboarding, validating newly granted Jira, Confluence, GitHub, or repository access, changing client identity, or reviewing whether the advisor setup is safely read-only.
---

# Engagement Onboarding

Set up one active client engagement without assuming that all access, repositories, or conventions are available on day one. Reuse the client's existing `AGENTS.md`, MCP, GitHub CLI, and workspace configuration.

## Non-negotiable boundary

Operate as a local, read-only advisor.

- Read external systems only. Never update Jira or Confluence; never comment, review, approve, merge, push, trigger workflows, or send messages.
- Never modify a client repository, including configuration, branches, or generated files.
- Do not test safety by attempting a write.
- Do not request, display, copy, or store passwords, tokens, cookies, or private keys.
- Treat available tools as capabilities, not permission. Do not call a mutating tool merely because it is exposed.
- Store only identifiers, preferences, access states, and timestamps. Do not cache ticket bodies, comments, documents, diffs, or other client content in the profile.
- Keep the profile in the active coding agent's configuration directory, outside client repositories and source control. Before first persistence, confirm the local path with the user.
- If strict read-only enforcement cannot be verified, say so. Distinguish a hard restriction from an instruction that relies on agent compliance.

## Onboarding model

Treat onboarding as progressive and resumable. A partial profile is useful.

Use these states for each capability:

- `confirmed`: the user confirmed it.
- `discovered`: found through a read-only check but not yet confirmed.
- `pending`: expected but access or information is not available yet.
- `unavailable`: intentionally absent or denied.
- `unknown`: not investigated yet.

Never mark the whole onboarding blocked merely because one system is pending.

## Profile location

Store profiles under the active coding agent, not in a shared cross-agent directory:

- Claude Code: `~/.claude/engagements/<client-slug>.yaml`
- Codex: `$CODEX_HOME/engagements/<client-slug>.yaml` when `CODEX_HOME` is set, otherwise `~/.codex/engagements/<client-slug>.yaml`
- Other agents: use that agent's established user configuration directory. If it cannot be determined confidently, ask the user to confirm it.

Do not infer the active agent merely from directories present on disk. Do not copy, move, or synchronize profiles between agents automatically. Record the runtime in the profile because available tools and enforcement can differ by agent.

Use a filesystem-safe, lowercase client slug. Restrict the `engagements` directory to the user (`0700`) and profile to the user (`0600`) where supported.

## Workflow

### 1. Resume before creating

Determine the active coding agent, then look only in its `engagements` directory or at a path the user explicitly supplied. Do not search the home directory broadly.

- If the client is known and its profile exists, read it and preserve confirmed values.
- If exactly one profile exists, offer to resume it.
- If multiple profiles exist, ask the user which engagement is active before reading their contents.
- If no profile exists, start a new provisional profile.

Do not overwrite the active engagement or archive an old one without explicit confirmation.

If no profile exists, start with the minimum facts:

1. Client or engagement name.
2. The name and email identity used with this client, if already known.
3. Any system the user knows is currently accessible.

Ask only for facts that cannot be discovered safely. Ask a small batch of related questions, then continue discovery.

### 2. Discover locally first

Use non-mutating checks to inventory what is already configured:

- Current workspace and Git repository, if any.
- Git remotes and locally configured author identity.
- Applicable `AGENTS.md` files and their scope.
- Configured MCP server names and exposed read/write capabilities.
- GitHub CLI availability and authenticated identity.
- Available local notification mechanisms.

Do not install, authenticate, reconfigure, or repair anything during onboarding. Report those as follow-up actions for the user.

### 3. Discover connected systems narrowly

Use the smallest metadata request that answers the question.

For Jira and Confluence:

- Identify the accessible site and current account.
- Discover candidate boards only when the primary board is unknown.
- Inspect board names and column mappings, not ticket descriptions or entire backlogs.
- Record allowed or relevant Confluence spaces only after they become known through actual work or user confirmation.

For GitHub and repositories:

- Identify the authenticated account and current repository or organization when available.
- Do not enumerate every accessible repository by default.
- Learn repository mappings from the user's selected tickets, linked PRs, the current workspace, or explicit confirmation.
- Record expected repositories as `pending` when access has not arrived.

Prefer existing client-provided integrations. Do not create alternative MCP or credential configuration unless the user separately requests implementation work.

### 4. Validate identity and safety

Present discovered identities for confirmation. Flag mismatches between the client email, Jira account, GitHub account, Git author, site, organization, and repository remote.

Build a capability report containing:

- What can be read now.
- What remains pending.
- Which write-capable tools or credentials are exposed.
- Which restrictions are technically enforced.
- Which restrictions currently rely only on instructions.

Never claim that a connector or CLI is read-only solely because this skill promises not to write.

### 5. Confirm daily-advisor preferences when relevant

Collect preferences only as they become useful:

- Primary Jira board.
- Board columns for the morning scan, defaulting to the board's To Do and In Progress equivalents.
- Whether to include unassigned tickets; default to false.
- Morning ticket limit; default to 15.
- Relevant repositories and Confluence spaces as they are discovered.
- Local notification channel and monitoring frequency.
- Local profile and transient-cache retention.

Do not fetch ticket bodies, comments, Confluence content, PR diffs, or code during onboarding unless needed to resolve a user-selected mapping.

### 6. Preview before persistence

Show the proposed profile and ask the user to confirm corrections and the storage path. Use a compact YAML shape like:

```yaml
engagement:
  client: Example Client
  status: onboarding

identity:
  preferred_name: Venkat
  email: venkat@example.com

jira:
  site: example.atlassian.net
  board_id: unknown
  included_columns: []
  morning_ticket_limit: 15
  status: discovered

confluence:
  allowed_spaces: []
  status: pending

github:
  account: unknown
  organization: unknown
  repositories: []
  status: pending

advisor:
  runtime: claude-code
  profile_version: 1
  notification_channel: unknown
  cache_retention_days: unknown
```

Omit unavailable sections when that is clearer. Do not invent placeholder identifiers.

After confirmation, persist the profile under the active agent's `engagements` directory using restrictive file permissions. Do not add it to Git or share it with another agent automatically.

### 7. Finish with readiness, not ceremony

Return:

1. A concise readiness checklist.
2. Capabilities available to the daily advisor now.
3. Pending access or decisions.
4. Read-only enforcement warnings.
5. The single most useful next action.

When new access arrives, resume from the saved profile, re-check only the affected capability, and request confirmation before changing previously confirmed mappings.

## Decision rules

- Prefer discovery over questions, and confirmation over re-entry.
- Prefer narrow metadata calls over broad searches.
- Do not require a full repository inventory.
- Do not make onboarding wait for GitHub or Confluence when Jira-only assistance is already possible.
- Draft access-request text when useful, but never send it.
- Surface uncertainty explicitly; do not infer identity or repository ownership from weak signals.
