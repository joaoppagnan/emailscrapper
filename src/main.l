%{
#include <stdio.h>
%}
ALFANUM [a-zA-Z0-9] 
ESPECIAIS [-_.]
ALFAESP {ESPECIAIS}*{ALFANUM}+

%%

(({ALFANUM}+{ALFAESP}*)@({ALFANUM}+{ALFAESP}*)) {
  printf("%s\n", yytext);/* essa primeira regra e para selecionar as strings com o email no formato certo e sem o ponto final */
}

(({ALFANUM}+{ALFAESP}*)@({ALFANUM}+{ALFAESP}*)[.]) {
  *(yytext + yyleng - 1) = '\0';/* para lidar com o ponto final, acrescentei uma instrucao q substitui o ultimo char da string por um char nulo */
  printf("%s\n", yytext);
}

{ALFANUM}+;
{ESPECIAIS}+;

[[:space:]]+ ;
[[:^space:]]+ ;
[.\n]* ;

%%

int main() {  /* subrotina principal */
  yylex(); /* chama a função de analise sintatica */
  return 0;
}
/* joao pedro de oliveira pagnan 199727 30-03-2020 */
