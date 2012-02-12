#include "symboltable.h"

struct symbol* createTree()
{

}

void addSymbol(struct symbol* root, char* symbol_name)
{
	/* We don't have a root, let's make one */
	if (root == NULL)
	{
		printf("haha");
		root = malloc(sizeof(struct symbol));
		root->symbol_name = symbol_name;
	}
}
