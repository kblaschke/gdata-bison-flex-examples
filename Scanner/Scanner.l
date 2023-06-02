%{
#include <stdio.h>
%}

/* Shorthand for digits */
DIGIT   [0-9]

/* Scanner rules */
%%

{DIGIT}+            { printf("An integer: %s\n", yytext); }
{DIGIT}+"."{DIGIT}* { printf("A float: %s\n", yytext); }
"+"|"-"|"*"|"/"|"=" { printf("The operator %s.\n", yytext); }
[ \t\n]+            { /* Ignore whitespace */ }
.                   { printf("Invalid character!\n"); }

%%
/* Epilogue: main() function. */

int main()
{
    // Read form standard input
    yyin = stdin;
    yylex();

    return 0;
}
