all: run

build:
	@mkdir -p build; 
	@nasm -f elf64 square.asm -o build/square.o
	@gcc -no-pie -fno-pie -o build/square build/square.o

run: build
	@build/square

clear:
	@rm -rf build