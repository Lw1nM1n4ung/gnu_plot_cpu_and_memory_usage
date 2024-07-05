#!/bin/bash
cpu_data(){
DATAFILE="./cpu_usage.dat"
echo "" > $DATAFILE  #Clear the file initially

# Loop to collect data continuously
while true; do
line=$(cat $DATAFILE | wc -l )
if [ $line -gt 30 ]
then  
old_data=$(tail -30 $DATAFILE)
echo -e "$old_data" > $DATAFILE 

else
    usage=$( mpstat | tail -n 1 | awk '{print $NF}' )
    cpu=$( echo "100 - $usage" | bc )
    now=$(date "+%H:%M:%S")
    echo "$now $cpu" >> $DATAFILE
    sleep 2  # Sleep for 1 second before the next collection
fi 

done
}


memory_data(){
    
DATAFILE="./memory_usage.dat"
echo "" > $DATAFILE  #Clear the file initially

# Loop to collect data continuously
while true; do
line=$(cat $DATAFILE | wc -l )
if [ $line -gt 30 ]
then  
old_data=$(tail -30 $DATAFILE)
echo -e "$old_data" > $DATAFILE 

else
    memory=$( free -m | grep Mem | awk '{print ($3/$2)*100}' )
    now=$(date "+%H:%M:%S")
    echo "$now $memory" >> $DATAFILE
    sleep 2  # Sleep for 1 second before the next collection
fi 

done
}