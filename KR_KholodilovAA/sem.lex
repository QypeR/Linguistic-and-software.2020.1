%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
#define INTEGER 288
//extern YYSTYPE yylval;
%}

%%

[0-9]+ 			yylval=strdup(yytext);return CONSTANT;
("Var") 		yylval=strdup(yytext);return KEY_VAR;
([a-zA-Z])+ 	yylval=strdup(yytext);return IDENTIFIER;
(\*){1} 		yylval=strdup(yytext);return MULTIPLY;
(\/){1} 		yylval=strdup(yytext);return DIVIDE;
(\-){1} 		yylval=strdup(yytext);return MINUS;
(\+){1} 		yylval=strdup(yytext);return PLUS;
(\,){1} 		yylval=strdup(yytext);return COMMA;
(\=){1} 		yylval=strdup(":=");return ASSIGN;
(\(){1}			yylval=strdup(yytext);return OPN_BRACKET;
(\)){1} 		yylval=strdup(yytext);return CLS_BRACKET;
(\;\n){1}		yylval=strdup(yytext);return DELIMITER;
[ \t]+
%%

int yywrap()

{

return 1;

}
