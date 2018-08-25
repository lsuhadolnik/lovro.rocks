#!/bin/bash

hugo

git add -A
git commit -m "Website data update $(date +%d.%m.%Y@%H.%M)"
git push github master

cd public

git add -A
git commit -m "Website data update $(date +%d.%m.%Y@%H.%M)"
git push

cd ..
