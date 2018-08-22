#!/bin/bash

hugo -D

cd public

git add -A
git commit -m "Website data update $(date +%d.%m.%Y@%H.%M)"
git push

cd ..
