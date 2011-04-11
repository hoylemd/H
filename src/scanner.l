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


int							{return INT; colNum += strlen(yytext);} 		/* type tokens */
char						{return CHAR;colNum += strlen(yytext);}
float						{return FLOAT;colNum += strlen(yytext);}
boolean						{return BOOLEAN;colNum += strlen(yytext);}

{letter}+					{return ID;colNum += strlen(yytext);}		/* constant tokens */
{digit}+					{return LITERALINT;colNum += strlen(yytext);}

;							{return ENDOFLINE;colNum += strlen(yytext);}	/* syntax tokens */

{whitespace}				{/* ignore whitespace */colNum += strlen(yytext);}
\n							{lineNum++; colNum = 0;}
.							{return BAD;colNum += strlen(yytext);}		/* bookeeping tokens */

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