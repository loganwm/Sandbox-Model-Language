%{

/* ------------------------------------------------------------------
   Initial code (copied verbatim to the output file)
   ------------------------------------------------------------------ */

// Includes
#include <stdio.h>
#include <string.h>   // strcpy, strncpy

// Some yacc (bison) defines
#define YYDEBUG 1	      // Generate debug code; needed for YYERROR_VERBOSE
#define YYERROR_VERBOSE // Give a more specific parse error message 


void yyerror(char* message);

%}

/* Order is important here, must match the symbols header */
%token ERROR_TOKEN
%token END_STMT
%token ID
%token ARCHETYPE_KEYWORD
%token OBJECT_KEYWORD
%token INHERITANCE_OP
%token NATIVE_KEYWORD
%token STATE_KEYWORD
%token MEMBER_OP
%token ARG_SEPARATOR
%token OPEN_BRACKET
%token CLOSE_BRACKET
%token OPEN_PAREN
%token CLOSE_PAREN

%%

program:
	ARCHETYPE_KEYWORD ID OPEN_BRACKET statement_list CLOSE_BRACKET {printf("arch dec");}
;

statement_list:
	statement_list statement |
	 /* empty */
;

statement:
	END_STMT {printf("End statement.");} |
	ID       {printf("Identifier statement");}
;

%%

