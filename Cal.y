%{
#include <stdio.h>  
  #define YYSTYPE double /* 将Yacc栈定义为double类型 */
  int yylex();
%}

%token T F LP RP ENTER 

%left OR
%left AND
%right NOT
%left XOR

%%


prog : prog exprp
		 | exprp
		 ;
exprp	: expr ENTER { if($1) printf("The value of the expr is true\n[Boolean Caculator]");else printf("The value of the expr is false\n[Boolean Caculator]");}
;
expr : expr OR expr	{$$ = $1 || $3;}
	| expr AND expr {$$ = $1 && $3;}
	| expr XOR expr {$$ = (! $1) && $3 || $1 && (! $3);}
	| NOT expr %prec NOT{$$ = ! $2;}
	| LP expr RP {$$ = $2;}
	| T  {$$ = 1;}
	| F  {$$ = 0;}
	;
%%


main(void){
	printf("---------This is a Boolean Caculator---------\n");
	printf("---------&&: Logic AND---------\n");
	printf("---------||: Logic OR ---------\n");
	printf("---------! : Logic NOT---------\n");
	printf("---------@ : Logic XOR---------\n");
    printf("Type a Boolean expression followed by ENTER.\n");
	printf("A example: !true && false\n");
	printf("Type 'ctrl + c' to END.\n");
    printf("\n");
    return(yyparse());          /* Start the parser */
}
 
yyerror(s)
char *s; {
    printf("yacc error: %s\n", s);
}
 
yywrap(){
    return(0);
}
