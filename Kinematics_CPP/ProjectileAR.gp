set terminal png size 1000,700
set output 'plots/ProjectileAR.png'

set multiplot layout 2,1   # 2 rows, 1 column

v0x = 10*cos(pi/4) 
v0y = 10*sin(pi/4)
g = 9.81 
k = 5

# First plot
set size 1,0.5
set origin 0,0.5
set lmargin 10
set rmargin 10
set bmargin 3
set tmargin 3
set yrange [:v0x/k+0.1]
plot "ProjectileAR.dat" using 1:2 with lines title "x(t)", v0x/k, \
     "ProjectileAR.dat" using 1:3 with lines title "y(t)",-(g/k)*x+(g/k**2)+v0y/k 

# Second plot
set size 0.5,0.5
set origin 0,0
set lmargin 10
set rmargin 10
set bmargin 3
set tmargin 3
set yrange [-g/k-0.6:7]
plot "ProjectileAR.dat" using 1:4 with lines title "v_x(t)", v0x, \
     "ProjectileAR.dat" using 1:5 with lines title "v_y(t)", -g/k

# Third plot
set size 0.5,0.5
set origin 0.5,0
set lmargin 10
set rmargin 10
set bmargin 3
set tmargin 3
set yrange [0:3]
plot "ProjectileAR.dat" using 2:3 with lines title "With air resistance k = 5.0", \
     "Projectile.dat" using 2:3 with lines title "No air resistance k = 0.0"

unset multiplot