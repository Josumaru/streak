#!/bin/bash

line=$(grep -n "useState" readme.md | cut -d ":" -f 1)
streak=$(cat readme.md | sed -n "${line}p" | grep -oE "[0-9]+")
validator=$(cat readme.md | sed -n "$((line+1))p" | grep -oE "[0-9]+")
day=$(date +%d)
streak=$((streak+1))
messages="Saving $streak Streak Today"

if [[ -f .env ]]; then
    source .env
    if [[ $day -ne $validator ]]; then
        sed -i "${line}s/.*/const [streak, setStreak] = useState($streak);/" readme.md
        sed -i "$((line+1))s/.*/const date = $day;/" readme.md
        git add .
        git commit -m "$messages"
        git push https://$USERNAME:$PASSWORD@github.com/$USERNAME/streak.git
        echo "$messages at $(date)" >> streak.log
    else
        echo "Reboot at $(date) and Already Save Today" >> streak.log
        echo "Already save today"
    fi
else
    echo -e "Set up your .env with :\nUSERNAME=YOUR_GITHUB_USERNAME\nPASSWORD=YOUR_GITHUB_PASSWORD"
fi

echo "Git" >> ~/streak.log