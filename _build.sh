#!/bin/bash
rm -rf _book/ _main*md \
&& git worktree add _book gh-pages \
&& R -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'
