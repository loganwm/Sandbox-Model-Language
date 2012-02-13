#ifndef __H_SHARED__
#define __H_SHARED__

#include <stdint.h>

// Union to pass information between lexer and caller
typedef union {
   uint32_t integer;
   char *str;
} YYSTYPE;

extern YYSTYPE yylval;

#endif
