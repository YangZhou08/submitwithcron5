cd /data/home/beidic/hanshi/Rhodonite-Archive/
rm .git/gc.log
git prune
rm -f .git/index.lock
git pull --rebase origin main
git push origin main
