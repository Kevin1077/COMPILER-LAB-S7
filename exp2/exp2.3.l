%{
	#include<stdio.h>
	#include<ctype.h>
%}

%%
abc {
	printf("ABC");
}

. {
	putchar(yytext[0]);
}
%%

int main() {
	printf("Enter the String: ");
	yylex();
	printf("\nThe converted text: "); // Added output formatting
	return 0;
}

int yywrap() {
	return(1);
}
