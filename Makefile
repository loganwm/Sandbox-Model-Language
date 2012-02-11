CC = gcc

all: main.o parser.o lexer.o
	$(CC) main.c parser.o lexer.o -o main

main.o: main.c
	$(CC) -c main.c

lexer.o: lexer.c
	$(CC) -c lexer.c

parser.o: parser.c
	$(CC) -c parser.c

lexer.c:
	flex -o lexer.c lexerdefinition.l

parser.c:
	bison parserdefinition.y -o parser.c

clean:
	rm *.o
