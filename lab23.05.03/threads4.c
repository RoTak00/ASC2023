#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <math.h>

#define PI 3.1415926
long double normal_distr(int x)
{
    return exp(-0.5 * x * x) / (sqrtl(2 * PI));
}

long double fsimpla(int x)
{
    return x;
}

long double calc_rect(double lst, double lfin)
{
    printf("st: %lf fin: %lf\n", lst, lfin);
    return (lfin - lst) * fsimpla(lst);
}

long double integral = 0;

pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
double st = 0, fin = 0;
int divs = 0;
double gap = 0;
int main()
{
    printf("st fin div\n");

    scanf("%lf%lf%d", &st, &fin, &divs);

    gap = (fin - st) / divs;
    printf("gap %lf\n", gap);

    int i;
    double tst;
    for (i = 0, tst = st; i < divs; i += 1, tst += gap)
    {
        integral += calc_rect(tst, tst + gap);
    }
    printf("%Lf", integral);

    return 0;
}
