%{
#include <stdio.h>
extern FILE* yyin;
int yylex(void);
%}

%%
[0-9]+ 			printf("CONSTANT ");
("Var") 		printf("KEY_VAR ");
("Begin") 		printf("KEY_BEGIN ");
("End") 		printf("KEY_END ");
([a-zA-Z])+ 	printf("IDENTIFIER ");
(\*){1} 		printf("MULTIPLY ");
(\/){1} 		printf("DIVIDE ");
(\,){1} 		printf("COMMA ");
(\=){1} 		printf("ASSIGN ");
(\-){1} 		printf("MINUS ");
(\+){1} 		printf("PLUS ");
(\(){1} 		printf("OPN_BRACKET ");
(\)){1} 		printf("CLS_BRACKET ");
(\;){1} 		printf("DELIMITER ");
\n
[ \t]+
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("program.txt","r");
    yylex();
    fclose(yyin);
    return 0;
}
