%{
 
#include <stdio.h>
	
	void yyerror(char *mensaje){
		printf("error: %s\n", mensaje);
	}
%}

%token NUMERO

%%

entrada: %empty
;
entrada: entrada linea
;
linea: '\n'
;
linea: expresion '\n'	{printf("\nResultado: %d \n", $1 );}
;
expresion: NUMERO			{$$ = $1;}
;
expresion: expresion expresion '+'	{$$ = $1 + $2;}
;
expresion: expresion expresion '*'	{$$ = $1 * $2;}
;
expresion: expresion expresion '-'	{$$ = $1 - $2;}
;
expresion: expresion expresion '/'	{$$ = $1 / $2;}
;

%%

int main(){
	
 yyparse(); //disparar el analizador sintáctico
 return 0;
}

