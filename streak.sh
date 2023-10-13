#!/bin/bash

streak=$(cat readme.md | sed -n "2p" | grep -oE "[0-9]+")
validator=$(cat readme.md | sed -n "3p" | grep -oE "[0-9]+")
date=$(date +%d)
streak=$((streak+1))
messages="Saving $streak Streak Today"

if [[ -f .env ]];then
    source .env
    if [[ $date -ne $validator ]]; then
        sed -i "2s/.*/const [streak, setStreak] = useState($streak);/" readme.md
        sed -i "3s/.*/const date = $date;/" readme.md
        git add .
        git commit -m "$messages"
        git push https://$USERNAME:$PASSWORD@github.com/$USERNAME/streak.git
    else
        echo "Already Push today"
    fi
else
    echo -e "Set up your .env with :\nUSERNAME=YOUR_GITHUB_USERNAME\nPASSWORD=YOUR_GITHUB_PASSWORD"
fi


# if [[ $date -ne $validator ]]; then
#     sed -i "2s/.*/const [streak, setStreak] = useState($streak);/" readme.md
#     sed -i "3s/.*/const date = $date;/" readme.md
# fi


# echo $messages
# git add .
# git commit -m "$messages"
# git push