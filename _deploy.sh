#!/bin/sh

# make sure you're on the gh-pages branch
# delete everything (replace old site) and copy _book from master
# copy book directory to gh-pages
# empty _book into parent, delete _book
# site will be public so dissuade robots and search engines from crawling your page
# commit
git checkout master \
&& git stash save \
&& git checkout gh-pages \
&& git rm -rf . \
&& git checkout master -- _book \
&& git stash apply \
&& mv _book/* . && rm -rf _book \
&& echo -e "User-agent: *\nDisallow: /" > robots.txt \
&& git add -u && git reset .Rproj.user \
&& git -c user.email="brooksambrose-machine@gmail.com" commit --allow-empty -m "deploy $(date +'%Y-%m-%d %H:%M:%S')" || true \
&& echo 'Ready to push.'
