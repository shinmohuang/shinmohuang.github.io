"""Fetch Google Scholar profile data via SerpAPI's google_scholar_author engine.

Writes results/gs_data.json (same shape the site's JS expects: `citedby` and
`publications[<author_pub_id>].num_citations`) and results/gs_data_shieldsio.json.

Env:
  SERPAPI_KEY        SerpAPI key (required)
  GOOGLE_SCHOLAR_ID  Scholar profile id, e.g. mhRHe4oAAAAJ (required)
"""
import json
import os
import urllib.parse
import urllib.request
from datetime import datetime, timezone

API = "https://serpapi.com/search.json"
PAGE_SIZE = 100


def fetch(params):
    url = API + "?" + urllib.parse.urlencode(params)
    with urllib.request.urlopen(url, timeout=60) as resp:
        data = json.load(resp)
    if "error" in data:
        raise SystemExit(f"SerpAPI error: {data['error']}")
    return data


def stat(table, key):
    for row in table:
        if key in row:
            return row[key].get("all", 0)
    return 0


def main():
    base = {
        "engine": "google_scholar_author",
        "author_id": os.environ["GOOGLE_SCHOLAR_ID"],
        "api_key": os.environ["SERPAPI_KEY"],
        "hl": "en",
        "num": PAGE_SIZE,
    }

    first = fetch(base)
    articles = list(first.get("articles", []))
    start = PAGE_SIZE
    while len(articles) == start:  # profile has more than one page
        page = fetch({**base, "start": start}).get("articles", [])
        if not page:
            break
        articles += page
        start += PAGE_SIZE

    profile = first.get("author", {})
    cited_by = first.get("cited_by", {})
    table = cited_by.get("table", [])

    publications = {}
    for a in articles:
        pub_id = a.get("citation_id")
        if not pub_id:
            continue
        publications[pub_id] = {
            "author_pub_id": pub_id,
            "title": a.get("title"),
            "authors": a.get("authors"),
            "venue": a.get("publication"),
            "year": a.get("year"),
            "link": a.get("link"),
            "num_citations": (a.get("cited_by") or {}).get("value") or 0,
        }

    author = {
        "scholar_id": base["author_id"],
        "name": profile.get("name"),
        "affiliation": profile.get("affiliations"),
        "citedby": stat(table, "citations"),
        "hindex": stat(table, "h_index"),
        "i10index": stat(table, "i10_index"),
        "cites_per_year": {str(g["year"]): g["citations"] for g in cited_by.get("graph", [])},
        "publications": publications,
        "updated": datetime.now(timezone.utc).isoformat(timespec="seconds"),
    }

    os.makedirs("results", exist_ok=True)
    with open("results/gs_data.json", "w") as f:
        json.dump(author, f, ensure_ascii=False, indent=2)
    with open("results/gs_data_shieldsio.json", "w") as f:
        json.dump(
            {"schemaVersion": 1, "label": "citations", "message": str(author["citedby"])},
            f,
            ensure_ascii=False,
        )
    print(f"{author['name']}: {author['citedby']} citations, {len(publications)} publications")


if __name__ == "__main__":
    main()
