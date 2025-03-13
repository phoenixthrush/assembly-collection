all: build run

build:
	as --32 main.s -o main.o
	ld -m elf_i386 main.o -o main

run:
	./main

clean:
	rm -f main.o main