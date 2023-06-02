/* No buffer wrapping required. */
%option noyywrap

%{
#include "Parser.h"
%}

/* Shorthand for digits */
DIGIT   [0-9]

/* Scanner rules */
%%

{DIGIT}+            { yylval.intVal = atoi(yytext); return INTEGER; }
{DIGIT}+"."{DIGIT}* { yylval.floatVal = atof(yytext); return FLOAT; }
"+"                 { return ADDOP; }
"-"                 { return SUBOP; }
"*"                 { return MULOP; }
"/"                 { return DIVOP; }
"^"                 { return POWOP; }
"\n"                { return ENDL; }
[ \t]+              { /* Ignore whitespace */ }
.                   { printf("Invalid character!\n"); }

%%
/* No epilogue here. */