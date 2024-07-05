cd /fsx-storygen/beidic/yang/submitwithcron5 
git checkout --orphan temp_branch 
git add -A
git commit -am "Initial commit"
git branch -D main
git branch -m main
git push -f origin main
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
git reflog expire --expire=now --all
git gc --aggressive --prune=now
