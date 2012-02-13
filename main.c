#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include "shared.h"
#include "symboltable.h"

YYSTYPE yylval;

void yyerror(char* message)
{
	printf("Error: %s\n", message);
}

int yywrap()
{
	return 1;
}

int main()
{
	struct symbol* s = NULL;

	s = addSymbol(s, "abcd");
	addSymbol(s, "abcde");
	addSymbol(s, "abcdef");	
	addSymbol(s, "abc");

	printf("%s\n", s->symbol_name);
	printf("height: %d\n", calculateHeight(s));

	yyparse();
	return 0;
}
