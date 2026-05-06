%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%

"print"        { return PRINT; }

[0-9]+         {
                    yylval = atoi(yytext);
                    return NUMBER;
                }

[a-zA-Z]+      { return IDENTIFIER; }

"+"            { return PLUS; }
"="            { return ASSIGN; }
";"            { return SEMICOLON; }

[ \t\n]        ;

.              { return yytext[0]; }

%%

int yywrap() {
    return 1;
}