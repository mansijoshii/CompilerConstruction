%{ 
  #include<stdio.h> 
  extern FILE *yyin;
%} 

%token INCLUDE INCLUDEFILES ID INT NUM MAIN END
%token IF ELSE DO WHILE SWITCH CASE 
%token OB CB OCB CCB OP EQT SM CL
%left '<' '>' '{' '}' '(' ')'
%right '='

%%
start: INCLUDE INCLUDEFILES main
;
main:INT MAIN OB CB OCB statements statements statements statements END NUM SM CCB
;
statements: ifblock
| switchblock 
| dowhileblock
| assignment
| ID SM
;
ifblock: IF OB expression CB OCB statements CCB ELSE OCB statements CCB
;
switchblock: SWITCH OB ID CB OCB case case CCB
;
case: CASE NUM CL statements
;
dowhileblock: DO OCB statements CCB WHILE OB expression CB SM
;
expression: ID OP NUM
;
assignment: INT ID EQT NUM SM
| ID EQT NUM SM
; 
%%

int main()
{
  yyin = fopen("code2.c", "r");
  if(!yyparse())
  printf("Parsing complete\n");
  else
  printf("Parsing failed\n");
  fclose(yyin);
  return 0;
}

yyerror (char *s) 
{ 
   printf("Syntax error\n"); 
}

