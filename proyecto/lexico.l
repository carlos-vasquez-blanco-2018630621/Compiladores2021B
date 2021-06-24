%{

 #include <stdio.h>
 #include <stdlib.h>
 #include "sintactico.tab.h"

%}

char	[a-zA-Z_]
digit	[0-9]

%%

{char}({char}|{digit})*	{return ID;}

char	{return WORD;}
digit	{return DIGIT;}
"if"	{return IF;}
"else"	{return ELSE;}
"while" {return WHILE;}
"for"	{return FOR;}
"break"	{return BREAK;}
"void"	{return VOID;}
"return" {return RETURN;}
"const"	{return CONTS;}
"int"	{return INT;}
"float"	{return FLOAT;}
"double" {return DOUBLE;}
"+"	{return '+';}
"-"	{return '-';}
"*"	{return '*';}
"/"	{return '/';}
"<"	{return '<';}
">"	{return '>';}
"="	{return '=';}
":"	{return ':';}
";"	{return ';';}
"("	{return '(';}
")"	{return ')';}
","	{return ',';}
"=="	{return '==';}
">="	{return '>=';}
"<="	{return '<=';}
"!="	{return '!=';}
"||"	{return '||';}
"&&"	{return '&&';}
"["	{return '[';}
"]"	{return ']';}
"{"	{return '{';}
"}"	{return '}';}
"^"	{return '^';}
"."	{return '.';}
.

%%
