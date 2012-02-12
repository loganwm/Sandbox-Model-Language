#ifndef __H_SYMBOLTABLE__
#define __H_SYMBOLTABLE__

#include <stdlib.h>
#include <stdio.h>

#include "shared.h"


struct symbol
{
	char* symbol_name;
	YYSTYPE value;

	struct symbol* left;
	struct symbol* right;
};


void addSymbol(struct symbol* root, char* symbol_name);

#endif
