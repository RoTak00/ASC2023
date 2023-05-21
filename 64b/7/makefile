p: p.o
	gcc -o p p.o -no-pie -g
p.o: p.asm
	nasm -f elf64 -g -F dwarf p.asm -l p.lst -g