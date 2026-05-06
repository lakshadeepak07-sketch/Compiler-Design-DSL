%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token NUMBER IDENTIFIER PRINT
%token PLUS ASSIGN SEMICOLON

%%

program:
    statement
    ;

statement:
    IDENTIFIER ASSIGN expression SEMICOLON
    ;

expression:
      NUMBER
    | NUMBER PLUS NUMBER
    ;

%%

void yyerror(const char *s) {
    printf("Syntax Error\n");
}

int main() {
    printf("Enter DSL code:\n");

    if(yyparse() == 0)
        printf("Valid Statement\n");

    return 0;
}