#!/usr/bin/env bash
# Vendor the skill from its own repo into skills/rankraft/.
#
# The skill lives at github.com/RankRaft/rankraft-skill so it can be copied
# into any agent; this plugin exists only so Claude Code users get a managed
# install. Nothing under skills/rankraft/ is edited here - change it upstream
# and run this. The skill-sync workflow runs it daily and opens a PR on drift.
set -euo pipefail

SRC="${RANKRAFT_SKILL_REPO:-https://github.com/RankRaft/rankraft-skill}"
REF="${RANKRAFT_SKILL_REF:-main}"
DEST="$(cd "$(dirname "$0")/.." && pwd)/skills/rankraft"

tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
if [ -d "$SRC" ]; then
  cp -r "$SRC"/. "$tmp/src"            # a local checkout, for development
else
  git clone -q --depth 1 --branch "$REF" "$SRC" "$tmp/src"
fi

rm -rf "$DEST"; mkdir -p "$DEST"
# Only the skill: SKILL.md, references/, scripts/. Not the upstream README,
# LICENSE or .git - those describe the repo, not the skill.
cp "$tmp/src/SKILL.md" "$DEST/"
cp -r "$tmp/src/references" "$DEST/"
cp -r "$tmp/src/scripts" "$DEST/"
(cd "$tmp/src" && git rev-parse --verify -q HEAD 2>/dev/null || echo "local") > "$DEST/.upstream-commit"

echo "sync-skill: vendored from $SRC@$REF ($(cat "$DEST/.upstream-commit" | cut -c1-12))"
