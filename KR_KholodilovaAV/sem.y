%{
#include <stdio.h>
#include <string.h>
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
#define INTEGER 288
extern YYSTYPE yylval;
extern FILE* yyin;
void yyerror (const char *str);
int yylex(void);
%}

%token CONSTANT IDENTIFIER KEY_VAR KEY_BEGIN KEY_END MULTIPLY DIVIDE MINUS PLUS SEMICOLON COMMA ASSIGN OPN_BRACKET CLS_BRACKET DELIMITER

%%

PROGRAM:
	VARIABLE_DECLARATION DESCRIPTION_OF_CALCULATION
;

DESCRIPTION_OF_CALCULATION:
	KEY_BEGIN ASSIGNMENT_LIST KEY_END
        {printf("%s",$2);}
;

VARIABLE_DECLARATION:
	KEY_VAR VARIABLE_LIST DELIMITER
	{printf("%s%s",$1," "); printf($2); printf($3); printf("%s","\n");}
;

VARIABLE_LIST:
	IDENTIFIER
	| IDENTIFIER COMMA VARIABLE_LIST {$$ = strcat($1,$2); $$ = strcat($$," "); $$ = strcat($$,$3);}
;

ASSIGNMENT_LIST:
	ASSIGNMENT {$$=strcat($1,"");}	
	| ASSIGNMENT ASSIGNMENT_LIST {$$=strcat($1,$2);}
;

ASSIGNMENT:
	IDENTIFIER ASSIGN EQUATION DELIMITER
	{$$ = strcat($1," "); $$ = strcat($$,$2); $$ = strcat($$," "); $$ = strcat($$,$3); $$ = strcat($$,$4); $$ = strcat($$,"\n");}
;

EQUATION:
	UNARY_OPERATION SUB_EQUATION {$$ = strcat($1,$2);}
	| SUB_EQUATION
;

SUB_EQUATION:
	OPN_BRACKET EQUATION CLS_BRACKET {$$ = strcat($1,$2); $$ = strcat($$,$3);}
	| OPERAND
	| SUB_EQUATION BINARY_OPERATION SUB_EQUATION {$$ = strcat($1,$2); $$ = strcat($$,$3);}
;

UNARY_OPERATION:
	MINUS
;

BINARY_OPERATION:
	MULTIPLY
	| DIVIDE
	| PLUS
	| MINUS
;

OPERAND:
	CONSTANT
	| IDENTIFIER
;

%%

void yyerror (const char *str)

{

fprintf(stderr,"Error: %s\n",str);

}

int main()

{

yyin = fopen("program.txt","r");

yyparse();

fclose(yyin);

return 0;

}