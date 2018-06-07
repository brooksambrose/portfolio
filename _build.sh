#!/bin/bash
rm -rf _book/ _main*md \
&& git worktree add _book gh-pages || true \
&& R -e 'bookdown::render_book("index.Rmd","bookdown::pdf_book")' \
&& R -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'
