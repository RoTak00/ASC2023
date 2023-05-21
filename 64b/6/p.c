#include <stdio.h>

int main()
{
    unsigned long long fact = 1;
    int sign = 1;
    float x;
    double xpow;
    double result = 0;

    scanf("%f", &x);
    xpow = x;
    for(int i = 1; i <= 5; ++i)
    {
        result += xpow * sign / fact;


        sign *= -1;
        fact *= (2 * i) * (2 * i + 1);
        xpow *= x * x;
    }

    printf("%lf", result);
}