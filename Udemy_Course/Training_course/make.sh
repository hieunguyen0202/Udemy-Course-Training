#! /usr/bin/bash
git checkout -b new-branch-1
touch test6.txt
git add .
git commit -m "Update 1"
git checkout main
touch test7.txt
git add .
git commit -m "Update 2"
git checkout new-branch-1
git rebase main
git checkout main
git merge new-branch-1
git branch -d new-branch-1
git push origin main

