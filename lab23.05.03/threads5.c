#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <math.h>

#define PI 3.1415926
long double normal_distr(double x)
{
    return exp(-0.5 * x * x) / (sqrtl(2 * PI));
}

long double fsimpla(double x)
{
    return x;
}

long double integral = 0;

pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
double st = 0, fin = 0;
int divs = 0;
double gap = 0;

void *calc_rect(void *lst)
{
    double *vlst = (double *)lst;

    double v = (gap)*normal_distr(*vlst + (gap / 2));
    printf("%f\n", *vlst + (gap / 2));
    pthread_mutex_lock(&mutex1);
    integral += v;
    pthread_mutex_unlock(&mutex1);
}

int main()
{
    printf("st fin div\n");

    scanf("%lf%lf%d", &st, &fin, &divs);

    gap = (fin - st) / divs;
    printf("gap %lf\n", gap);

    int i;
    double tst;

    int *rc = (int *)calloc(divs, sizeof(int));
    pthread_t *thrds = (pthread_t *)calloc(divs, sizeof(pthread_t));

    for (i = 0, tst = st; i < divs; i += 1, tst += gap)
    {
        if (rc[i] = pthread_create(&(thrds[i]), NULL, &calc_rect, &tst))
        {
            fprintf(stderr, "Eroare creare thread! %d\n", rc[i]);
            exit(1);
        }
        pthread_join(thrds[i], NULL);
    }
    printf("\n\n%Lf", integral);

    return 0;
}
