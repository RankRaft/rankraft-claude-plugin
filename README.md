<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset=".github/brand/rankraft-mark-dark-bg.svg">
    <img src=".github/brand/rankraft-mark-light-bg.svg" alt="RankRaft AI" width="72" height="72">
  </picture>
</p>

<h1 align="center">RankRaft AI for Claude Code</h1>

<p align="center">A managed install of the <a href="https://github.com/RankRaft/rankraft-skill">RankRaft AI skill</a>.</p>

<p align="center">
  <a href="https://rankraft.ai"><b>rankraft.ai</b></a> &nbsp;·&nbsp;
  <a href="https://docs.rankraft.ai">Docs</a> &nbsp;·&nbsp;
  <a href="https://app.rankraft.ai">Dashboard</a> &nbsp;·&nbsp;
  <a href="https://docs.rankraft.ai/api-reference/introduction">API reference</a>
</p>

```
/plugin marketplace add RankRaft/rankraft-claude-plugin
/plugin install rankraft@rankraft
```

Or from a shell: `claude plugin marketplace add RankRaft/rankraft-claude-plugin`
then `claude plugin install rankraft@rankraft`.

## This repo is a wrapper

The skill itself is authored in **RankRaft/rankraft-skill**, which is plain
Markdown that any agent can use. This repo adds only what Claude Code needs for
a managed install - `.claude-plugin/plugin.json` and a marketplace manifest - and vendors the skill under `skills/rankraft/`.

Do not edit anything under `skills/`. Change it upstream and run
`./scripts/sync-skill.sh`; CI fails if the vendored copy and upstream disagree,
and a daily workflow opens a PR when upstream moves.

## Also bundles the MCP connector

`.mcp.json` points Claude at `mcp.rankraft.ai`, the live, read-only MCP server
(every paid RankRaft AI plan). Installing this plugin gives you both: the skill
for writing code against the REST API (Enterprise, `rr_api_…` key), and this
connector for asking questions about your data directly in a chat - no API key
involved, you sign in with your RankRaft AI account through the server's own
OAuth flow when you connect it. See the skill's own "Decide first: REST or MCP?"
table for which one fits a given task.

## Licence

MIT

---

RankRaft AI - [rankraft.ai](https://rankraft.ai) · [docs.rankraft.ai](https://docs.rankraft.ai) · hello@rankraft.ai
