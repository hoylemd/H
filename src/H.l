%{
#include "Hlex.h"

%}

%option noyywrap
%option nounput
%option yylineno
%option noinput

%%

%%

int getToken()
{
    int placeholder = 0;
	int lineno = 0;
    static int firstTime = TRUE;
    
    if (firstTime)
    {
		firstTime = FALSE;
		lineno++;
		yyin = source;
		yyout = out;
    }
	
	/* grab the next token */
    placeholder = yylex();
    
    return placeholder;
}