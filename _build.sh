#!/bin/bash
rm -rf _book/ _main*md \
&& R -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'
