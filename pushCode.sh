#! /bin/sh
git pull
git add .

commitMessage=$1

while [ -z "$commitMessage" ]
do
    echo 'Provide a commit message'
    read -r -p $'Commit message:' commitMessage1
    commitMessage=$commitMessage1
done

git commit -m "$commitMessage"

git push