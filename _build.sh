#!/bin/bash
git worktree add _book gh-pages || true \
&& rm -rf .RData _book/* _bookdown_files _main*md \
&& R -e 'bookdown::render_book("index.Rmd", c("bookdown::pdf_book","bookdown::gitbook"))' \
&& mkdir -p _book/ldaviz/viz && cp -rf ldaviz/viz/*.* _book/ldaviz/viz/ \
&& mkdir -p _book/exh && cp -rf exh/* _book/exh/ \
&& cp -rf /usr/lib/R/site-library/crosstalk/www/* _book/exh/layouts_files/crosstalk-1.0.0 \
&& cp -Lrf /usr/lib/R/site-library/crosstalk/lib/jquery/jquery.min.js _book/exh/layouts_files/jquery-1.11.3/jquery.min.js

# && R -e 'bookdown::render_book("index.Rmd", "bookdown::pdf_book",clean=T)' \
#&& R -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")' \
# && R -e "rmarkdown::render_site(encoding = 'UTF-8')" \

# command to automatically detect branch and add to edit link
# $(git branch | grep * | cut -d ' ' -f2)

