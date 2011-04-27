CCFLAGS = -Wall -pedantic

all: H

full: clean scanner parser src/main.c src/Scanner.h src/Parser.h src/main.h
	cc -c src/scanner.c -g -o bin/scanner.o $(CCFLAGS)
	cc -c src/parser.c -o bin/parser.o $(CCFLAGS)
	cc -c src/main.c -o bin/main.o $(CCFLAGS)
	cc bin/main.o bin/scanner.o bin/parser.o -o bin/H $(CCFLAGS)
	cp bin/H .

H: scanner parser src/main.c src/Scanner.h src/Parser.h src/main.h
	cc src/main.c src/scanner.c src/parser.c -g -o bin/H $(CCFLAGS)
	cp bin/H .

scanner: src/scanner.l src/HScanner.h
	flex -t src/scanner.l > src/scanner.c

parser: src/parser.y src/HParser.h
	yacc -d src/parser.y -o src/parser.c

clean:
	rm -f -r bin/* src/scanner.c src/*~ *~ src/parser.c src/parser.h H