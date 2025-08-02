%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[-+]?[0-9]+ {
    int num = atoi(yytext);
    if (num > 0)
        printf("%s is Positive\n", yytext);
    else if (num < 0)
        printf("%s is Negative\n", yytext);
    else
        printf("%s is Zero\n", yytext);
}

[ \t\n]+    ;   // Ignore whitespace

.           {
    printf("Invalid input: %s\n", yytext);
}

%%
