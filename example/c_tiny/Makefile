#
# Makefile for TINY
# Using flex and yacc
#

CC = gcc

CFLAGS = 

OBJS = y.tab.o lex.yy.o util.o main.o

tiny: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o tiny -ly -ll

main.o: main.c globals.h util.h scan.h parse.h
	$(CC) $(CFLAGS) -c main.c

util.o: util.c util.h globals.h y.tab.h
	$(CC) $(CFLAGS) -c util.c

lex.yy.c: tiny.l
	flex tiny.l

lex.yy.o: lex.yy.c globals.h util.h y.tab.h
	$(CC) $(CFLAGS) -c lex.yy.c

y.tab.c: tiny.y
	yacc -d tiny.y

y.tab.o: y.tab.c globals.h util.h scan.h parse.h
	$(CC) $(CFLAGS) -c y.tab.c

clean:
	rm -f tiny $(OBJS) lex.yy.c y.tab.h y.tab.c
