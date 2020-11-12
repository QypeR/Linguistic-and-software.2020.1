%{
#include <stdio.h>
#include "y.tab.h"
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
#define INTEGER 288
%}

%%

[0-9]+ 			return CONSTANT;
("Var") 		return KEY_VAR;
([a-zA-Z])+ 	return IDENTIFIER;
(\*){1} 		return MULTIPLY;
(\/){1} 		return DIVIDE;
(\-){1} 		return MINUS;
(\+){1} 		return PLUS;
(\,){1} 		return COMMA;
(\=){1} 		return ASSIGN;
(\(){1} 		return OPN_BRACKET;
(\)){1} 		return CLS_BRACKET;
(\;\n){1} 		return DELIMITER;
[ \t]+
%%

int yywrap()

{

return 1;

}
