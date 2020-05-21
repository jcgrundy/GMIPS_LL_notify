#!/usr/bin/env bash
#
# Check the prime.log every hour and send an email with any new results

#TODO check for log file presence
#TODO wait until on the hour to email

old_result_count=$(grep -c "prime" prime.log)
sleep_time=1h

while true; do
    current_result_count=$(grep -c "prime" prime.log)
    if [[ $current_result_count > $old_result_count ]] ; then
        get the result line
        mail the updated results
        old_result_count=$current_result_count
        sleep $sleep_time
    else
        sleep $sleep_time
    fi
done