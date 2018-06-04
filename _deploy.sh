#!/bin/sh

# make sure you're on the gh-pages branch
git checkout gh-pages \
# delete everything (replace old site) and copy _book from master
&& rm -rf * \
# copy book directory to gh-pages
&& git checkout master -- _book \
# empty _book into parent, delete _book
&& mv _book/* . && rm -rf _book \
# site will be public so dissuade robots and search engines from crawling your page
&& echo -e "User-agent: *\nDisallow: /" > robots.txt \
# commit
&& git add . \
&& git -c user.email="brooksambrose-machine@gmail.com" commit --allow-empty -m "deploy $(date +'%Y-%m-%d %H:%M:%S')" || true \
&& echo 'Ready to push.'
