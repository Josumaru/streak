#!/bin/bash

line=$(grep -n "useState" readme.md | cut -d ":" -f 1)
streak=$(cat readme.md | sed -n "${line}p" | grep -oE "[0-9]+")
validator=$(cat readme.md | sed -n "$((line+1))p" | grep -oE "[0-9]+")
day=$(date +%d | sed 's/^0*//')
streak=$((streak+1))
messages="chore: save $streak streak today"

if [[ -f .env ]]; then
    source .env
    sed -i "${line}s/.*/const [streak, setStreak] = useState($streak);/" readme.md
    sed -i "$((line+1))s/.*/const date = $day;/" readme.md
    git add .
    git commit -m "$messages"
    echo "$messages at $(date)" >> streak.log
    git push https://$USERNAME:$PASSWORD@github.com/$USERNAME/streak.git
else
    echo -e "Set up your .env with :\nUSERNAME=YOUR_GITHUB_USERNAME\nPASSWORD=YOUR_GITHUB_PASSWORD"
fi