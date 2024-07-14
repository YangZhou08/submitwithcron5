cd /data/home/beidic/hanshi/Rhodonite-Archive/
rm .git/gc.log
git prune
rm -f .git/index.lock
git status
git add -A
git commit -m "fix"
git pull --rebase origin main
git push origin main
