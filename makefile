all: H

H: scanner src/H.c src/Scanner.h src/H.h
	cc src/H.c src/lex.yy.c -o bin/H -Wall -pedantic

scanner: src/H.l src/HScanner.h
	flex -t src/H.l > src/lex.yy.c

clean:
	rm -f -r bin/* src/lex.yy.c *~ src/*~