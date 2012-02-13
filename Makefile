CC = gcc

all: main.o parser.o lexer.o symboltable.o
	$(CC) main.c parser.o lexer.o symboltable.o -o main

main.o: main.c
	$(CC) -c main.c

symboltable.o: symboltable.c
	$(CC) -c symboltable.c -std=c99 

lexer.o: lexer.c
	$(CC) -c lexer.c

parser.o: parser.c
	$(CC) -c parser.c

lexer.c: lexerdefinition.l
	flex -o lexer.c lexerdefinition.l

parser.c: parserdefinition.y
	bison parserdefinition.y -o parser.c

clean:
	rm -f *.o main lexer.c parser.c
