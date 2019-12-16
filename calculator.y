%{ 
   /* Definition section */
  #include<stdio.h> 
  int flag=0; 
%} 
  
%token NUMBER 

/* Setting precedence */  
%left '+' '-'
  
%left '*' '/' '%'
  
%left '(' ')'
  
/* Rule Section */
%% 
  
ArithmeticExpression: E{ 
  
    printf("Result=%d\n", $$); 
    return 0; 
};

 E:E'+'E {$$=$1+$3;} 
  
 |E'-'E {$$=$1-$3;} 
  
 |E'*'E {$$=$1*$3;} 
  
 |E'/'E {$$=$1/$3;} 
  
 |E'%'E {$$=$1%$3;} 
  
 |'('E')' {$$=$2;} 
  
 | NUMBER {$$=$1;} 
  
 ; 
  
%% 
  
//driver code 
int main () 
{ 
   printf("Enter Any Arithmetic Expression to be evaluated\n"); 
   yyparse(); 
   return 0;
} 
  
yyerror (char *s) 
{ 
   printf("Arithmetic expression entered is invalid\n"); 
   flag=1; 
}