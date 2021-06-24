%{
	#include <stdio.h>
	#include <stdlib.h>
	void yyerror(char *msj){
		printf("Error: %s\n",msj);
	}
%}

%token IF ELSE WHILE FOR BREAK VOID RETURN
%token CONST INT FLOAT DOUBLE

%token ID

%%

entrada: %empty
	| entrada linea
;

linea: tipo WORD ';'
;

tipo: INT | FLOAT | DOUBLE
;

linea:	exp '=' exp '+' exp ';'	{printf("Suma");}  
	| exp '=' exp '-' exp ';' {printf("resta");}  
	| exp '=' exp '*' exp ';' {printf("multi");}
	| exp '=' exp '/' exp ';' {printf("div");}
;

exp : DIGIT | ID
;

linea: fun '(' WORD ')' '{'
;

fun: IF | FOR | WHILE
;
