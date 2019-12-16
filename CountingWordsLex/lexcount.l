%{ 
#include<stdio.h> 
#include<string.h>
extern FILE *yyin;
int count_words = 0; 
%} 
  
/* Rules Section*/
%% 
([a-zA-Z0-9])*    {count_words++;} /* Rule for counting number of words*/
"\n" {printf("%d\n", count_words); count_words = 0;} 
%% 
  
int yywrap (void) {} 
  
int main() 
{    
    // Can provide the input through file using 
    // yyin = fopen("count.txt", "r");
    // The function that starts the analysis 
    yylex(); 
    return 0; 
}
