source "https://rubygems.org"

# This site builds with modern Jekyll (not the legacy github-pages gem) and
# deploys via GitHub Actions. Run locally with:
#
#     bundle exec jekyll serve
#
gem "jekyll", "~> 4.3"

# webrick is no longer bundled with Ruby 3+, but `jekyll serve` needs it.
gem "webrick", "~> 1.8"

gem "csv"
gem "bigdecimal"
gem "wdm", "~> 0.1.0" if Gem.win_platform?

# Site plugins
group :jekyll_plugins do
  gem "jekyll-paginate"
  gem "jekyll-sitemap"
  gem "jekyll-gist"
  gem "jekyll-feed"
  gem "jekyll-redirect-from"
  gem "jemoji"
end
