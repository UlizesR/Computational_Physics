//============================================================
// File Circle.cpp
// Constant angular velocity circular motion
// Set (x0 , y0) center of circle , its radius R and omega .
// At t = t0 , the particle is at theta = 0
// ============================================================

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>
#include <cmath>

#define PI 3.1415926535897932

int main() 
{
    // Declare variables
    double x0, y0, R, x, y, vx, vy, t, t0, tf, dt;
    double theta, omega;
    std::string buf;

    // Read input
    std::cout << "# Enter omega:\n";
    std::cin >> omega; getline(std::cin, buf);
    std::cout << "# Enter center of circle (x0, y0) and radius R:\n";
    std::cin >> x0 >> y0 >> R; getline(std::cin, buf);
    std::cout << "# Enter t0, tf, dt:\n";
    std::cin >> t0 >> tf >> dt; getline(std::cin, buf);
    std::cout << "# omega= " << omega << std::endl;
    std::cout << "# x0= " << x0 << " y0= " << y0 << " R= " << R << std::endl;
    std::cout << "# t0= " << t0 << " tf= " << tf << " dt= " << dt << std::endl;

    // Check input
    if (R <= 0.0) 
        std::cerr << "Illegal value of R\n"; exit(1);
    if (omega <= 0.0) 
        std::cerr << "Illegal value of omega\n"; exit(1);
    
    std::cout << "# T= " << 2.0 * PI / omega << std::endl;
    std::ofstream myfile("Circle.dat");
    myfile.precision(17);

    // Write output to file
    t = t0;
    while (t <= tf) 
    {
        theta = omega * (t - t0);
        x = x0 + R * cos(theta);
        y = y0 + R * sin(theta);
        vx = -omega * R * sin(theta);
        vy = omega * R * cos(theta);
        myfile << t << " " << x << " " << y << " " << vx << " " << vy << std::endl;
        t = t + dt;
    }
}