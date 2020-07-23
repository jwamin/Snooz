#!/usr/bin/env zsh

#Shell Script to capture data from NewsAPI
#=========================================
# By Jocelyn Manger

#Will Run on schduled jobs at:
#6am
#12pm
#6pm
#12am
say "running launchd task" #helps to debug background process!
echo "Running Training Data Capture"
echo "Downloading Headlines for $(date)"

CURRENT_DATE=$(date +"%Y-%m-%d-%I-%M%p")
OUTPUT_FILE="/Users/jwamin/sandbox.nosync/beta-projects-20-21/Snooz/Resources/out/news-headlines-${CURRENT_DATE}.json"

curl https://newsapi.org/v2/top-headlines\?country\=us\&apiKey\=510332d2557240f496c74ee5687e547e \
| python3 -m json.tool \
> $OUTPUT_FILE

echo "${OUTPUT_FILE} created."
