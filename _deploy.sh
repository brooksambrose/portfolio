#!/bin/sh

# make sure you're on the gh-pages branch
# delete everything (replace old site) and copy _book from master
# copy book directory to gh-pages
# empty _book into parent, delete _book
# site will be public so dissuade robots and search engines from crawling your page
# commit
git checkout master \
&& echo -e "User-agent: *\nDisallow: /" > _book/robots.txt \
&& git add _book \
&& git -c user.email="brooksambrose-machine@gmail.com" commit --allow-empty -m "deploy $(date +'%Y-%m-%d %H:%M:%S')" || true \
&& git subtree push --prefix _book origin gh-pages
