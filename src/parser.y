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

/* Syntax tokens */
%token ENDOFLINE

/* type tokens */
%token INT CHAR FLOAT BOOLEAN

/* constant/literal tokens */
%token ID LITERALINT
%%

program :
	declaration_list
	;

declaration_list:
	declaration_list declaration
	| 
	declaration
	;
	
declaration :
	variable_declaration
	;
	/*
	|
	function_declaration
	|
	struct_declaration
	;
	 */ 
	
variable_declaration :
	type_specifier initializations ENDOFLINE
	;
	
type_specifier :
	/*signing size*/ primitive
	;
	
primitive :
	INT
	|
	CHAR
	|
	FLOAT
	|
	BOOLEAN
	;
	
initializations :
	ID
	;
	/*
Grammar:
1)	program -> 				declaration_list
2)	declaration_list -> 	declaration_list_declaration
| declaration
3)	declaration ->			variable_declaration
| function_declaration
| struct_declaration
4)	variable_declaration ->	type_specifier initializatons ;
5)	type_specifier ->		signing size primitive
| STRUCT ID
7)	signing					UNSIGNED
| SIGNED
|
8)	size					size LONG
|
9)	primitive				INT
| CHAR
| FLOAT
| BOOLEAN
10)	initializatons			initializations, assignment
| initialization
11) assigmment				pointeropp ID array_specification <= expression
| pointeropp ID array_specification
12) pointeropp				@
|
13) array_specification		index_reference
|
14) index_reference			[ LITERALINT ]
15) struct_declaration		STRUCT ID { local_declarations } ;
16) local_declarations		local_declarations variable_declaration
|
17) function_declaration    type_specifier ID ( parameters ) compound_statement
18) parameters				parameter_list
| VOID
19) parameter_list			parameter_list , parameter
| parameter
20)	parameter				type_specifier pointer_declaration ID abstract_array
21) abstract_array			[ ]
|
22) compound_statement		{ local_declarations statement_list }
| statement
23) statement_list			statement_list statement
| statement
34) statement				expression_statement
| branch_statement
| loop_statement
| control_statement
35) expression_statement	assignment ;
| expression ;
36) expression				additive_expression relop additive_expression
additive_expression
37) relop					<=
|<
|>
|>=
|=
|<>
38) additive_expression		additive_expression addop term
| term
39) addop					+
| -
40) term					term mulop factor
| factor
41) factor					( expression )
| incrementor
| call
| constant
42) incrementor				incopp reference incopp
43) incopp					++
| --
|
44) reference				unaryopp variable
| variable
45) unaryopp				&
| pointeropp
46) variable				ID array_specification
| ID -> variable
47) call					ID ( arguments )
48) arguments				argument_list
|
49) argument_list			argument_list , expression
| expression
50) constant				LITERALINT
| LITERALFLOAT
| LITERALCHAR
*/
