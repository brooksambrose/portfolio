#!/bin/sh

# make sure you're on the master branch
# site will be public so dissuade robots and search engines from crawling your page
# add _book as worktree of gh-pages
# descend into _book and add changes
# commit
# force push worktree
# return to start

# run this once to have git store your password
# git config --global credential.helper cache

echo -e "User-agent: *\nDisallow: /" > _book/robots.txt \
&& cd _book && git add . && git status \
&& git -c user.email="brooksambrose@gmail.com" commit --allow-empty -m "deploy $(git log '--format=format:%h' draft -1)" \
&& git push origin gh-pages --force \
&& cd ..
