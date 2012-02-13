#ifndef __H_SYMBOLTABLE__
#define __H_SYMBOLTABLE__

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "shared.h"

enum ComparisonValue
{
	LESS_THAN,
	GREATER_THAN,
	EQUAL_TO
};

struct symbol
{
	char* symbol_name;
	YYSTYPE value;

	struct symbol* left;
	struct symbol* right;
};

struct symbol* addSymbol(struct symbol* root, char* symbol_name);
enum ComparisonValue compareStrings(const char*, const char*);
uint16_t calculateHeight(struct symbol* node);

#endif
