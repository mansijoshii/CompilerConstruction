%{
  #include <stdio.h>
  #include "y.tab.h"
%}

digit	[0-9]
letter [a-zA-Z_]

%%
if return IF;         
else return ELSE;			
int	return INT;
main return MAIN;
return return END;					   	   
{digit}+ return NUM;
{letter}({letter}|{digit})* return ID;
[ \t] ;
[ \n] ; 
"("	return OB;
")"	return CB;
"{" return OCB;
"}" return CCB;
"<" return LT;
">" return GT;
"=" return EQT;
";" return SM;
"#include" return INCLUDE;
"<stdio.h>" return INCLUDEFILES;    
%%

int yywrap() {}


