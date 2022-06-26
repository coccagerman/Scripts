#! /bin/sh
branchName=$1

while [ -z "$branchName" ]
do
    echo 'Provide a branch name'
    read -r -p $'Branch name:' branchName1
    branchName=$branchName1
done

git branch $branchName
git checkout $branchName
git push --set-upstream origin $branchName
git pull