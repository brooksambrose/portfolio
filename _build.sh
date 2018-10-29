#!/bin/bash
git worktree add _book gh-pages || true \
&& rm -rf .RData ._book/* _bookdown_files _main*md \
&& R -e "rmarkdown::render_site(encoding = 'UTF-8')"

# command to automatically detect branch and add to edit link
# $(git branch | grep * | cut -d ' ' -f2)
