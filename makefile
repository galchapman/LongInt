CC=gcc
CCP=g++
ASM=nasm
LD=ld

ASMFLAGS=-f win64

all: build/main.exe
	build/main.exe

build/main.exe: src/main.c build/longint.o
	$(CC) -o $@ $^ -Isrc/longint/headers

build/longint.o: $(patsubst src/longint/%.asm, build/longint/%.o, $(wildcard src/longint/*.asm))
	ld -o $@ $^

%.a: %.o
	ar rcs $@ $^

%.so: %.o
	$(LD) -shared -o $@ $^

build/%.o: src/%.asm
	$(ASM) $(ASMFLAGS) -o $@ $^

build/%.o: src/%.c
	$(CC) -o $@ -c $^