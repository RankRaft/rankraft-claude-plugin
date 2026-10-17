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

## Licence

MIT

---

RankRaft AI - [rankraft.ai](https://rankraft.ai) · [docs.rankraft.ai](https://docs.rankraft.ai) · hello@rankraft.ai
