#!/bin/bash
#
# Check the prime.log every hour and send an email with any new results

if test -f "prime.log" ; then
    old_result_count=$(grep -c "prime" prime.log)
    sleep_time=1h

    while true; do
        current_result_count=$(grep -c "prime" prime.log)
        if [[ $current_result_count > $old_result_count ]] ; then
            new_result=$(grep "prime" prime.log | tail -1)
            # send mail
            {
                echo From: your_email@domain.com
                echo Subject: GIMPS LL Test Result
                echo "$new_result"
            } | ssmtp recipient_email@domain.com
            old_result_count=$current_result_count
            sleep $sleep_time
        else
            sleep $sleep_time
        fi
    done

    else
        echo "prime.log not found in this directory"
fi