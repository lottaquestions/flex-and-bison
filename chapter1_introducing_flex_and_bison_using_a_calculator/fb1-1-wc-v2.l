/* Just like unix wc */
/* To compile: 
   flex -o fb1-1-wc-v2.cpp fb1-1-wc-v2.l
   gcc -static fb1-1-wc-v2.cpp -lfl -o wc.bin
   Does not compile without -static. See https://github.com/colinaaa/cs143/issues/1 for rationale.
*/

%{
extern int yylex(void);
int chars = 0;
int words = 0;
int lines = 0;
%}
			
%%

[^ \t\n\r\f\v]+ { words++; chars += strlen(yytext); }
\n        { chars++; lines++; }
.         { chars++; }

%%

int main (int argc, char **argv){
    yylex();
    printf("%8d%8d%8d\n", lines, words, chars);
    return 0;
} 

