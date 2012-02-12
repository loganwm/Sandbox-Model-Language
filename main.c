#include <stdio.h>
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
	struct symbol* s;

	addSymbol(s, "hello");

	if (s == NULL)
	{
		printf("%s\n", s->symbol_name);
		printf("fuck");
	}

	yyparse();
	return 0;
}
