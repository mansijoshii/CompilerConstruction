%{
  #include <stdio.h>
  #include "y.tab.h"
%}

digit	[0-9]
letter [a-zA-Z_]

%%
int	return INT;
main return MAIN;
return return END;
if return IF;         
else return ELSE;
do return DO;
while return WHILE;
switch return SWITCH;
case return CASE;								   	   
{digit}+ return NUM;
{letter}({letter}|{digit})* return ID;
[ \t] ;
[ \n] ; 
"("	return OB;
")"	return CB;
"{" return OCB;
"}" return CCB;
"<" return OP;
">" return OP;
"=" return EQT;
";" return SM;
":" return CL;
"#include" return INCLUDE;
"<stdio.h>" return INCLUDEFILES;    
%%

int yywrap() {}


