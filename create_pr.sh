#!/usr/bin/env bash

NUMBER="$RANDOM"

git stash
git checkout main
git pull

git checkout -b "feature/$NUMBER"

mkdir -p dummy_files
touch "dummy_files/dummy$NUMBER"

git add "dummy_files/dummy$NUMBER"
git commit -m "Dummy commit $NUMBER"

git push --set-upstream origin "feature/$NUMBER"

gh pr create --base main --head "feature/$NUMBER" --title "Feature $NUMBER" --body "Adding dummy$NUMBER file"

git checkout main
git branch -D "feature/$NUMBER"