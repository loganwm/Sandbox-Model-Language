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
%token TYPE_INTEGER
%token NATIVE_KEYWORD
%token STATE_KEYWORD
%token MEMBER_OP
%token ARG_SEPARATOR
%token OPEN_BRACKET
%token CLOSE_BRACKET
%token OPEN_PAREN
%token CLOSE_PAREN

%%

code:
	ARCHETYPE_KEYWORD ID OPEN_BRACKET statement_list CLOSE_BRACKET {printf("archetype declaration\n");}
	| ARCHETYPE_KEYWORD ID INHERITANCE_OP ID OPEN_BRACKET statement_list CLOSE_BRACKET {printf("archetype declaration with inheritance\n");}
	| OBJECT_KEYWORD ID OPEN_BRACKET statement_list CLOSE_BRACKET {printf("object declaration with inheritance\n");}
;

statement_list:
	statement_list statement |
	 /* empty */
;

statement_block:
	OPEN_BRACKET statement_list CLOSE_BRACKET {}
;

statement:
	method_declaration {printf("method declaration\n");} |
	state_declaration {printf("state declaration\n");}
;

state_declaration:
	STATE_KEYWORD ID statement_block  {}
;

method_declaration:
	type_specifier ID OPEN_PAREN argument_list CLOSE_PAREN statement_block  {}
;

argument_list:
	argument {} |
	argument ARG_SEPARATOR argument_list {} |
	/* empty */ {}
;

argument:
	type_specifier ID
;

type_specifier:
	TYPE_INTEGER {}
;

%%

