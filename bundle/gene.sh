#!/bin/sh
for file in `ls -1`; do
    if [[ -d "$file" ]]; then
        cd $file || continue
        git remote show -n origin | grep Fetch | grep -o 'https.*$'
        cd -
    fi
done

# sh gene.sh | grep ".git" | xargs -i git submodule add -f {}
