#ifndef __LEXERSYMBOLS_H__
#define __LEXERSYMBOLS_H__


// Lexer constants
enum {
   UNUSED = 257,  // start above 256 (we can also return actual chars)
   ERROR_TOKEN, // returned if illegal character found
   END_STMT,   // end of statement
   ID,         // identifier
   ARCHETYPE_KEYWORD,
   OBJECT_KEYWORD,
   INHERITANCE_OP,
   TYPE_INTEGER,
   TYPE_STRING,
   NATIVE_KEYWORD,
   STATE_KEYWORD,
   STATESET_KEYWORD,
   MEMBER_OP,
   ARG_SEPARATOR,
   OPEN_BRACKET,
   CLOSE_BRACKET,
   OPEN_PAREN,
   CLOSE_PAREN,
   IF,
   ELSE,
   EQUAL_OP,
   ASSIGN_OP,
   INTEGER,
   STRING
};

#endif
