%{
    #include <stdio.h>
    #include <ctype.h>

    int lines = 0;
    int spaces = 0;
    int words = 0;
    int characters = 0;
    int in_word = 0;
%}

%%
\n { 
    lines++;
    in_word = 0;
}

[ \t] {
    spaces++;
    in_word = 0;
}

[a-zA-Z0-9_] {
    characters++;  // count only non-space characters
    if (!in_word) {
        words++;
        in_word = 1;
    } 
}

. {
    // Any other character (punctuation, etc)
    characters++; // count it as character (except space/tab which are handled above)
    in_word = 0;
}
%%

int main(void) {
    yyin = fopen("myfile.txt", "r");
    if (!yyin) {
        perror("Error opening file");
        return 1;
    }
    yylex();
    fclose(yyin);
    printf("This file contains:");
    printf("\n\t%d lines", lines);
    printf("\n\t%d spaces", spaces);
    printf("\n\t%d words", words);
    printf("\n\t%d characters\n", characters);
    return 0;
}

int yywrap() {
    return 1;
}
