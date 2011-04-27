/* H.y */

%{
	#include "HParser.h"


	/* Error handling routine */
	int yyerror(const char *str)
	{
		/* print out the error */
		fprintf(stderr,"error: %s on line %d\n", str, lineno);
		
		return 0;
	}

%}

/* tokens */

/* bookkeeping tokens */
%token BAD

%%

/* root rule */
program:
	BAD
	|
	program BAD
	;