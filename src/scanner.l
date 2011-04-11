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

{letter}({letter}|{digit})*	{return ID;}		/* constant tokens */
{digit}+					{return LITERALINT;}

;							{return ENDOFLINE;}	/* syntax tokens */

.							{return BAD;}		/* bookeeping tokens */
{whitespace}				{/*ignore whitespace */}
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