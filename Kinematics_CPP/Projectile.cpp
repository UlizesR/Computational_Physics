// ============================================================ 
// File Projectile .cpp
// Shooting a progectile near the earth surface .
// No air resistance .
// Starts at (0,0), set (v0,theta).
// ============================================================ 

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>
#include <cmath>

#define PI 3.14159265358979323846
#define g 9.81

int main()
{
    // Declare variables
    double x0, y0, R, x, y, vx, vy, t, tf, dt;
    double theta, v0x, v0y, v0;
    std::string buff;

    // Get user input
    std::cout << "# Enter v0, theta ( in degrees ) :\n";
    std::cin >> v0 >> theta;    getline(std::cin, buff);
    std::cout << "# Enter tf, dt:\n";
    std::cin >> tf >> dt;    getline(std::cin, buff);
    std::cout << "# v0= " << v0 << " theta= " << theta << "o (degrees)\n" << std::endl;
    std::cout << "# t0= " << 0.0 << " tf= " << tf << " dt= " << dt << std::endl;

    // Initialize variables
    if (v0 <= 0.0) {
        std::cerr << "v0 must be positive\n";
        exit(1);
    }
    if (theta < 0.0 || theta > 90.0) {
        std::cerr << "theta must be between 0 and 90 degrees\n";
        exit(1);
    }

    theta = (theta * PI) / 180.0;
    v0x = v0 * cos(theta);
    v0y = v0 * sin(theta);

    std::cout << "# v0x= " << v0x << " v0y= " << v0y << std::endl;

    std::ofstream myfile("Projectile.dat");
    myfile.precision(17);

    // Compute
    t = 0.0;
    while (t <= tf) {
        x = v0x * t;
        y = v0y * t - 0.5 * g * t * t;
        vx = v0x;
        vy = v0y - g * t;
        myfile << t << " " << x << " " << y << " " << vx << " " << vy << std::endl;
        t += dt;
    }

    return 0;
}
