/* Recognize tokens for the calculator and print them out */

/* To compile:
   flex -o fb1-4.c fb1-4.l 
   gcc -static fb1-4.c -lfl -o calc-v1.bin
   Does not compile without -static. See https://github.com/colinaaa/cs143/issues/1 for rationale.
   Test:
   a / 34 + |45
   
   Expected result:
   Mystery character a
   262
   258 = 34
   259
   263
   258 = 45
   264

*/

%{
enum yytokentype{
		 NUMBER = 258,
		 ADD = 259,
		 SUB = 260,
		 MUL = 261,
		 DIV = 262,
		 ABS = 263,
		 EOL = 264
};

int yylval;
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

int main(int argc, char **argv)
{
    int tok;

    while(tok = yylex()){
	printf("%d", tok);
	if(tok == NUMBER)
	    printf(" = %d\n", yylval);
	else
	    printf("\n");
    }
}
