#!/bin/sh

echo "1. checkout and clean gh-pages"
REPO=https://github.com/a11n/babbq-slides.git
BRANCH=gh-pages
FOLDER=$BRANCH

git clone -q $REPO --branch $BRANCH --single-branch $FOLDER
cd $FOLDER
git rm -rf . > /dev/null

echo "2. copy HTML and deploy"
cp -r ../ ./
git add .
git commit -m "Published slides." > /dev/null
git push -q

echo "3. clean up"
cd ..
rm -rf $FOLDER
