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
%token TYPE_STRING
%token NATIVE_KEYWORD
%token STATE_KEYWORD
%token STATESET_KEYWORD
%token MEMBER_OP
%token ARG_SEPARATOR
%token OPEN_BRACKET
%token CLOSE_BRACKET
%token OPEN_PAREN
%token CLOSE_PAREN
%token IF
%token ELSE
%token EQUAL_OP
%token ASSIGN_OP
%token INTEGER
%token STRING

%%

file:
	ARCHETYPE_KEYWORD ID OPEN_BRACKET statement_list CLOSE_BRACKET {printf("archetype declaration\n");}
	| ARCHETYPE_KEYWORD ID INHERITANCE_OP ID OPEN_BRACKET statement_list CLOSE_BRACKET {printf("archetype declaration with inheritance\n");}
	| OBJECT_KEYWORD ID INHERITANCE_OP ID OPEN_BRACKET statement_list CLOSE_BRACKET {printf("object declaration with inheritance\n");}
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
	state_declaration {printf("state declaration\n");} |
	stateset_declaration {printf("stateset declaration\n");} |
	variable_declaration {printf("variable declaration\n");} |
	if_statement {printf("if statement\n");}
;

stateset_declaration:
	STATESET_KEYWORD identifier statement_block {}
;

state_declaration:
	STATE_KEYWORD identifier statement_block  {}
;

method_declaration:
	type_specifier identifier OPEN_PAREN argument_list CLOSE_PAREN statement_block  {}
;

variable_declaration:
	type_specifier identifier ASSIGN_OP value {}
;

if_statement:
	IF expression statement_block else_statement {}
;

else_statement:
	ELSE if_statement {printf("else if!\n");} |
	ELSE statement_block {printf("simple else\n");} |
	/* nothing, else is optional. */
;

argument_list:
	argument {} |
	argument ARG_SEPARATOR argument_list {} |
	/* empty */ {}
;

argument:
	type_specifier identifier {}
;

type_specifier:
	TYPE_INTEGER {} |
	TYPE_STRING {}
;

value:
	integer {} |
	string {}
;

expression:
	assignment_expression {} |
	equality_expression {} |
	OPEN_PAREN expression CLOSE_PAREN
;

assignment_expression:
	identifier ASSIGN_OP value {}
;

equality_expression:
	identifier EQUAL_OP value {}
;

integer:
	INTEGER { printf("test: %d\n", yylval); }
;

string:
	STRING { printf("value: %s\n", yylval); }
;

identifier:
	ID {}
;

%%

