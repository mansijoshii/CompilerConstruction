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
    // The function that starts the analysis 
    //yyin = fopen("count.txt", "r");
    yylex(); 
    return 0; 
}