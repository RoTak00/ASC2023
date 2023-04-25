#include <iostream>
#include <cstdlib>

struct Node
{
    int val;
    Node *next;
};

void Insert(struct Node *&head, int *val)
{
    Node *elem = new Node;
    elem->val = *val;
    elem->next = head;
    head = elem;
}

int main()
{
    Node *list = NULL;

    int *x = new int;
    int *i = new int(0);
    for (; *i < 10; ++(*i))
    {
        std::cin >> *x;
        Insert(list, x);
    }
    delete i;
    int *par = new int(0);
    int *imp = new int(0);

    while (list != NULL)
    {
        if (list->val % 2)
            *imp += 1;
        else
            *par += 1;

        list = list->next;
    }

    std::cout << "Elem pare: " << *par << "\n"
              << "Elem impare: " << *imp << "\n";
    return 0;
}