set terminal png size 1000,700
set output 'plots/SimplePendulum.png'

set multiplot layout 2,2   # 2 rows, 2 columns

# First plot
set xrange [0:2]
set yrange [-1.1:1.1]
set title "Plot 1"
set xlabel "time (t)"
set ylabel "x(t), y(t)"
plot "SimplePendulum.dat" using 1:2 with lines title "x(t)", \
     "SimplePendulum.dat" using 1:3 with lines title "y(t)"

# Second plot
set title "Plot 2"
set xlabel "time (t)"
set ylabel "v_x(t), v_y(t)"
plot "SimplePendulum.dat" using 1:4 with lines title "v_x(t)", \
     "SimplePendulum.dat" using 1:5 with lines title "v_y(t)"

# Third plot
set title "Plot 3"
set xlabel "time (t)"
set ylabel "theta(t), theta'(t)"
plot "SimplePendulum.dat" using 1:6 with lines title "theta(t)", \
     "SimplePendulum.dat" using 1:7 with lines title "theta'(t)"

# Fourth plot
set title "Plot 4"
set xlabel "x"
set ylabel "y"
plot "SimplePendulum.dat" using 2:3 with lines title "x-y"

unset multiplot  # End of multiplot