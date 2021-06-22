
%{

#include  "sintactico.tab.h"

%}

DIGITO [0-9]
ID [a-zA-Z]+

%%

{DIGITO}+("."{DIGITO}+)?	{ yylval.real = atof(yytext); return (TKN_NUM);}

"=" { return (TKN_ASIGN); }

"+" { return (TKN_MAS); }

"-" { return (TKN_MENOS); }

"*" { return (TKN_POR); }

"/" { return (TKN_DIV); }

"(" { return (TKN_PA); }

")" { return (TKN_PC); }

"cos" { return (TKN_COS); }

"sen" { return (TKN_SEN); }

"print" { return print; }

{ID} { yylval.id = strdup(yytext); return (TKN_VAR); }

"\n" { return '\n'; }

.
%%


