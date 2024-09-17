//============================================================
// File SimplePendulum.cpp
// Set pendulum orignal position at theta0
// with no initial velocity
// ============================================================

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>
#include <cmath>

#define PI 3.1415926535897932
#define g 9.81

int main()
{
    // Declare variables
    double l, x, y, vx, vy, t, t0, tf, dt;
    double theta, theta0, dtheta_dt, omega;
    std::string buf;

    // Read input
    std::cout << "# Enter l:\n";
    std::cin >> l; getline(std::cin, buf);
    std::cout << "# Enter theta0:\n";
    std::cin >> theta0; getline(std::cin, buf);
    std::cout << "# Enter t0, tf, dt:\n";
    std::cin >> t0 >> tf >> dt; getline(std::cin, buf);
    std::cout << "# l= " << l << " theta0= " << theta0 << std::endl;
    std::cout << "# t0= " << t0 << " tf= " << tf << std::endl;
    std::cout << "# dt= " << dt << std::endl;

    // Initialize
    omega = sqrt(g / l);
    std::cout << "# omega= " << omega << " T= " << 2.0 * PI / omega << std::endl;
    std::ofstream myfile("SimplePendulum.dat");
    myfile.precision(17);

    // Compute 
    t = t0;

    while (t <= tf)
    {
        theta = theta0 * cos(omega * (t - t0));
        dtheta_dt = -theta0 * omega * sin(omega * (t - t0));
        x = l * sin(theta);
        y = -l * cos(theta);
        vx = l * dtheta_dt * cos(theta);
        vy = l * dtheta_dt * sin(theta);
        myfile << t << " " << x << " " << y << " " << vx << " " << vy << " " << theta << " " << dtheta_dt << std::endl;
        t = t + dt;
    }
}