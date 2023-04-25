#include <iostream>
#include <cstdlib>

bool isPrime(int *x)
{
    int *k;
    k = new int(2);

    while ((*k) * (*k) <= (*x))
    {
        if ((*x) % (*k) == 0)
        {
            delete k;
            return false;
        }
        *k += 1;
    }
    delete k;
    return true;
}

int main()
{
    int *x;

    x = new int;

    std::cin >> *x;
    std::cout << *x << " " << (isPrime(x) ? "" : "nu ") << "este prim\n";
}