set terminal png size 1000,700
set output 'plots/Projectile.png'

set multiplot layout 2,2   # 2 rows, 2 columns

# Plot 1: x(t) vs y(t)
set size square
set lmargin 10
set rmargin 10
set bmargin 3
set tmargin 3
set xrange [0:1.5]
set yrange [0:12]  # Auto range for y
set title "Plot 1: x(t) vs y(t)"
set xlabel "time (t)"
set ylabel "x(t), y(t)"
plot "Projectile.dat" using 1:2 with lines title "x(t)", \
     "Projectile.dat" using 1:3 with lines title "y(t)"

# Plot 2: x(t) vs v_x(t) and v_y(t)
set lmargin 10
set rmargin 10
set bmargin 3
set tmargin 3
set xrange [0:1.5]
set yrange [0:12]  # Auto range for y
set title "Plot 2: x(t) vs v_x(t) and v_y(t)"
set xlabel "time (t)"
set ylabel "v_x(t), v_y(t)"
plot "Projectile.dat" using 1:4 with lines title "v_x(t)", \
     "Projectile.dat" using 1:5 with lines title "v_y(t)"

# Plot 3: x-y
set lmargin 10
set rmargin 10
set bmargin 3
set tmargin 3
set xrange [0:10]
set yrange [0:3]  # Auto range for y
set title "Plot 3: x-y"
set xlabel "x"
set ylabel "y"
plot "Projectile.dat" using 2:3 with lines title "x-y"

unset multiplot