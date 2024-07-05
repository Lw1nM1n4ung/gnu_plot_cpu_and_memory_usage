#!/bin/bash

cpu_usage(){
    touch ./cpu_usage.dat
    DATAFILE="./cpu_usage.dat"
    gnuplot -persist <<-EOF
        set title "Real-Time CPU Usage"
        set xlabel "Time"
        set ylabel "CPU Usage (%)"
        set yrange [0:100]
        set ytics 10 
        set xdata time
        set timefmt "%H:%M:%S"
        set format x "%H:%M:%S"
        set grid
        while (1) {
            plot "$DATAFILE" using 1:2 title 'User Time' with lines lc rgb 'red'
            pause 3
            replot
        }
EOF
}

memory_usage(){
    touch ./memory_usage.dat
    DATAFILE="./memory_usage.dat"
    gnuplot -persist <<-EOF
        set title "Real-Time Memory Usage"
        set xlabel "Time"
        set ylabel "Memory Usage (%)"
        set yrange [0:100]
        set ytics 10 
        set xdata time
        set timefmt "%H:%M:%S"
        set format x "%H:%M:%S"
        set grid
        while (1) {
            plot "$DATAFILE" using 1:2 title 'User Time' with lines lc rgb 'red'
            pause 3
            replot
        }
EOF
}





