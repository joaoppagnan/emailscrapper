%{
#include <stdio.h>
%}
ALFANUM [a-zA-Z0-9]
ESPECIAIS [-_.]
ALFAESP {ESPECIAIS}*{ALFANUM}+

%%

(({ALFANUM}+{ALFAESP}*)@({ALFANUM}+{ALFAESP}*)?) {
  printf("%s\n", yytext);
}

(({ALFANUM}+{ALFAESP}*)@({ALFANUM}+{ALFAESP}*)[.]?) {
  *(yytext + yyleng - 1) = '\0';
  printf("%s\n", yytext);
}

{ALFANUM}+;
{ESPECIAIS}+;

[[:space:]]+ ;
[[:^space:]]+ ;
[.\n]* ;

%%

int main() {  
  yylex();
  return 0;
}

