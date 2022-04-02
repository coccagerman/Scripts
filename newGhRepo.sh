#! /bin/sh
repoName=$1

while [ -z "$repoName" ]
do
    echo 'Provide a repository name'
    read -r -p $'Repository name:' repoName
    # repoName=$repoName1
done

echo "# $repoName" >> README.md
git init
git config user.email "coccagerman@gmail.com"
git add .
git commit -m "Creating remote repo"

curl -u coccagerman https://api.github.com/user/repos -d '{"name": "'"$repoName"'", "private":false}'

GIT_URL=$(curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/coccagerman/"$repoName" | jq -r '.clone_url')

git branch -M main
git remote add origin $GIT_URL
git push -u origin main