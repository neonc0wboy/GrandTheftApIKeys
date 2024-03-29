#!/bin/bash
#
echo 'type 0 or 1: '
update=${1}

## Specify the path to the cached file
cached_file="./1.links"
#
## Get the current timestamp
current_timestamp=$(date +%s)
#
## Get the timestamp of the last modification of the cached file
last_modified=$(stat -c %Y $cached_file)
#
## Calculate the time difference in seconds
time_difference=$((current_timestamp - last_modified))
#
## Calculate the time difference in days
#time_difference_days=$((time_difference / 86400))
time_difference_days=$((time_difference / 3600))                 
echo $time_difference_days
#
## Check if the cached file is older than 3 days

#if [ $time_difference_days -gt -1 ]; then
if [ $update -gt 0 ]; then 
    python3 2.py > 1.links
    curl -skL $(cat 1.links) > out
    cat out | grep 'Bearer sk-*' > out.keys
    cat out.keys | awk '{ print $3 }' | sed 's/.\{3\}$//' > keys
    echo "Cached file is older than 3 hours. Running some code..."
    else
    echo "Cached file is up to date."
fi

#python3 2.py > 1.links
#curl -vkL $(cat 1.links) > out
#cat out | grep 'Bearer sk-*' > out.keys
#cat out.keys | awk '{ print $3 }' | sed 's/.\{3\}$//' > keys
#echo $(cat keys)
python3 test_keys.py > curls
bash curls
