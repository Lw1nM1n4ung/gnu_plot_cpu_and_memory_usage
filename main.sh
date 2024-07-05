#!/bin/bash
source ./plot 
source ./data_collect.sh
case $1 in
    cpu) 
        cpu_data &
        cpu_usage &
        ;;
    memory)
        memory_data &
        memory_usage &
        ;;
    *)
        echo "Invalid argument. Please provide 'cpu' or 'memory' as an argument."
        exit 1
        ;;
esac

case $2 in
    cpu) 
        cpu_data &
        cpu_usage &y
        ;;
    memory)
        memory_data &
        memory_usage &
        ;;
esac

handle_sigint() {
    pid=$( ps | grep main.sh | cut -d'p' -f1 )
    echo $pid
    kill -9 $pid

    pid=$( ps | grep gnuplot | cut -d'p' -f1 )
    echo $pid
    kill -9 $pid
exit 0  # Exit script cleanly
}

# Set up trap to catch SIGINT and call handle_sigint when it occurs
trap handle_sigint SIGINT
while true; do
    sleep 1  # Dummy operation to simulate script activity
done

