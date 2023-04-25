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
    for (; *i < 3; ++(*i))
    {
        std::cin >> *x;
        Insert(list, x);
    }
    delete i;
    int *max = new int;
    int *min = new int;

    *max = list->val;
    *min = list->val;

    while (list != NULL)
    {
        if (*max < list->val)
            *max = list->val;
        if (*min > list->val)
            *min = list->val;

        list = list->next;
    }

    std::cout << "Maximul este " << *max << "\n"
              << "Minimul este " << *min << "\n";
}