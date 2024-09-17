set terminal png size 1000,700
set output 'plots/circle.png'

set multiplot layout 2,2   # 2 rows, 2 columns

# First plot
set size square
set lmargin 10
set rmargin 10
set bmargin 3
set tmargin 3
set xrange [0:20]  # Set the range of the x axis
set yrange [0.5:1.5]  # Set the range of the y axis
set title "Plot 1"  # Set the title of the first plot
set xlabel "time (t)"  # Set the label for the x axis
set ylabel "x(t), y(t)"  # Set the label for the y axis
plot "Circle.dat" using 1:2 with lines title "x(t)", \
     "Circle.dat" using 1:3 with lines title "y(t)"

# Second plot
x0 = 1; y0 = 1
set lmargin 10
set rmargin 10
set bmargin 3
set tmargin 3
set xrange [-0:20]  # Set the range of the x axis
set yrange [-5:5]  # Set the range of the y axis
set title "Plot 2"  # Set the title of the second plot
set xlabel "time (t)"  # Set the label for the x axis
set ylabel "theta(t)"  # Set the label for the y axis
plot "Circle.dat" using 1:(atan2($3-y0,$2-x0)) with lines title "theta(t)",pi, -pi

# Third plot
set lmargin 10
set rmargin 10
set bmargin 3
set tmargin 3
set xrange [0:1.6]  # Set the range of the x axis
set yrange [0:1.6]  # Set the range of the y axis
set title "Plot 3"  # Set the title of the third plot
set xlabel "time (t)"  # Set the label for the x axis
set ylabel "v_x(t), v_y(t)"  # Set the label for the y axis
plot "Circle.dat" using 1:4 with lines title "v_x(t)", \
     "Circle.dat" using 1:5 with lines title "v_y(t)", \
     "Circle.dat" using 2:3 title "x-y" with lines

unset multiplot  # End of multiplot