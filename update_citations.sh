#!/usr/bin/env bash
#
# Refresh Google Scholar citation data and publish it to the
# `google-scholar-stats` branch.
#
# The CI workflow (.github/workflows/google_scholar_crawler.yaml) does this
# daily via SerpAPI. Run it locally for an immediate refresh:
#
#     SERPAPI_KEY=xxxx ./update_citations.sh
#
# Optionally override the Scholar profile id:
#
#     GOOGLE_SCHOLAR_ID=xxxx ./update_citations.sh
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

SCHOLAR_ID="${GOOGLE_SCHOLAR_ID:-mhRHe4oAAAAJ}"
ORIGIN_URL="$(git remote get-url origin)"
SLUG="$(echo "$ORIGIN_URL" | sed -E 's#.*github\.com[:/]##; s#\.git$##')"

: "${SERPAPI_KEY:?Set SERPAPI_KEY (https://serpapi.com/manage-api-key)}"

echo "==> Fetching citation data for Scholar id: $SCHOLAR_ID"
( cd google_scholar_crawler && GOOGLE_SCHOLAR_ID="$SCHOLAR_ID" python3 main.py >/dev/null )

read -r CITED NPUB < <(python3 - <<'PY'
import json
d = json.load(open('google_scholar_crawler/results/gs_data.json'))
print(d['citedby'], len(d['publications']))
PY
)
echo "    -> $CITED citations across $NPUB publications"

echo "==> Publishing to '$SLUG' branch google-scholar-stats"
pushd google_scholar_crawler/results >/dev/null
rm -rf .git
git init -q
git add gs_data.json gs_data_shieldsio.json
git -c user.name="citation-bot" -c user.email="noreply@local" \
    commit -qm "Refresh Google Scholar citation data ($(date -u +%Y-%m-%dT%H:%MZ))"
git push -q --force "$ORIGIN_URL" HEAD:google-scholar-stats
rm -rf .git
popd >/dev/null

echo "==> Purging jsDelivr CDN cache"
for f in gs_data.json gs_data_shieldsio.json; do
  if curl -fsS "https://purge.jsdelivr.net/gh/${SLUG}@google-scholar-stats/${f}" >/dev/null; then
    echo "    purged $f"
  else
    echo "    (purge request for $f failed; CDN will refresh on its own within ~12h)"
  fi
done

echo "==> Done. Citation badges will reflect the new data shortly."
