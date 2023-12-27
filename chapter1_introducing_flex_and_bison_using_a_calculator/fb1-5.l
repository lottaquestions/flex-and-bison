/* Recognize tokens for the calculator and print them out */

/* To compile:
   flex -o fb1-5.c fb1-5.l 

*/

%{
#include "fb1-5.tab.h"
%}

%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n     { return EOL; }
[ \t]  { /* Ignore whitespace */ }
.      { printf("Mystery character %c\n", *yytext); }
%%


