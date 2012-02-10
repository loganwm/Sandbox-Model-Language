#include <stdio.h>

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
	yyparse();
	return 0;
}
