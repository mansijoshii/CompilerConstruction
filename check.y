%{ 
   /* Definition section */
  #include<stdio.h> 
  int flag = 0;
  extern FILE *yyin;
%} 

%token INCLUDE INCLUDEFILES ID IF ELSE INT NUM MAIN END
%token OB CB OCB CCB LT GT EQT SM
%left '<' '>' '{' '}' '(' ')'
%right '='

%%
start: INCLUDE INCLUDEFILES main
;
main:INT MAIN OB CB OCB statements END NUM SM CCB
;
statements:INT ID EQT NUM SM 
;
%%

int main(int argc, char *argv[])
{
  yyin = fopen(argv[1], "r");
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
   flag=1; 
}

