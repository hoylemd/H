%{
#include "HScanner.h"

%}

letter		[a-zA-Z] 
digit		[0-9]
whitespace	[ \t]+

%option noyywrap
%option nounput
%option yylineno
%option noinput

%%


int							{return INT;} 		/* type tokens */
char						{return CHAR;}
float						{return FLOAT;}
boolean						{return BOOLEAN;}

{letter}+					{return ID;}		/* constant tokens */
{digit}+					{return LITERALINT;}

;							{return ENDOFLINE;}	/* syntax tokens */

[\ \t]+						{/* ignore whitespace */}
.							{return BAD;}		/* bookeeping tokens */

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