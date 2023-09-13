all: run

build:
	@mkdir -p build; 
	@nasm -f elf64 mean.asm -o build/mean.o
	@gcc -no-pie -fno-pie -o build/mean build/mean.o

run: build
	@build/mean

clear:
	@rm -rf build