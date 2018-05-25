#!/bin/sh

# put your info here and uncomment so git (and GitHub) knows who your commits belong to!
# git config user.email "calnet@berkeley.edu"
# git config user.name "Oski Bear"

# make sure you're on the master branch
git checkout master

# assuming you've already built it, replace old docs with new _books build
rm -rf docs/ \
&& mv -u -T _book/ docs/

# site will be public so dissuade robots and search engines from crawling your page
echo "User-agent: *
Disallow: /" > docs/robots.txt

# push
git add . \
&& git -c user.email="brooksambrose@gmail.com" commit --allow-empty -m "deploy" || true \
&& echo 'Ready to push.'
