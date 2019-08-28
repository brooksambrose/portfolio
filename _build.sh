#!/bin/bash
git worktree add _book gh-pages || true \
&& rm -rf .RData _book/* _bookdown_files _main*md \
&& R -e "rmarkdown::render_site(encoding = 'UTF-8')" \
&& mkdir -p _book/ldaviz/viz && cp -rf ldaviz/viz/*.* _book/ldaviz/viz/ \
&& mkdir -p _book/exh && cp -rf exh/* _book/exh/

# && R -e 'bookdown::render_book("index.Rmd", c("bookdown::pdf_book","bookdown::gitbook"))' \
# && R -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")' \
# && R -e 'bookdown::render_book("index.Rmd", "bookdown::pdf_book",clean=T)' \

# command to automatically detect branch and add to edit link
# $(git branch | grep * | cut -d ' ' -f2)
