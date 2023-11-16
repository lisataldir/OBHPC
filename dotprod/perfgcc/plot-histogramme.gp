set style data boxes 
set boxwidth 0.2
set style fill solid border 3

set ylabel "MiB/s"
set title "Histogramme pour le compilateur gcc"
plot "gcc.dat" using ($0):2:xtic(1) title "O1", '' using ($0+0.2):3 title "O2", '' using ($0+0.4):4 title "O3", '' using ($0+0.6):5 title "Ofast"
pause -1