#!/bin/sh

# make sure you're on the master branch
# site will be public so dissuade robots and search engines from crawling your page
# add _book as worktree of gh-pages
# descend into _book and add changes
# commit
# force push worktree
# return to start
git checkout master \
&& echo -e "User-agent: *\nDisallow: /" > _book/robots.txt \
&& cd _book && git add . && git status \
&& git -c user.email="brooksambrose-machine@gmail.com" commit --allow-empty -m "deploy $(git log '--format=format:%h' master -1)" \
&& git push origin gh-pages --force \
&& cd ..
