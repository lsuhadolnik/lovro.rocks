#!/bin/bash

hugo

echo -n "Enter the comment, if you want: "
read cmt

if [[ -z "$cmt" ]]; then

	cmt="Website data update $(date +%d.%m.%Y@%H.%M)"
	
fi;

git add -A
git commit -m "$cmt"
git push github master

cd themes/hugo-paper
git add -A
git commit -m "$cmt"
git push origin master

cd ../../public

git add -A
git commit -m "$cmt"
git push

cd ..
