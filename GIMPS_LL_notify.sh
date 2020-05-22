#!/bin/bash
#
# Check the prime.log every hour and send an email with any new results

if test -f "prime.log" ; then
    old_result_count=$(grep -c "prime" prime.log)
    sleep_time=1h

    while true; do
        current_result_count=$(grep -c "prime" prime.log)
        if [[ $current_result_count > $old_result_count ]] ; then
            # check difference to return multiple results if multiple
            # worker units finished within the same hour
            difference=$("$current_result_count" - "$old_result_count")
            new_result=$(grep "prime" prime.log | tail -"$difference")
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