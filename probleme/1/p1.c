
#include <unistd.h>

int main()
{
    int a;
    read(1, &a, sizeof(int));
    write(0, &a, sizeof(int));
    return 0;
}