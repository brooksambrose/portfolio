# CHECK
# resources currently being ignored
git status -s && git check-ignore -v * && git add $(read -er -p "Need to add anything?: " UI && echo $UI) \
&& git commit -m"w$(date +'%V %a %p') $(read -r -p 'Explain this commit: ' UI && echo $UI)" && git fetch
read -n1 -p "Ready to rebase?" doit 
case $doit in  
  y|Y) git rebase -i $(log -1 --reverse --pretty=format:"%h" origin/draft..draft) ;; 
esac
