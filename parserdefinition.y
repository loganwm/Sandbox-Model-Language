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


%%

statement:
	END_STMT {printf("Identifier statement.");}
;

%%

