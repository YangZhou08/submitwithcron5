cd /data/home/beidic/hanshi/Rhodonite-Archive/
rm .git/index.lock
echo "Removed .git/index.lock"
git symbolic-ref HEAD refs/heads/main
git fetch origin
git add -A
git commit -m "fix: resolved issues and added latest files"
git push origin main
git status
