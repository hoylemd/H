all: H

H: scanner src/H.c src/Hlex.h
	cc src/H.c src/lex.yy.c -o bin/H -Wall -pedantic

scanner: src/H.l
	flex -t src/H.l > src/lex.yy.c

clean:
	rm -f -r bin/* src/lex.yy.c *~