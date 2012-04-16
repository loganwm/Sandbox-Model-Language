%option noyywrap

%{

/* ------------------------------------------------------------------
   Initial code (copied verbatim to the output file)
   ------------------------------------------------------------------ */

// Includes
#include <stdio.h>
#include <string.h>   // strcpy, strncpy

#include "lexersymbols.h"
#include "shared.h"

void disregard_comment();

%}

/* ------------------------------------------------------------------
   Some macros (standard regular expressions)
   ------------------------------------------------------------------ */

LETTER   [a-zA-Z_]
DIGIT    [0-9]
INTEGER  {DIGIT}*
IDENT    {LETTER}({LETTER}|{DIGIT})*
STR      \"[^\"]*\"
WSPACE   [ \t]+

%%
"archetype" {return ARCHETYPE_KEYWORD;}
"object"    {return OBJECT_KEYWORD;}
"is"        {return INHERITANCE_OP;}
"native"    {return NATIVE_KEYWORD;}
"state"     {return STATE_KEYWORD;}
"stateset"  {return STATESET_KEYWORD;}
"integer"   {return TYPE_INTEGER;}
"string"   {return TYPE_STRING;}
"."         {return MEMBER_OP;}
","         {return ARG_SEPARATOR;}
"#"         {disregard_comment();}
"{"         {return OPEN_BRACKET;}
"}"         {return CLOSE_BRACKET;}
"("         {return OPEN_PAREN;}
")"         {return CLOSE_PAREN;}
"if"        {return IF;}
"else"      {return ELSE;}
"=="        {return EQUAL_OP;}
"="         {return ASSIGN_OP;}
\n          {}
{INTEGER}   {printf("integer %s\n\n", yytext); yylval.integer = atoi(yytext); return INTEGER;}
{IDENT}     {return ID;}
{STR}       {printf("string"); yylval.str = yytext; return STRING;}
{WSPACE}    {}
.           {return ERROR_TOKEN;}
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


