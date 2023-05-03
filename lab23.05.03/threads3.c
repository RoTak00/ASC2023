#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

void *sdiv(void *x);
void *pdiv(void *x);

int suma_divizorilor(int x)
{
    int res = 0;
    for (int d = 1; d * d <= x; d++)
        if (x % d == 0)
        {
            res += d;
            if (d * d < x) // dacă d != sqr
                res += x / d;
        }
    return res;
}

int prod_divizorilor(int x)
{
    int res = 1;
    for (int d = 1; d * d <= x; d++)
        if (x % d == 0)
        {
            res *= d;
            if (d * d < x) // dacă d != sqr
                res *= x / d;
        }
    return res;
}

int cnts = 0;
int cntp = 0;

int cnttotal = 0;

pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
int **mat = NULL;
int n, m, q;
int main()
{
    scanf("%d%d", &n, &m);
    scanf("%d", &q);

    mat = (int **)calloc(n, sizeof(int *));
    for (int i = 0; i < n; ++i)
    {
        mat[i] = (int *)calloc(m, sizeof(int));
        for (int j = 0; j < m; ++j)
            scanf("%d", &(mat[i][j]));
    }

    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < m; ++j)
        {
            int x = mat[i][j];

            int rc1, rc2;
            pthread_t thread1, thread2;

            if (rc1 = pthread_create(&thread1, NULL, &sdiv, &x))
            {
                fprintf(stderr, "Eroare creare thread! %d\n", rc1);
                exit(1);
            }

            if (rc2 = pthread_create(&thread2, NULL, &pdiv, &x))
            {
                fprintf(stderr, "Eroare creare thread! %d\n", rc2);
                exit(1);
            }

            pthread_join(thread1, NULL);
            pthread_join(thread2, NULL);
        }
    }

    printf("cnts=%02d\n", cnts);
    printf("cntp=%02d\n", cntp);
    printf("cntt=%02d\n", cnttotal);
    exit(0);
}

void *sdiv(void *x)
{
    int *vx = (int *)x;
    if (suma_divizorilor(*vx) == q)
    {
        cnts += 1;
        pthread_mutex_lock(&mutex1);
        cnttotal += 1;
        printf("cnts=%2d\ncntt=%2d\n", cnts, cnttotal);
        pthread_mutex_unlock(&mutex1);
    }
}

void *pdiv(void *x)
{
    int *vx = (int *)x;
    if (prod_divizorilor(*vx) == q)
    {
        cntp += 1;
        pthread_mutex_lock(&mutex1);
        cnttotal += 1;
        printf("cntp=%2d\ncntt=%2d\n", cntp, cnttotal);
        pthread_mutex_unlock(&mutex1);
    }
}