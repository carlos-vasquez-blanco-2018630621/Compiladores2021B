
%{

#include <stdio.h>
#include <math.h>

	void yyerror(char *mensaje){
		printf("error: %s\n", mensaje);
	}

extern int yylex(void);
extern char *yytext;

float symbolVal(char *symbol);
void updateSymbolVal(char *symbol, float val);
%}

%union{

float real;
char *id;

}

%token <real> TKN_NUM
%token TKN_ASIGN
%token TKN_POR
%token TKN_DIV
%token TKN_MAS
%token TKN_MENOS
%token TKN_PA
%token TKN_PC
%token TKN_COS
%token TKN_SEN
%token <id> TKN_VAR
%token print
%type <real> Exp term
%type <id> assignment

%left TKN_MAS TKN_MENOS
%left TKN_POR TKN_DIV

%%

entrada: %empty
       | entrada linea 
;

linea: '\n'
     |  Exp { printf("%.3f\n", $1); }
     |  assignment  {;}
     |  print Exp { printf("printing %.2f\n", $2);}
;

assignment: TKN_VAR TKN_ASIGN Exp {updateSymbolVal($1,$3);}

Exp: term  			{$$ = $1;}
   | TKN_VAR TKN_PA Exp TKN_PC	{$$ = $3;}
   | Exp TKN_MAS term 		{$$ = $1 + $3;}
   | Exp TKN_MENOS term		{$$ = $1 - $3;}
   | Exp TKN_POR term		{$$ = $1 * $3;}
   | Exp TKN_DIV term		{$$ = $1 / $3;}
   | TKN_PA Exp TKN_PC		{$$ = $2;}
   | TKN_COS TKN_PA Exp TKN_PC	{$$ = cos($3);}
   | TKN_SEN TKN_PA Exp TKN_PC	{$$ = sin($3);}
;
term: TKN_NUM	{$$ = $1;}
    | TKN_VAR	{$$ = symbolVal($1);}
;


%%
//---------------
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

struct nodo{
 char *id;
 float valor;
 
 struct nodo *siguiente;
};

struct nodo *fondo = NULL;
struct nodo *raiz = NULL;

float symbolVal(char *symbol){
  
struct nodo *recorre = raiz;

while(recorre != NULL){
	if(strcmp(recorre->id, symbol) == 0){
		return recorre->valor;
	}
	recorre = recorre->siguiente;
  }
  return -1;
}

void updateSymbolVal(char *symbol, float val){
  
  struct nodo *recorre = raiz; 

  bool isInLista = false;  

  while(recorre != NULL){
  	if(strcmp(recorre->id,symbol) == 0){
		recorre->valor = val;
		isInLista = true;
		break;	
	}
	recorre = recorre->siguiente;
  }

  if(isInLista == false){
  	struct nodo *nuevo;
	nuevo = malloc(sizeof(struct nodo));
	nuevo->id = symbol;
	nuevo->valor = val;
	nuevo->siguiente = NULL;
	
	if(raiz == NULL){
		raiz = nuevo;
		fondo = nuevo;
	}else{
		fondo->siguiente = nuevo;
		fondo = nuevo;
	}
  }else
  	isInLista = false;

}

//----------------
int main(){
  yyparse();
  return 0;
}
