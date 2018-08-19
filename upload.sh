#!/bin/bash

hugo

cd public

git add -A
git commit -m "Website data update $(date +%d.%m.%Y@%H.%M)"

cd ..
