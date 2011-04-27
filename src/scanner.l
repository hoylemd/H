%{
#include "HScanner.h"

%}

%option noyywrap
%option nounput
%option yylineno
%option noinput

%%

.	{return BAD;}

%%

int getToken()
{
    int placeholder = 0;
	int lineno = 1;
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