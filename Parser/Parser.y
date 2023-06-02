%code requires {
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

// Declare Flex types
extern int yylex();
extern int yyparse();
extern FILE* yyin;

// Error reporting function
void yyerror(const char* msg);

}

/* Value storage. Store int tokens for demo purposes. */
%union {
    int intVal;
    float floatVal;
}

/* Terminals */
%token <intVal> INTEGER
%token <floatVal> FLOAT
%token ADDOP SUBOP MULOP DIVOP POWOP ENDL

/* Nonterminals returning values */
%nterm <floatVal> literal expr

/* Operator precedence, lowest first */
%left ADDOP SUBOP
%left MULOP DIVOP
%left POWOP

%%
/* Grammar rules */

calculation:
    | calculation line
;

line:
  expr ENDL { printf("Result: %.4f\n", $1); }
;

literal:
  INTEGER               { $$ = (float)$1; }
| FLOAT                 { $$ = $1; }
;

expr:
  literal               { $$ = $1; }
| expr ADDOP expr       { $$ = $1 + $3; }
| expr SUBOP expr       { $$ = $1 - $3; }
| expr MULOP expr       { $$ = $1 * $3; }
| expr DIVOP expr       { $$ = $1 / $3; }
| expr POWOP expr       { $$ = pow($1, $3); }
;

%%
/* Epilogue: main() and the error reporting function. */

int main()
{
    // Read form standard input
    yyin = stdin;
    yyparse();

    return 0;
}

void yyerror(const char* msg)
{
    printf("ERROR: %s", msg);
    exit(1);
}
