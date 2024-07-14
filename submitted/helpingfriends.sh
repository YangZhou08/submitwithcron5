#!/bin/bash
# Navigate to the repository directory
cd /data/home/beidic/hanshi/Rhodonite-Archive/
# Remove the index.lock file
if [ -f ".git/index.lock" ]; then
    rm .git/index.lock
    echo "Removed .git/index.lock"
fi
# Check if HEAD is corrupted and reset it
if [ ! -f ".git/HEAD" ]; then
    echo "HEAD reference is missing. Reinitializing HEAD."
    git symbolic-ref HEAD refs/heads/main
else
    git fsck --full
    if [ $? -ne 0 ]; then
        echo "HEAD is corrupted. Resetting HEAD to main branch."
        git symbolic-ref HEAD refs/heads/main
    fi
fi
# Fetch the latest changes from origin
git fetch origin
# Merge the latest changes from the remote main branch
git merge origin/main
# Add all changes
git add -A
# Commit the changes
git commit -m "fix: resolved issues and added latest files"
# Push the changes to the remote repository
git push origin main
# Check the status
git status
