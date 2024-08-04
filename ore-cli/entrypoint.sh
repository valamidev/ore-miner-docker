#!/bin/sh

while true; do
    # Run the 'ore config' command and capture its output
    config_output=$(ore config)

    # Extract the Min difficulty value
    min_difficulty=$(echo "$config_output" | grep "Min difficulty:" | awk '{print $3}')

    # Check if Min difficulty is not 1
    if [ "$min_difficulty" != "1" ]; then
        echo "Min difficulty is $min_difficulty. Starting mining..."
        exec ore --rpc "${SOLANA_RPC_URL}" mine --buffer-time "${BUFFER_TIME}" --threads "${THREADS}" --priority-fee "${PRIORITY_FEE}"
    else
        echo "Min difficulty is still 1. Waiting for 5 seconds before checking again..."
        sleep 5
    fi
done