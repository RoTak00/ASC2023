#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

pthread_t t1;

struct args 
{
    int position;
    int value;
    int len;
    int* array;
};

void* insert_at_index(void* arg)
{
    struct args* args = (struct args*)arg;

    args->array = realloc(args->array, (args->len + 1) * sizeof(int));
    args->len += 1;
    if(args->array == NULL)
    {
        perror("realloc");
        exit(1);
    }

    for(int i = args->len - 1; i >= args->position; i--)
    {
        args->array[i + 1] = args->array[i];
    }
    args->array[args->position] = args->value;
}

int main()
{
    struct args * argumente;
    argumente = malloc(sizeof(struct args));
    if(argumente == NULL)
    {
        perror("malloc");
        exit(1);
    }
    
    printf("Numar elemente: ");
    scanf("%d", &argumente->len);
    argumente->array = malloc(argumente->len * sizeof(int));

    for (int i = 0; i < argumente->len; i++)
    {
        printf("Elementul %d: ", i);
        scanf("%d", &argumente->array[i]);
    }

    printf("Valoarea de inserat: ");
    scanf("%d", &argumente->value);
    printf("De inserat la pozitia: ");
    scanf("%d", &argumente->position);

    pthread_create(&t1, NULL, insert_at_index, (void*)argumente);

    pthread_join(t1, NULL);

    for (int i = 0; i < argumente->len; i++)
    {
        printf("%d ", argumente->array[i]);
    }

    free(argumente->array);
}
