%option noyywrap

%{

/* ------------------------------------------------------------------
   Initial code (copied verbatim to the output file)
   ------------------------------------------------------------------ */

// Includes
#include <stdio.h>
#include <string.h>   // strcpy, strncpy

#include "lexersymbols.h"

void disregard_comment();

%}

/* ------------------------------------------------------------------
   Some macros (standard regular expressions)
   ------------------------------------------------------------------ */

LETTER   [a-zA-Z_]
DIGIT    [0-9]
IDENT    {LETTER}({LETTER}|{DIGIT})*
STR      \"[^\"]*\"
WSPACE   [ \t]+

%%
{IDENT}   {return ID;}
{STR}     {printf("string");}
{WSPACE}  {}
";"       {return END_STMT;}
"#"       {disregard_comment();}
\n        {}
.         {return ERROR_TOKEN;}
%%

void disregard_comment()
{
	char current_char;

	current_char = input();

	/* Read through characters until we hit either no more characters or a new line */
	while(current_char != '\0' && current_char != '\n')
	{
		current_char = input();
	}


}

